IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'University')
CREATE DATABASE University;

USE University;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Student' AND xtype = 'U')
CREATE TABLE Student(
	stud_id varchar(20) primary key,
	stud_name varchar(30) not null,
	age int,
	department varchar(30) 
);

-- Add new column to table
ALTER TABLE Student ADD section varchar(10);

-- Change the data type of table
ALTER TABLE Student ALTER COLUMN section int NOT NULL;

-- Insert data to the database
INSERT INTO Student Values ('ABC/0002/16', 'Joseph Tadesse', 20, 'Software Engineering', 1);
INSERT INTO Student Values ('ABC/0001/16', 'Abenezer Abebe', 21, 'Electrical Engineering', 2);

-- Display all data from databaase
SELECT * FROM Student;


-- SELECT data and order it
SELECT * FROM Student ORDER BY age ASC;

SELECT stud_name FROM Student WHERE stud_id = 'ABC/0002/16';

-- DROP Table 
DROP TABLE Student;

-- Remove all data from database
TRUNCATE TABLE Student;