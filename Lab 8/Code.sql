-- Problem 8.1.1 
CREATE VIEW Vpassed
AS 
SELECT St_Fname + ' ' + St_Lname AS 'Student Name', Crs_Name
FROM Student
INNER JOIN Stud_Course ON Student.St_Id = Stud_Course.St_Id
INNER JOIN Course ON Stud_Course.Crs_Id = Course.Crs_Id
WHERE Grade > 50 

-- Problem 8.1.2
CREATE VIEW Vmngr 
WITH ENCRYPTION
AS 
SELECT Ins_Name, Top_Name
FROM Instructor
INNER JOIN Ins_Course ON Instructor.Ins_Id = Ins_Course.Ins_Id
INNER JOIN Course ON Ins_Course.Crs_Id = Course.Crs_Id
INNER JOIN Topic ON Course.Top_Id = Topic.Top_Id

-- Problem 8.1.3
CREATE VIEW Vinstructor
WITH SCHEMABINDING
AS
SELECT Ins_Name,Dept_Name
FROM dbo.Instructor 
INNER JOIN dbo.Department ON dbo.Instructor.Dept_Id = dbo.Department.Dept_Id
WHERE Dept_Name = 'Java' OR Dept_Name = 'SD'

-- Problem 8.1.4
CREATE VIEW V1
WITH SCHEMABINDING
AS
SELECT St_Id,St_Fname,St_Lname,St_Address,St_Age FROM dbo.Student
WHERE St_Address = 'Alex' OR St_Address = 'Cairo'

Update V1 set st_address='tanta'
Where st_address='alex'

-- Problem 8.1.5
CREATE NONCLUSTERED INDEX Myindex
ON Department(Manager_hiredate)

-- Problem 8.1.6
CREATE UNIQUE INDEX Myindex
ON Student(St_Age)


-- Problem 8.1.7
CREATE TABLE #Emp
(
Employee_Name VARCHAR(50),
Task VARCHAR(50)
)

-- Problem 8.1.8
CREATE VIEW Vemp 
AS
SELECT ProjectName,COUNT(EmpNo) AS 'Number Of Employees'
FROM Company.Project
INNER JOIN Works_on ON Company.Project.ProjectNo = Works_on.ProjectNo
GROUP BY ProjectName

-- Problem 8.1.9
MERGE INTO Last_Transaction AS T
USING Daily_Transactions AS S
ON T.UserID = S.UserID
WHEN MATCHED THEN
UPDATE 
SET T.TransactionAmount = S.TransactionAmount
WHEN NOT MATCHED THEN 
INSERT VALUES (UserID,TransactionAmount);

-- Problem 8.2.1
CREATE VIEW v_clerk
AS
SELECT EmpNo,ProjectNo,Enter_Date
FROM Works_on
WHERE Job = 'Clerk'

-- Problem 8.2.2
CREATE VIEW v_without_budget 
AS 
SELECT ProjectNo,ProjectName
FROM Company.Project

-- Problem 8.2.3
CREATE VIEW v_count 
AS
SELECT ProjectName,COUNT(Job) AS 'Number Of Jobs'
FROM Works_on
INNER JOIN Company.Project  ON Works_on.ProjectNo = Company.Project.ProjectNo
GROUP BY ProjectName

-- Problem 8.2.4
CREATE VIEW v_project_p2
AS 
SELECT EmpNo,ProjectNo
FROM v_clerk
WHERE ProjectNo = 'p2'

-- Problem 8.2.5
ALTER VIEW v_without_budget 
AS
SELECT *
FROM Company.Project
WHERE ProjectNo = 'p1' OR ProjectNo = 'p1'

-- Problem 8.2.6
DROP VIEW v_clerk 
DROP VIEW v_count

-- Problem 8.2.7
CREATE VIEW vemps
AS
SELECT EmpNo,EmpLname
FROM HumanResource.Employee
WHERE DeptNo = 'd2'

-- Problem 8.2.8
SELECT EmpLname
FROM vemps
WHERE EmpLname LIKE '%J%'

-- Problem 8.2.9
CREATE VIEW v_dept
AS 
SELECT DeptNo,DeptName
FROM Company.Department

-- Problem 8.2.10
INSERT INTO v_dept
VALUES('d4','Development')

-- Problem 8.2.11
CREATE VIEW v_2006_check
AS
SELECT EmpNo,ProjectNo 
FROM Works_on
WHERE Enter_Date BETWEEN '2006/1/1' AND '2006/12/31'
