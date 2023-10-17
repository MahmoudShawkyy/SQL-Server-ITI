-- Problem 3.3.1
SELECT "Dnum","Dname","MGRSSN","Fname","Lname"
FROM "Departments"
INNER JOIN "Employees" ON "Departments"."MGRSSN" = "Employees"."SSN"

-- Problem 3.3.2
SELECT "Dname","Pname"
FROM "Departments"
INNER JOIN "Projects"ON "Departments"."Dnum"="Projects"."Dnum"

-- Problem 3.3.3
SELECT "Dependent".*,"Fname","Lname"
FROM "Dependent"
LEFT JOIN "Employees"ON "Dependent"."ESSN"="Employees"."SSN"

-- Problem 3.3.4
SELECT "Pnumber","Pname","Plocation"
FROM "Projects"
WHERE "City" = 'Alex' OR "City" = 'Cairo'

-- Problem 3.3.5
SELECT *
FROM "Projects"
WHERE "Pname" LIKE 'A%'

-- Problem 3.3.6
SELECT "Fname","Lname"
FROM "Employees"
WHERE "Dno"=30 AND ("Salary" BETWEEN 1000 AND 2000)

-- Problem 3.3.7
SELECT "Fname","Lname"
FROM "Employees"
INNER JOIN "Works_on" ON "Employees"."SSN"="Works_on"."ESSn"
INNER JOIN "Projects" ON "Works_on"."Pno"="Projects"."Pnumber"
WHERE "Dnum"=10 AND "Pname" = 'Al Rabwah' AND "Hours" >= 10

-- Problem 3.3.8
SELECT E1."Fname",E1."Lname"
FROM "Employees" AS E1
INNER JOIN "Employees" AS E2 ON E1."Superssn"=E2."SSN"
WHERE E2."Fname" = 'Kamel' 

-- Problem 3.3.9
SELECT "Employees"."Fname","Employees"."Lname","Projects"."Pname"
FROM "Employees"
INNER JOIN "Works_on" ON "Employees"."SSN"="Works_on"."ESSn"
INNER JOIN "Projects" ON "Works_on"."Pno"="Projects"."Pnumber"
ORDER BY "Pname"

-- Problem 3.3.10
SELECT "Projects"."Pnumber","Departments"."Dname","Employees"."Lname","Employees"."Address","Employees"."Bdate"
FROM "Projects"
INNER JOIN "Departments" ON "Projects"."Dnum"="Departments"."Dnum"
INNER JOIN "Employees" ON "Departments"."MGRSSN" = "Employees"."SSN"
WHERE "City" = 'Cairo'

-- Problem 3.3.11
SELECT "Employees".*
FROM "Employees"
INNER JOIN "Departments" ON "Employees"."SSN"="Departments"."MGRSSN" 

-- Problem 3.3.12
SELECT "Employees".*,"Dependent".*
FROM "Employees"
LEFT JOIN "Dependent" ON "Employees"."SSN"="Dependent"."ESSN"

-- Problem 3.4.1
INSERT INTO "Employees"
VALUES ('Mahmoud','Shawky',102672,'2001-10-01','Mansoura','M',3000,112233,30)

-- Problem 3.4.2
INSERT INTO "Employees"
VALUES ('Ali','Ahmed',102660,'1986-11-06','Talkha','M',0,0,30)

-- Problem 3.4.3
UPDATE "Employees"
SET "Salary"="Salary"+"Salary"*.2
WHERE "SSN"=102672


