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
         (013, 'Jane Doe', 19, 3)

SELECT * FROM Student JOIN department On Student.department = department.dep_code;