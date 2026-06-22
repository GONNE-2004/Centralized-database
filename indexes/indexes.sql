-- =====================================
-- STUDENT INDEXES
-- =====================================

CREATE INDEX idx_student_department
ON student(department_id);

CREATE INDEX idx_student_enrollment_year
ON student(enrollment_year);

-- =====================================
-- COURSE INDEXES
-- =====================================

CREATE INDEX idx_course_department
ON course(department_id);

CREATE INDEX idx_course_credits
ON course(credits);

-- =====================================
-- ENROLLMENT INDEXES
-- =====================================

CREATE INDEX idx_enrollment_student
ON enrollment(student_id);

CREATE INDEX idx_enrollment_course
ON enrollment(course_id);

CREATE INDEX idx_enrollment_grade
ON enrollment(grade);