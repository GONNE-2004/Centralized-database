# UNIVERSITY OF KIGALI

## DATABASE MANAGEMENT SYSTEM ASSIGNMENT REPORT

### Design and Implementation of a University Database Management System Using PostgreSQL

---

## 1. Introduction

This project involved the design and implementation of a relational database for managing university information using PostgreSQL. The objective was to create a normalized database structure capable of storing and managing information related to faculties, departments, students, lecturers, courses, classrooms, laboratories, research projects, academic events, resources, and enrollments.

The database was designed using SQL and populated with sample data generated from Mockaroo.

---

## 2. Database Design

The database consists of eleven tables:

1. Faculty
2. Department
3. Student
4. Lecturer
5. Course
6. Classroom
7. Laboratory
8. Research_Project
9. Academic_Event
10. Resource
11. Enrollment

Relationships were established using primary keys and foreign keys to maintain referential integrity.

Examples include:

* A department belongs to a faculty.
* Students belong to departments.
* Lecturers belong to departments.
* Courses are offered by departments.
* Research projects are supervised by lecturers.
* Academic events are organized by lecturers.
* Enrollments connect students and courses.

---

## 3. Table Creation

The database tables were created using SQL Data Definition Language (DDL) statements contained in the file:

```text
tables.sql
```

Primary keys and foreign key constraints were defined to ensure consistency and integrity of data.

Example:

```sql
CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE,
    course_name VARCHAR(150),
    credits SMALLINT,
    semester VARCHAR(50),
    department_id INT REFERENCES department(department_id)
);
```

---

## 4. Data Population

Sample records were generated using Mockaroo.

CSV files created include:

* faculty.csv
* department.csv
* student.csv
* lecturer.csv
* course.csv
* classroom.csv
* laboratory.csv
* research_project.csv
* academic_event.csv
* resource.csv
* enrollment.csv

The data was imported into PostgreSQL using the `\copy` command.

Example:

```sql
\copy student FROM 'student.csv' DELIMITER ',' CSV HEADER;
```

This method allowed efficient loading of large datasets.

---

## 5. SQL Queries

Different categories of SQL queries were implemented and stored inside the queries folder.

### a) Simple SELECT Statements

Used to retrieve records from tables.

Example:

```sql
SELECT * FROM student;
```

---

### b) Filtering Queries

Used with the WHERE clause.

Example:

```sql
SELECT *
FROM course
WHERE credits >= 4;
```

---

### c) Sorting

Used ORDER BY to arrange records.

Example:

```sql
SELECT *
FROM student
ORDER BY last_name;
```

---

### d) Aggregate Functions

Functions such as COUNT(), AVG(), MIN(), and MAX() were used.

Example:

```sql
SELECT COUNT(*)
FROM student;
```

---

### e) GROUP BY

Used to summarize information.

Example:

```sql
SELECT department_id,
       COUNT(*)
FROM student
GROUP BY department_id;
```

---

### f) JOIN Operations

JOINs were used to combine information from multiple tables.

Example:

```sql
SELECT s.first_name,
       s.last_name,
       d.department_name
FROM student s
JOIN department d
ON s.department_id = d.department_id;
```

---

### g) Multiple Table Joins

Three-table joins were implemented to retrieve student enrollment information.

Example:

```sql
SELECT s.first_name,
       s.last_name,
       c.course_name,
       e.grade
FROM enrollment e
JOIN student s
ON e.student_id = s.student_id
JOIN course c
ON e.course_id = c.course_id;
```

---

### h) HAVING Clause

Used to filter grouped data.

Example:

```sql
SELECT grade,
       COUNT(*)
FROM enrollment
GROUP BY grade
HAVING COUNT(*) > 10;
```

---

### i) DISTINCT Queries

Used to eliminate duplicate values.

Example:

```sql
SELECT DISTINCT semester
FROM course;
```

---

## 6. Indexing

Indexes were created to improve query performance.

The index statements were stored in:

```text
indexes.sql
```

Examples:

```sql
CREATE INDEX idx_student_department
ON student(department_id);

CREATE INDEX idx_course_department
ON course(department_id);

CREATE INDEX idx_enrollment_student
ON enrollment(student_id);
```

Indexes improve searching and reduce query execution time.

---

## 7. Query Optimization Using EXPLAIN ANALYZE

The EXPLAIN ANALYZE command was used to study query execution plans and evaluate performance.

Examples:

```sql
EXPLAIN ANALYZE
SELECT *
FROM student
WHERE department_id = 3;
```

and

```sql
EXPLAIN ANALYZE
SELECT *
FROM course
WHERE credits >= 4;
```

EXPLAIN ANALYZE provided information regarding:

* Sequential scans
* Index scans
* Execution time
* Query cost
* Number of rows processed

These results help determine whether indexes are being used effectively.

---

## 8. Project Organization

The project directory was organized as follows:

```text
postgres_assign
│
├── tables.sql
├── faculty.csv
├── department.csv
├── student.csv
├── lecturer.csv
├── course.csv
├── classroom.csv
├── laboratory.csv
├── research_project.csv
├── academic_event.csv
├── resource.csv
├── enrollment.csv
│
├── queries/
├── indexes/
├── explain/
│
└── report.md
```

This structure made the project easier to maintain and execute.

---

## 9. Challenges Encountered

Several challenges were encountered during implementation:

* Permission issues while importing CSV files.
* Data type mismatches between CSV files and table definitions.
* Duplicate values violating unique constraints.
* Incorrect column ordering during data import.
* Errors generated by Mockaroo AI fields.
* Duplicate index creation attempts.

These problems were resolved using PostgreSQL commands such as:

* ALTER TABLE
* TRUNCATE
* DROP INDEX
* CREATE INDEX IF NOT EXISTS
* \copy

---

## 10. Conclusion

This project demonstrated the practical implementation of a relational database using PostgreSQL. Tables were successfully created and populated, relationships were established through foreign keys, and various SQL operations were performed to retrieve and analyze data.

Indexing and EXPLAIN ANALYZE were used to study and improve query performance. The project provided practical experience in database design, SQL programming, data population, and query optimization.
