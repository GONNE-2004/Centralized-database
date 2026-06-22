CREATE INDEX idx_enrollment_student
ON enrollment(student_id);

CREATE INDEX idx_enrollment_course
ON enrollment(course_id);

CREATE INDEX idx_enrollment_grade
ON enrollment(grade);