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