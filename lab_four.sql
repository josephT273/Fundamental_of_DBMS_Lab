USE LabExam;

SELECT * FROM students;
SELECT * FROM Courses;


SELECT students.fullname, students.gender, Courses.courseName FROM students INNER JOIN
Courses ON (students.courses = Courses.courseId)

SELECT students.fullname, students.gender, Courses.courseName FROM students LEFT JOIN
Courses ON (students.courses = Courses.courseId)

SELECT students.fullname, students.gender, Courses.courseName FROM students RIGHT JOIN
Courses ON (students.courses = Courses.courseId)

SELECT students.fullname, students.gender, Courses.courseName FROM students FULL JOIN
Courses ON (students.courses = Courses.courseId)

SELECT courses, fullname FROM students UNION ALL SELECT courseId, courseName FROM Courses;

SELECT * FROM students WHERE courses=1
INTERSECT
SELECT * FROM students WHERE age=19;
