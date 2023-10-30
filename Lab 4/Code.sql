-- Problem 4.1
SELECT "Dependent_name","Dependent"."Sex"
FROM "Dependent"
INNER JOIN "Employees" ON "Employees"."SSN"="Dependent"."ESSN" 
AND  "Employees"."Sex"="Dependent"."Sex" 
AND "Dependent"."Sex"= 'F'
UNION 
SELECT "Dependent_name","Dependent"."Sex"
FROM "Dependent"
INNER JOIN "Employees" ON "Employees"."SSN"="Dependent"."ESSN" 
AND  "Employees"."Sex"="Dependent"."Sex" 
AND "Dependent"."Sex"= 'M'

-- Problem 4.2
SELECT "Pname","Pnumber",SUM("Hours")
FROM "Projects" 
INNER JOIN "Works_on" ON "Projects"."Pnumber"="Works_on"."Pno"
GROUP BY "Pnumber"

-- Problem 4.3
SELECT *
FROM "Dependent"
WHERE "ESSN" IN (SELECT MIN("SSN") FROM "Employees" INNER JOIN "Dependent" ON "Employees"."SSN"="Dependent"."ESSN")

-- Problem 4.4
SELECT "Dname",MAX("Salary"),MIN("Salary"),AVG("Salary")
FROM "Employees"
INNER JOIN "Departments"
ON "Employees"."Dno"="Departments"."Dnum"
GROUP BY "Dname"

-- Problem 4.5
SELECT "Employees".* 
FROM "Employees"
INNER JOIN "Departments" ON "Employees"."SSN"="Departments"."MGRSSN" 
WHERE "SSN" NOT IN (SELECT "ESSN" FROM "Dependent")

-- Problem 4.6
SELECT "Dname","Dnum",COUNT("SSN")
FROM "Departments"
INNER JOIN "Employees"
ON "Employees"."Dno"="Departments"."Dnum"
GROUP BY "Dnum"
HAVING AVG("Salary") < (SELECT AVG("Salary") FROM "Employees" )

-- Problem 4.7
SELECT "Fname","Lname","Pname"
FROM "Employees"
INNER JOIN "Works_on" ON "Employees"."SSN"="Works_on"."ESSn"
INNER JOIN "Projects" ON "Works_on"."Pno"="Projects"."Pnumber"
ORDER BY "Dno","Fname","Lname" ASC

-- Problem 4.8
SELECT MAX("Salary")
FROM "Employees"
UNION ALL
SELECT MAX("Salary")
FROM "Employees"
WHERE "Salary" NOT IN (SELECT MAX("Salary")
FROM "Employees")

-- Problem 4.9
SELECT "Fname","Lname"
FROM "Employees"
WHERE "Employees"."Fname" IN (SELECT SUBSTRING("Dependent_name",1,6) FROM "Dependent")

-- Problem 4.10
SELECT DISTINCT "SSN","Fname","Lname"
FROM "Employees"
INNER JOIN "Dependent"
ON "Employees"."SSN"="Dependent"."ESSN"

-- Problem 4.11
INSERT INTO "Departments" 
VALUES ('DEPT IT',100,112233,'2016-11-01 00:00:00')

-- Problem 4.12.a
UPDATE "Departments"
SET "MGRSSN"=102672
WHERE "MGRSSN"=968574
-- Problem 4.12.b
UPDATE "Departments"
SET "MGRSSN"=968574 
WHERE "MGRSSN"=112233

-- Problem 4.12.c
UPDATE "Employees"
SET "Superssn"=102672 
WHERE "SSN"=102660

-- Problem 4.13.a
DELETE FROM "Dependent" WHERE "ESSN"=223344

-- Problem 4.13.b
UPDATE "Departments"
SET "MGRSSN"=102672
WHERE "MGRSSN"=223344

-- Problem 4.13.c
UPDATE "Employees"
SET "Superssn"=102672
WHERE "Superssn"=223344

-- Problem 4.13.d
UPDATE "Works_on"
SET "ESSn"=102672
WHERE "ESSn"=223344

-- Problem 4.14
UPDATE "Employees"
SET "Salary"="Salary"+"Salary"*.4
FROM "Works_on","Projects"
WHERE "Employees"."SSN"="Works_on"."ESSn" AND "Works_on"."Pno"="Projects"."Pnumber" AND "Projects"."Pname" LIKE 'Al Rabwah%'


