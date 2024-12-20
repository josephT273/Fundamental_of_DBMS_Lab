IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'UniversityLab')
CREATE DATABASE UniversityLab;

USE UniversityLab;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'department' AND xtype = 'U')
CREATE TABLE department(
    dep_name varchar(30) not null,
    dep_code int PRIMARY KEY,
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Student' AND xtype = 'U')
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

-- Join the two table
SELECT studID, studName, dep_name FROM Student JOIN department ON Student.department = department.dep_code WHERE age >= 20;

-- Eleminate duplication
SELECT DISTINCT age FROM Student;

-- Patter matching
SELECT * FROM Student WHERE studName LIKE '%lex%';
SELECT * FROM Student WHERE studName LIKE '_lex%';

SELECT * FROM Student WHERE age BETWEEN 19 AND 21;