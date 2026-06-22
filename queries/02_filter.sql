-- =========================
-- FILTERING
-- =========================

SELECT *
FROM student
WHERE enrollment_year = 2024
LIMIT 30;

SELECT *
FROM course
WHERE credits >= 4
LIMIT 30;

SELECT *
FROM lecturer
WHERE rank = 'Professor'
LIMIT 20;

SELECT *
FROM research_project
WHERE status = 'Active'
LIMIT 20;