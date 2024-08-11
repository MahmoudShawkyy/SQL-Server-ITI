-- Problem 5.1.1
SELECT COUNT(St_Id) FROM Student
WHERE St_Age IS NOT NULL;

-- Problem 5.1.2
SELECT DISTINCT(Ins_Name) FROM Instructor

-- Problem 5.1.3
SELECT Student.St_Id AS "Student ID" , ISNull(Student.St_Fname,'') + ' ' + ISNull(Student.St_Lname,'') , Department.Dept_Name AS "Department Name"
FROM Student,Department
WHERE Student.Dept_Id = Department.Dept_Id

-- Problem 5.1.4
SELECT Ins_Name,Dept_Name
FROM Instructor
LEFT JOIN Department ON Instructor.Dept_Id=Department.Dept_Id

-- Problem 5.1.5
SELECT St_Fname + ' ' + St_Lname AS "Student Full Name", Crs_Name
FROM Student
INNER JOIN Stud_Course ON Student.St_Id=Stud_Course.St_Id 
INNER JOIN Course ON Stud_Course.Crs_Id=Course.Crs_Id 
WHERE Grade IS NOT NULL

-- Problem 5.1.6
SELECT Top_Name, COUNT(Crs_ID)
FROM Topic
INNER JOIN Course ON Topic.Top_Id = Course.Top_Id
GROUP BY Top_Name

-- Problem 5.1.7
SELECT MAX(Salary)
FROM Instructor
UNION ALL
SELECT MIN(Salary)
FROM Instructor

-- Problem 5.1.8
SELECT Ins_Name 
FROM Instructor
WHERE Salary < (SELECT AVG(Salary) FROM Instructor)

-- Problem 5.1.9
SELECT Dept_Name
FROM Department
INNER JOIN Instructor ON Department.Dept_Id = Instructor.Dept_Id
WHERE Salary = (SELECT MIN(Salary) FROM Instructor)

-- Problem 5.1.10
SELECT *
FROM (
SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RN
FROM Instructor)
AS NewTable
WHERE RN <= 2

-- Problem 5.1.11
SELECT COALESCE(Salary,0) 
FROM Instructor

-- Problem 5.1.12
SELECT AVG(Salary) 
FROM Instructor

-- Problem 5.1.13
SELECT Std.St_Fname , Sup.* 
FROM Student Std
LEFT JOIN Student Sup ON Std.st_super=Sup.St_Id

-- Problem 5.1.14
SELECT *
FROM (
SELECT Salary , ROW_NUMBER() OVER (PARTITION BY Dept_ID ORDER BY Salary DESC) AS RN
FROM Instructor) AS NewTable 
WHERE RN <= 2

-- Problem 5.1.15
SELECT *
FROM 
(SELECT *,ROW_NUMBER() OVER (PARTITION BY Dept_Id ORDER BY NEWID()) AS RN
FROM Student) AS NewTable 




-- Problem 6.2.1
SELECT SalesOrderID,ShipDate
FROM Sales.SalesOrderHeader

-- Problem 6.2.2
SELECT ProductID,Name
FROM Production.Product
WHERE StandardCost < 110

-- Problem 6.2.3
SELECT ProductID,Name
FROM Production.Product
WHERE Weight IS NULL

-- Problem 6.2.4
SELECT ProductID,Name
FROM Production.Product
WHERE Color IN ('Silver','Black','Red')

-- Problem 6.2.5
SELECT ProductID,Name
FROM Production.Product
WHERE Name LIKE 'B%'

-- Problem 6.2.6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
SELECT Description
FROM Production.ProductDescription
WHERE Description LIKE '%[_]%'

-- Problem 6.2.7
SELECT SUM(TotalDue),OrderDate
FROM Sales.SalesOrderHeader
GROUP BY OrderDate

-- Problem 6.2.8
SELECT DISTINCT HireDate
FROM HumanResources.Employee

-- Problem 6.2.9
SELECT AVG(DISTINCT ListPrice)
FROM Production.Product

-- Problem 6.2.10
SELECT 'The '+ Name +' is only! ' + CAST(ListPrice AS varchar(50))
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 120
ORDER BY ListPrice

-- Problem 6.2.11.a
SELECT rowguid, Name, SalesPersonID, Demographics INTO StoreArchive
FROM Sales.Store 
SELECT * FROM StoreArchive -- 701 Rows

-- Problem 6.2.11.b
SELECT rowguid, Name, SalesPersonID, Demographics INTO Store_Archive
FROM Sales.Store 
WHERE 1=0 

-- Problem 6.2.12
SELECT GETDATE()
UNION
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy ')

-- Bonus 
SELECT @@VERSION 
SELECT @@SERVERNAME
-- They are global variables which are pre-defined system variables, it provides information about the present user environment for SQL Server.
