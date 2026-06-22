-- =====================================
-- SIMPLE SELECT
-- =====================================

SELECT * FROM faculty;
SELECT * FROM department;
SELECT * FROM student LIMIT 30;
SELECT * FROM lecturer LIMIT 20;
SELECT * FROM course LIMIT 30;

-- =====================================
-- FILTERING
-- =====================================

SELECT *
FROM student
WHERE enrollment_year = 2024
LIMIT 30;

SELECT *
FROM course
WHERE credits >= 4
LIMIT 30;

SELECT *
FROM research_project
WHERE status = 'Active'
LIMIT 20;

-- =====================================
-- SORTING
-- =====================================

SELECT *
FROM student
ORDER BY last_name
LIMIT 30;

SELECT *
FROM course
ORDER BY credits DESC
LIMIT 30;

-- =====================================
-- AGGREGATE FUNCTIONS
-- =====================================

SELECT COUNT(*) AS total_students
FROM student;

SELECT COUNT(*) AS total_courses
FROM course;

SELECT AVG(credits)
FROM course;

SELECT MIN(capacity)
FROM classroom;

SELECT MAX(capacity)
FROM classroom;

-- =====================================
-- GROUP BY
-- =====================================

SELECT department_id,
       COUNT(*) AS number_of_students
FROM student
GROUP BY department_id;

SELECT department_id,
       COUNT(*) AS number_of_courses
FROM course
GROUP BY department_id;

SELECT grade,
       COUNT(*) AS occurrences
FROM enrollment
GROUP BY grade;

-- =====================================
-- INNER JOINS
-- =====================================

SELECT s.first_name,
       s.last_name,
       d.department_name
FROM student s
JOIN department d
ON s.department_id = d.department_id
LIMIT 30;

SELECT l.first_name,
       l.last_name,
       d.department_name
FROM lecturer l
JOIN department d
ON l.department_id = d.department_id
LIMIT 20;

SELECT c.course_name,
       d.department_name
FROM course c
JOIN department d
ON c.department_id = d.department_id
LIMIT 30;

-- =====================================
-- MULTIPLE TABLE JOINS
-- =====================================

SELECT s.first_name,
       s.last_name,
       c.course_name,
       e.grade
FROM enrollment e
JOIN student s
ON e.student_id = s.student_id
JOIN course c
ON e.course_id = c.course_id
LIMIT 30;

SELECT rp.title,
       rp.status,
       l.first_name,
       l.last_name
FROM research_project rp
JOIN lecturer l
ON rp.lecturer_id = l.lecturer_id
LIMIT 20;

SELECT ae.event_name,
       ae.event_date,
       l.first_name,
       l.last_name
FROM academic_event ae
JOIN lecturer l
ON ae.organizer_id = l.lecturer_id
LIMIT 20;

-- =====================================
-- GROUP BY WITH JOIN
-- =====================================

SELECT d.department_name,
       COUNT(s.student_id) AS total_students
FROM department d
JOIN student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       COUNT(c.course_id) AS total_courses
FROM department d
JOIN course c
ON d.department_id = c.department_id
GROUP BY d.department_name;

-- =====================================
-- HAVING
-- =====================================

SELECT department_id,
       COUNT(*)
FROM student
GROUP BY department_id
HAVING COUNT(*) > 5;

SELECT grade,
       COUNT(*)
FROM enrollment
GROUP BY grade
HAVING COUNT(*) > 10;

-- =====================================
-- SUBQUERIES
-- =====================================

SELECT *
FROM course
WHERE credits =
(
    SELECT MAX(credits)
    FROM course
);

-- =====================================
-- DISTINCT
-- =====================================

SELECT DISTINCT semester
FROM course;

SELECT DISTINCT grade
FROM enrollment;

SELECT DISTINCT specialization
FROM lecturer;