CREATE DATABASE University;

USE University;


-- Question Four
CREATE TABLE Courses (
	courseId int primary key not null,
	courseName varchar(30) not null,
)

-- Create table students
CREATE TABLE students (
	fullname varchar(30) not null,
	id int primary key not null,
	age int,
	gender varchar(10),
	courses int FOREIGN KEY REFERENCES Courses(courseId),
);

-- Question 5
INSERT INTO Courses
Values
	(1, 'Math'),
	(2, 'Physics'),
	(3, 'Geography'),
	(4, 'Biology');


-- Question 2
INSERT INTO students
VALUES
	('Joseph', 1, 20, 'Male', 1),
	('Abebe', 2, 21, 'Male', 2),
	('Ayantu', 3, 19, 'Female', 1),
	('Marta', 4, 22, 'Female', 3),
	('Yonas', 5, 21, 'Male', 4);

-- Question 3
SELECT * FROM students;

-- Question 6
SELECT fullname, courses FROM students;

-- Question 8
SELECT * FROM students WHERE gender='Male';

-- Question 7
SELECT * FROM students WHERE courses=1

-- Quesion 9
SELECT * FROM students WHERE age >= 21 AND age <= 23;

-- Question 10
SELECT avg(age) FROM students;

-- Question 11
SELECT min(age), max(age) FROM students;

-- Join Two tables
SELECT fullname, id, age, gender, courseName 
FROM students
INNER JOIN Courses ON students.courses = Courses.courseId

CREATE PROCEDURE GetAllStudent
AS
BEGIN
	SELECT * FROM students
END

EXEC GetAllStudent

CREATE PROCEDURE ReturnInfo @stud_id int
AS
BEGIN
	SELECT id, fullname, gender FROM students
	WHERE id=@stud_id
END

EXEC ReturnInfo @stud_id=2


CREATE PROCEDURE UpdateById @stud_id int, @stud_age int
AS
BEGIN
	UPDATE students SET age=@stud_age WHERE id=@stud_id
END

EXEC UpdateById @stud_id=2, @stud_age=21

CREATE PROCEDURE DeleteById @stud_id int
AS
BEGIN
	DELETE FROM students WHERE id=@stud_id
END

EXEC DeleteById @stud_id=2