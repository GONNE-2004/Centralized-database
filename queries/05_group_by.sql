-- =========================
-- GROUP BY
-- =========================

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