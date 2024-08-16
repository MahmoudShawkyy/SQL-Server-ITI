
CREATE TABLE Department (
DeptNo VARCHAR(20) PRIMARY KEY,
DeptName VARCHAR(20)
)

CREATE RULE r1 AS @x in ('NY','DS','KW')

CREATE DEFAULT def1 AS 'NY'

SP_ADDTYPE LOC ,'NCHAR(2)'

SP_BINDRULE r1, LOC

SP_BINDEFAULT def1, LOC

ALTER TABLE Department 
ADD Location LOC 

INSERT INTO Department(DeptNo,DeptName,Location)
VALUES ('d1','Research','NY')

INSERT INTO Department(DeptNo,DeptName,Location)
VALUES ('d2','Accounting','DS')

INSERT INTO Department(DeptNo,DeptName,Location)
VALUES ('d3','Marketing','KW')

CREATE TABLE Employee (
EmpNo INT,
EmpFname VARCHAR(20),
EmpLname VARCHAR(20),
DeptNo VARCHAR(20),
Salary INT

CONSTRAINT c1 PRIMARY KEY(EmpNo),
CONSTRAINT c2 FOREIGN KEY(DeptNo) REFERENCES Department(DeptNo),
CONSTRAINT c3 UNIQUE(Salary),
CONSTRAINT c4 CHECK(EmpFname <> NULL AND EmpLname <> NULL)

)

CREATE RULE r2 AS @x<6000 

SP_BINDRULE r2, 'Employee.Salary'

INSERT INTO Employee (EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(25348,'Mathew','Smith','d3',2500)

INSERT INTO Employee (EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(10102,'Ann','Jones','d3',3000)


INSERT INTO Project (ProjectNo,ProjectName,Budget)
VALUES ('p1','Apollo',120000)

INSERT INTO Project (ProjectNo,ProjectName,Budget)
VALUES ('p2','Gemini',95000)

INSERT INTO Project (ProjectNo,ProjectName,Budget)
VALUES ('p3','Mercury',185600)


ALTER TABLE Works_on 
ADD CONSTRAINT c0 PRIMARY KEY(EmpNo,ProjectNo)


INSERT INTO Works_on(EmpNo,ProjectNo,Job,Enter_Date)
VALUES (10102,'p1','Analyst','2006-10-1')

INSERT INTO Works_on(EmpNo,ProjectNo,Job,Enter_Date)
VALUES (10102,'p3','Manager','2012-1-1')

INSERT INTO Works_on(EmpNo,ProjectNo,Job,Enter_Date)
VALUES (11111,'p1','Analyst','2012-8-1') -- Conflict so the statement will not work

UPDATE Works_on
SET EmpNo = 11111
WHERE EmpNo = 10102 -- Conflict so the statement will not work

UPDATE Employee
SET EmpNo = 22222
WHERE EmpNo = 10102 -- Conflict so the statement will not work

DELETE FROM Works_on WHERE EmpNo=10102

DELETE FROM Employee WHERE EmpNo=10102

ALTER TABLE Employee
ADD TelephoneNumber VARCHAR(20)

ALTER TABLE Employee
DROP COLUMN TelephoneNumber
