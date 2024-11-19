CREATE DATABASE UniversityLab;

USE UniversityLab;

CREATE TABLE department(
    dep_name varchar(30) not null,
    dep_code int PRIMARY KEY,
);

CREATE TABLE Student (
    studID int PRIMARY KEY,
    studName varchar(20),
    age int check(age >= 0 and age <= 100),
    department int FOREIGN KEY REFERENCES department(dep_code)
);

INSERT INTO department VALUES ('Software Engineering', 1),
        ('Electrical Engineering', 2),
        ('Mechanical Engineering', 3),
        ('Food Process Engineering', 4),
        ('Chemical Engineering', 5),
        ('Information System', 6),
        ('Information Technology', 7)

INSERT INTO Student
    VALUES (011, 'John Doe', 20, 1),
         (012, 'Joe Doe', 21, 2),
         (013, 'Jane Doe', 19, 3),
         (014, 'Alex Joe', 20, 1),
         (015, 'Doe Jane', 22, 2),
         (016, 'Jane Alexi', 13, 3)

-- SELECT STUDENT DATA
SELECT * FROM Student;

-- SELECT DEPARTMENT DATA
SELECT * FROM department;

-- ADD column
ALTER TABLE department ADD location varchar(20) null;

-- SELECT STUDENT DATA WITH DEPATMENT INFORMATION
SELECT * FROM Student JOIN department On Student.department = department.dep_code;

-- SELCTE STUDENTS age >= 20
SELECT studName FROM Student WHERE age >= 20;