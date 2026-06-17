CREATE TABLE faculty (
    faculty_id SERIAL PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL
);

CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    faculty_id INT REFERENCES faculty(faculty_id)
);

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    address TEXT,
    enrollment_year INT,
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE lecturer (
    lecturer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    rank VARCHAR(50),
    specialization VARCHAR(100),
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE,
    course_name VARCHAR(100),
    credits INT,
    semester INT,
    department_id INT REFERENCES department(department_id)
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    course_id INT REFERENCES course(course_id),
    academic_year VARCHAR(20),
    semester INT,
    grade VARCHAR(2)
);

CREATE TABLE classroom (
    classroom_id SERIAL PRIMARY KEY,
    room_number VARCHAR(20),
    capacity INT,
    building VARCHAR(50)
);

CREATE TABLE laboratory (
    laboratory_id SERIAL PRIMARY KEY,
    lab_name VARCHAR(100),
    capacity INT,
    equipment TEXT
);

CREATE TABLE research_project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    start_date DATE,
    end_date DATE,
    status VARCHAR(30),
    lecturer_id INT REFERENCES lecturer(lecturer_id)
);

CREATE TABLE academic_event (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    venue VARCHAR(100),
    organizer_id INT REFERENCES lecturer(lecturer_id)
);

CREATE TABLE resource (
    resource_id SERIAL PRIMARY KEY,
    resource_name VARCHAR(100),
    quantity INT,
    department_id INT REFERENCES department(department_id)
);