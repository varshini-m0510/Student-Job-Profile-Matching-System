import streamlit as st
import mysql.connector
import pandas as pd
import time

# Database connection
def create_connection():
    return mysql.connector.connect(
        host="localhost",  # Update as needed
        user="root",       # Update as needed
        password="user",  # Update as needed
        database="resume_mngmt"  # Replace with your DB name
    )

# Login functionality for Student and Employer
def login_user(username, password, user_type="student"):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    
    if user_type == "student":
        cursor.execute("SELECT * FROM student_login WHERE Username=%s AND Password=%s", (username, password))
    else:
        cursor.execute("SELECT * FROM employer_login WHERE Email=%s AND Password=%s", (username, password))
    
    user = cursor.fetchone()
    conn.close()
    return user

# Display student details
def get_student_details(srn):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Query student table
    cursor.execute("SELECT * FROM student WHERE SRN=%s", (srn,))
    student_info = cursor.fetchone()
    
    # Query academic details
    cursor.execute("SELECT * FROM academic_details WHERE SRN=%s", (srn,))
    academic_details = cursor.fetchone()
    
    # Query achievements
    cursor.execute("SELECT * FROM achievement WHERE SRN=%s", (srn,))
    achievements = cursor.fetchall()
    
    # Query skills
    cursor.execute("SELECT * FROM skills WHERE SRN=%s", (srn,))
    skills = cursor.fetchall()

    # Query experience
    cursor.execute("SELECT * FROM experience WHERE SRN=%s", (srn,))
    experience = cursor.fetchall()
    
    conn.close()
    return student_info, academic_details, experience, achievements, skills

# Add a skill for the student
def add_skill(srn, skill_name, skill_type):
    conn = create_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("INSERT INTO skills (Skill_Name, Type, SRN) VALUES (%s, %s, %s)", 
                       (skill_name, skill_type, srn))
        conn.commit()
        st.success(f"Skill added successfully.")
    except mysql.connector.Error as err:
        if err.errno == 1644:  # Custom error code raised by the trigger
            st.write("<div style='color:red;'>This skill has already been added for the student.</div>", unsafe_allow_html=True)
        else:
            st.write(f"<div style='color:red;'>An unexpected error occurred: {err}</div>", unsafe_allow_html=True)
        time.sleep(20)  # Keep the error message for 20 seconds
        st.empty()  

# Delete a skill for the student
def delete_skill(srn, skill_name):
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM skills WHERE SRN=%s AND Skill_Name=%s", (srn, skill_name))
    conn.commit()
    conn.close()

# Add an achievement for the student
def add_achievement(srn, achievement_name, description):
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO achievement (Achievement_Name, Description, SRN) VALUES (%s, %s, %s)", 
                   (achievement_name, description, srn))
    conn.commit()
    conn.close()

# Delete an achievement for the student
def delete_achievement(srn, achievement_name):
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM achievement WHERE SRN=%s AND Achievement_Name=%s", (srn, achievement_name))
    conn.commit()
    conn.close()

# Retrieve all available skills for multi-select filter
def get_all_skills():
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("CALL get_all_skills()")
    skills = [row[0] for row in cursor.fetchall()]
    conn.close()
    return skills

# Filter students by CGPA and any selected skills
def filter_students(min_cgpa, selected_skills):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    skills_list = ', '.join(selected_skills)  
    cursor.execute("CALL filter_students_by_cgpa_and_skills(%s, %s)", (min_cgpa, skills_list))
    results = cursor.fetchall()
    conn.close()
    return results

def get_avg_ssc_hsc_for_student_department(srn):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        # Nested query to get average SSC and HSC percentages for the logged-in student's department
        query = """
        SELECT Department,
               AVG(SSC_Percent) AS Avg_SSC_Percent, 
               AVG(HSC_Percent) AS Avg_HSC_Percent
        FROM academic_details
        WHERE Department = (SELECT Department FROM academic_details WHERE SRN = %s)
        GROUP BY Department;
        """
        
        # Execute the query with the student's SRN
        cursor.execute(query, (srn,))
        result = cursor.fetchall()
        
    except mysql.connector.Error as err:
        # Print the exact error for debugging
        st.write(f"Error: {err}")
        result = None
    
    # Close connection
    conn.close()
    return result

# Logout function
def logout():
    st.session_state.logged_in = False
    st.session_state.user_info = None
    st.session_state.user_type = None

# Streamlit UI
st.title("Resume Management System")

# Initialize session state variables
if "logged_in" not in st.session_state:
    st.session_state.logged_in = False
    st.session_state.user_info = None
    st.session_state.user_type = None

