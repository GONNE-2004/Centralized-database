-- =========================
-- INNER JOINS
-- =========================

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