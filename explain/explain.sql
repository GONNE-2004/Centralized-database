-- =====================================
-- STUDENT QUERIES
-- =====================================

EXPLAIN ANALYZE
SELECT *
FROM student
WHERE department_id = 3;

EXPLAIN ANALYZE
SELECT *
FROM student
WHERE enrollment_year = 2024;

-- =====================================
-- COURSE QUERIES
-- =====================================

EXPLAIN ANALYZE
SELECT *
FROM course
WHERE department_id = 4;

EXPLAIN ANALYZE
SELECT *
FROM course
WHERE credits >= 4;

-- =====================================
-- JOIN QUERIES
-- =====================================

EXPLAIN ANALYZE
SELECT s.first_name,
       s.last_name,
       d.department_name
FROM student s
JOIN department d
ON s.department_id = d.department_id;

EXPLAIN ANALYZE
SELECT s.first_name,
       s.last_name,
       c.course_name,
       e.grade
FROM enrollment e
JOIN student s
ON e.student_id = s.student_id
JOIN course c
ON e.course_id = c.course_id;

-- =====================================
-- AGGREGATION
-- =====================================

EXPLAIN ANALYZE
SELECT department_id,
       COUNT(*)
FROM student
GROUP BY department_id;

EXPLAIN ANALYZE
SELECT grade,
       COUNT(*)
FROM enrollment
GROUP BY grade;