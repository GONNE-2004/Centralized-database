-- =========================
-- SORTING
-- =========================

SELECT *
FROM student
ORDER BY last_name
LIMIT 30;

SELECT *
FROM course
ORDER BY credits DESC
LIMIT 30;

SELECT *
FROM lecturer
ORDER BY specialization
LIMIT 20;
