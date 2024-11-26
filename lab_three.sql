CREATE DATABASE University;

USE University;


CREATE TABLE students(
	stud_id varchar(20) primary key,
	stud_name varchar(30) not null,
	stud_age int,
	stud_gender varchar(30),
	cources varchar(30)
);

INSERT INTO students
VALUES ('1', 'John', 20, 'Male', 'Database'),
		('2', 'Jane', 21, 'female', 'Java'),
		('3', 'Nethan', 19, 'Male', 'C++'),
		('4', 'Ibrahim', 20, 'Male', 'Database'),
		('5', 'Sera', 19, 'female', 'Java')


SELECT * FROM students;

SELECT count(*) FROM students;

SELECT MIN(stud_age), MAX(stud_age), AVG(stud_age) FROM students;

SELECT * FROM students WHERE stud_gender = 'male';


SELECT count(*) FROM students WHERE stud_gender = 'male';

SELECT count(distinct stud_age) FROM students;

UPDATE students SET cources='Database' WHERE stud_id='5'