with st.sidebar:
    st.subheader("User Login")
    user_type = st.selectbox("Select User Type", ["Student", "Employer"])
    username = st.text_input("Username/Email", key="username")
    password = st.text_input("Password", type="password", key="password")
    col1, col2 = st.columns(2)
    if "login_error" not in st.session_state:
        st.session_state.login_error = None
    with col1:
        if st.button("Login"):
            user = login_user(username, password, user_type=user_type.lower())
            if user:
                st.session_state.logged_in = True
                st.session_state.user_info = user
                st.session_state.user_type = user_type
            else:
                st.write(f"<div style='color:red;'>Invalid credentials</div>", unsafe_allow_html=True)

    with col2:
        if st.button("Logout"):
            logout()
            st.write(f"<div style='color:green;'>Logged out succesfully</div>", unsafe_allow_html=True)


# Display Student or Employer Dashboard if logged in
if st.session_state.logged_in and st.session_state.user_info:
    user = st.session_state.user_info
    user_type = st.session_state.user_type
    st.header(f"{user_type} Dashboard")
    st.success(f"Welcome, {user['Username' if user_type == 'Student' else 'Email']}!")
    if user_type == "Student":
        # Student dashboard code remains the same
        srn = user["SRN"]
        
        # Load student details
        student_info, academic_details, experience, achievements, skills = get_student_details(srn)
        
        st.header("Student Dashboard")
        
        # Display student information
        st.subheader("Student Information")
        if student_info:
            student_df = pd.DataFrame([student_info])
            st.table(student_df)
        else:
            st.write("No personal details available.")
        
        # Additional Section: Display average SSC and HSC percentages by department
        st.subheader("Average SSC and HSC Percentages by Department")
        avg_ssc_hsc_data = get_avg_ssc_hsc_for_student_department(srn)

        # Convert the results to a DataFrame and display as a table
        if avg_ssc_hsc_data:
            avg_ssc_hsc_df = pd.DataFrame(avg_ssc_hsc_data)
            st.table(avg_ssc_hsc_df)
        else:
            st.write("Unable to retrieve average percentages.")
            
        # Display academic details
        st.subheader("Academic Details")
        if academic_details:
            academic_df = pd.DataFrame([academic_details])
            st.table(academic_df)
        else:
            st.write("No academic details available.")

        # Display experience section
        st.subheader("Experience")
        if experience:
            experience_df = pd.DataFrame(experience)
            st.table(experience_df)
        else:
            st.write("No experience details available.")
        
        # Display achievements section
        st.subheader("Achievements")
        for achievement in achievements:
            st.write(f"- {achievement['Achievement_Name']}: {achievement['Description']}")
            if st.button(f"Delete Achievement: {achievement['Achievement_Name']}"):
                delete_achievement(srn, achievement['Achievement_Name'])
                st.success("Achievement deleted successfully.")
                st.rerun()
        
        new_achievement_name = st.text_input("New Achievement Name")
        new_achievement_desc = st.text_area("New Achievement Description")
        if st.button("Add Achievement"):
            add_achievement(srn, new_achievement_name, new_achievement_desc)
            st.success("Achievement added successfully.")
            st.rerun()
        
        # Display skills section
        st.subheader("Skills")
        for skill in skills:
            st.write(f"- {skill['Skill_Name']} ({skill['Type']})")
            if st.button(f"Delete Skill: {skill['Skill_Name']}"):
                delete_skill(srn, skill['Skill_Name'])
                st.success("Skill deleted successfully.")
                st.rerun()
        
        # Input for adding new skills
        new_skill_name = st.text_input("New Skill Name")
        new_skill_type = st.selectbox("Skill Type", ["Technical", "Non-technical"])
        if st.button("Add Skill"):
            add_skill(srn, new_skill_name, new_skill_type)
            st.success("Skill added successfully.")
            st.rerun()
    
    elif user_type == "Employer":
        # Display Employer Dashboard
        st.header("Employer Dashboard")
        
        # Load available skills for the filter
        available_skills = get_all_skills()
        
        # Form to filter students based on CGPA and skills
        with st.form("job_filter_form"):
            st.subheader("Filter Students by CGPA and Skills")
            job_title = st.text_input("Job Title")
            min_cgpa = st.selectbox("Minimum CGPA", ["5.0", "6.0", "7.0", "8.0", "9.0", "10.0"])
            selected_skills = st.multiselect("Required Skills", available_skills)
            
            submitted = st.form_submit_button("Filter Students")
            
            if submitted:
                min_cgpa = float(min_cgpa)
                qualified_students = filter_students(min_cgpa, selected_skills)
                
                st.subheader("Qualified Students")
                if qualified_students:
                    for student in qualified_students:
                        st.write(f"SRN: {student['SRN']}")
                        st.write(f"Name: {student['Name']}")
                        st.write(f"Degree: {student['Degree']}")
                        st.write(f"CGPA: {student['CGPA']}")
                        st.write(f"Skills: {student['Skills']}")
                        st.markdown("---")
                else:
                    st.write("No students meet the specified criteria.")
