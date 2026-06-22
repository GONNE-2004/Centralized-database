-- =========================
-- AGGREGATE FUNCTIONS
-- =========================

SELECT COUNT(*) AS total_students
FROM student;

SELECT COUNT(*) AS total_courses
FROM course;

SELECT AVG(credits) AS average_credits
FROM course;

SELECT MIN(capacity) AS smallest_classroom
FROM classroom;

SELECT MAX(capacity) AS largest_classroom
FROM classroom;