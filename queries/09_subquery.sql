-- =========================
-- SUBQUERIES
-- =========================

SELECT *
FROM student
WHERE department_id =
(
    SELECT department_id
    FROM department
    WHERE department_name = 'Computer Science'
)
LIMIT 30;

SELECT *
FROM course
WHERE credits =
(
    SELECT MAX(credits)
    FROM course
)
LIMIT 30;