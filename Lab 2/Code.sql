-- Problem 2.2.1
SELECT * From "Employees"

-- Problem 2.2.2
SELECT "Fname","Lname","Salary","Dno" FROM "Employees"

-- Problem 2.2.3
SELECT "Pname","Plocation","Dnum" FROM "Projects"

-- Problem 2.2.4
SELECT "Fname","Lname",
.1*"Salary" AS "ANNUAL COMM"
FROM "Employees"

-- Problem 2.2.5
SELECT "SSN","Fname","Lname" FROM "Employees"
WHERE "Salary" > 1000

-- Problem 2.2.6
SELECT "SSN","Fname","Lname" FROM "Employees"
WHERE "Salary"*12 > 10000

-- Problem 2.2.7
SELECT "Fname","Lname","Salary" FROM "Employees"
WHERE "Sex" = 'F'

-- Problem 2.2.8
SELECT "Dnum","Dname" FROM "Departments"
WHERE "MGRSSN"=968574

-- Problem 2.2.9
SELECT "Pnumber","Pname","Plocation" FROM "Projects"
WHERE "Dnum"=10



