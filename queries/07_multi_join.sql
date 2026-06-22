-- =========================
-- MULTIPLE TABLE JOINS
-- =========================

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