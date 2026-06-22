-- =========================
-- HAVING
-- =========================

SELECT department_id,
       COUNT(*) AS student_count
FROM student
GROUP BY department_id
HAVING COUNT(*) > 5;

SELECT grade,
       COUNT(*) AS occurrences
FROM enrollment
GROUP BY grade
HAVING COUNT(*) > 10;