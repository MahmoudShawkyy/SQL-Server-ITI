-- Problem 7.1
CREATE FUNCTION getmonth(@date DATE)
RETURNS VARCHAR(20) 
      BEGIN
	       DECLARE @mnth VARCHAR(20)=FORMAT(@date, 'MM')
		   RETURN @mnth
	  END

-- Problem 7.2
CREATE FUNCTION Numbers(@num1 INT , @num2 INT)
RETURNS @Nums TABLE

					(
					Number INT
					)
AS 
   BEGIN 
         DECLARE @temp INT = @num1 + 1
		 WHILE @temp < @num2
		    BEGIN
		       INSERT INTO @Nums
			   SELECT @temp
			   SET @temp += 1
			END
		RETURN
	END

-- Problem 7.3
CREATE FUNCTION Std(@id INT)
RETURNS TABLE
AS
RETURN
(
SELECT Dept_Id,St_Fname + ' ' + St_Lname AS 'Full Name'
FROM Student
WHERE St_Id = @id
)

-- Problem 7.4
CREATE FUNCTION Msg(@id INT)
RETURNS VARCHAR(50)
      BEGIN 
	       DECLARE @first VARCHAR(20), @last VARCHAR(20),@mssg VARCHAR(50)
		   SELECT @first=St_Fname,@last=St_Lname
		   FROM Student
		   WHERE St_Id=@id
		        IF @first IS NULL AND @last IS NULL
				    SET @mssg = 'First name & last name are null'
				ELSE IF @first IS NULL 
				    SET @mssg = 'First name is null'
				ELSE IF @last IS NULL 
				    SET @mssg = 'Last name is null'
				ELSE 
				    SET @mssg = 'First name & last name are not null'
		  RETURN @mssg
	  END 

-- Problem 7.5
CREATE FUNCTION mngr(@id INT)
RETURNS TABLE
AS
RETURN 
(
SELECT Dept_Name,Ins_Name,Manager_hiredate
FROM Department
INNER JOIN Instructor ON Department.Dept_Id=Instructor.Dept_Id
WHERE Ins_Id=@id
)

-- Problem 7.6
CREATE FUNCTION getname(@namee VARCHAR(20))
RETURNS @res TABLE 
(
stdname VARCHAR(20)
)
AS 
BEGIN 
     DECLARE @temp VARCHAR(20)
	 IF @namee = 'first name'
	    BEGIN 
		INSERT INTO @res
		SELECT ISNULL(St_Fname,'') FROM Student
		END
	ELSE IF @namee = 'last name'
	    BEGIN 
		INSERT INTO @res
		SELECT ISNULL(St_Lname,'') FROM Student
		END
	ELSE IF @namee = 'full name'
	    BEGIN 
		INSERT INTO @res
		SELECT ISNULL(St_Fname,'') + ' ' +  ISNULL(St_Lname,'') FROM Student
		END
	RETURN
END

-- Problem 7.7
SELECT St_Id,SUBSTRING(St_Fname,1,LEN(St_Fname)-1)
FROM Student
