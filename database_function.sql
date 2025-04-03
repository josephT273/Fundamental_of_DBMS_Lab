CREATE DATABASE EMP;

use EMP;

create table employee(
	id int primary key,
	fname varchar(20),
	sex char,
	salary int
);

INSERT INTO employee values(1, 'John', 'M', 4000);
INSERT INTO employee values (2, 'Alemitu', 'F', 3000);
INSERT INTO employee values (3, 'Belay', 'M', 5000);
INSERT INTO employee values (4, 'Bereket', 'M', 9000);
INSERT INTO employee values (5, 'Bethelehem', 'F', 2000);


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


SELECT fname, dbo.netPay(employee.salary) from employee;
