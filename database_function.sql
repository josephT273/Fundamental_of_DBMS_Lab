CREATE DATABASE EMP;

use EMP;

create table employee(
	id int primary key,
	fname varchar(20),
	sex char,
	salary int
);

CREATE TABLE Student (
    studID INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    sex CHAR(1) CHECK (sex IN ('M', 'F'))
);

CREATE TABLE Stud_Grade (
    studID INT,
    courseNo VARCHAR(20) NOT NULL,
    CourseTitle VARCHAR(100) NOT NULL,
    CrHr INT CHECK (CrHr > 0),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F')),
    PRIMARY KEY (studID, courseNo),
    FOREIGN KEY (studID) REFERENCES Student(studID) ON DELETE CASCADE
);



INSERT INTO employee values(1, 'Joseph', 'M', 4000);
INSERT INTO employee values (2, 'Alemitu', 'F', 3000);
INSERT INTO employee values (3, 'Belay', 'M', 5000);
INSERT INTO employee values (4, 'Bereket', 'M', 9000);
INSERT INTO employee values (5, 'Bethelehem', 'F', 2000);

INSERT INTO Student (studID, fname, sex) VALUES 
(1, 'John Doe', 'M'),
(2, 'Alice Smith', 'F'),
(3, 'Bob Johnson', 'M'),
(4, 'Emma Davis', 'F'),
(5, 'Michael Brown', 'M'),
(6, 'Sophia Wilson', 'F'),
(7, 'William Jones', 'M'),
(8, 'Olivia Martinez', 'F'),
(9, 'James Taylor', 'M'),
(10, 'Ava Anderson', 'F'),
(11, 'Ethan Thomas', 'M'),
(12, 'Isabella White', 'F'),
(13, 'Daniel Harris', 'M'),
(14, 'Mia Martin', 'F'),
(15, 'Matthew Thompson', 'M'),
(16, 'Charlotte Garcia', 'F'),
(17, 'Lucas Robinson', 'M'),
(18, 'Amelia Clark', 'F'),
(19, 'Henry Rodriguez', 'M'),
(20, 'Harper Lewis', 'F');

INSERT INTO Stud_Grade (studID, courseNo, CourseTitle, CrHr, Grade) VALUES 
(1, 'CS101', 'Intro to Computer Science', 3, 'A'),
(1, 'MATH201', 'Calculus I', 4, 'B'),
(2, 'CS101', 'Intro to Computer Science', 3, 'A'),
(2, 'ENG102', 'English Composition', 3, 'B'),
(3, 'CS101', 'Intro to Computer Science', 3, 'C'),
(3, 'MATH201', 'Calculus I', 4, 'B'),
(4, 'CS102', 'Data Structures', 3, 'A'),
(4, 'MATH201', 'Calculus I', 4, 'A'),
(5, 'CS101', 'Intro to Computer Science', 3, 'B'),
(5, 'CS102', 'Data Structures', 3, 'C'),
(6, 'MATH202', 'Calculus II', 4, 'A'),
(6, 'ENG102', 'English Composition', 3, 'B'),
(7, 'CS103', 'Algorithms', 3, 'C'),
(7, 'CS102', 'Data Structures', 3, 'B'),
(8, 'CS101', 'Intro to Computer Science', 3, 'A'),
(8, 'MATH201', 'Calculus I', 4, 'A'),
(9, 'ENG102', 'English Composition', 3, 'B'),
(9, 'CS103', 'Algorithms', 3, 'C'),
(10, 'CS101', 'Intro to Computer Science', 3, 'B'),
(10, 'MATH202', 'Calculus II', 4, 'A');


GO
	CREATE FUNCTION netPay(@sal int)
RETURNS float
AS
BEGIN
	DECLARE @np FLOAT
	IF @sal < 150
		SET @np=@sal
	ELSE IF @sal < 650
		SET @np = @sal - 0.10 * @sal
	ELSE IF @sal < 1400
		SET @np = @sal-(50 + 0.15 * (@sal - 650))
	else
		SET @np = @sal-(112.50 + (@sal - 1400) * 0.15)
	return @np
END

create function employeeList(@id int)
	returns table
	as 
	return select * from employee where id=@id
-- To call the function, run the query following manner:
select * from dbo.employeeList(2)

go
	create function empNames(@id int)
	returns @report table(fname varchar(50))
as 
begin
	insert @report select fname from employee where id=@id
	return
end
-- To call the funciton, run the following query 
select * from dbo.empNames(1)

CREATE FUNCTION dbo.max_of_two (@a INT, @b INT)
RETURNS INT
AS
BEGIN
    RETURN CASE WHEN @a > @b THEN @a ELSE @b END;
END;

SELECT dbo.max_of_two(10, 20) AS MaxValue;

SELECT id, fname, salary, dbo.netPay(employee.salary) as Payable from employee;

SELECT S.fname, S.studID, S.sex, G.courseNo, G.CourseTitle, G.CrHr, G.Grade
FROM Student S
JOIN Stud_Grade G ON S.studID = G.studID;

SELECT DISTINCT S.fname, S.studID
FROM Student S
JOIN Stud_Grade G ON S.studID = G.studID
WHERE G.Grade = 'A';

SELECT studID,
       CAST(SUM(
           CASE 
               WHEN Grade = 'A' THEN 4.0 * CrHr
               WHEN Grade = 'B' THEN 3.0 * CrHr
               WHEN Grade = 'C' THEN 2.0 * CrHr
               WHEN Grade = 'D' THEN 1.0 * CrHr
               ELSE 0.0 * CrHr
           END
       ) AS FLOAT) / NULLIF(SUM(CrHr), 0) AS GPA
FROM Stud_Grade
GROUP BY studID;

