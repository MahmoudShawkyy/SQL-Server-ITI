CREATE SCHEMA Company

ALTER SCHEMA Company TRANSFER Department

CREATE SCHEMA HumanResource

ALTER SCHEMA HumanResource TRANSFER Employee

SHOW CONSTRAINTS FROM 'Employee'

SELECT 
    CONSTRAINT_NAME, 
    CONSTRAINT_TYPE 
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE 
    TABLE_NAME = 'Employee'


CREATE SYNONYM Emp FOR Employee

Select * from Employee -- ERROR Employee is INVALID
Select * from [HumanResource].Employee -- Display all data in Employee
Select * from Emp -- ERROR Emp is INVALID
Select * from [HumanResource].Emp -- ERROR [HumanResource].Emp is INVALID

-- Employee number 10102 was deleted before

UPDATE dpt
SET DeptName = 'Sales'
FROM Company.Department dpt
INNER JOIN HumanResource.Employee empl ON dpt.DeptNo = empl.DeptNo 
WHERE empl.EmpFname='James'

UPDATE wrk 
SET Enter_Date='2007-12-12'
FROM dbo.Works_on wrk 
INNER JOIN Company.Project prj  ON wrk.ProjectNo =  prj.ProjectNo
INNER JOIN HumanResource.Employee empl ON wrk.EmpNo = empl.EmpNo
INNER JOIN  Company.Department dpt ON empl.DeptNo = dpt.DeptNo 
WHERE prj.ProjectName = 'd1' AND dpt.DeptName = 'Sales'


DELETE wrk FROM dbo.Works_on wrk
INNER JOIN HumanResource.Employee empl ON wrk.EmpNo = empl.EmpNo
INNER JOIN Company.Department dpt ON empl.DeptNo = dpt.DeptNo
WHERE dpt.Location = 'KW'
