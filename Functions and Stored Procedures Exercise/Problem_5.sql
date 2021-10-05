CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10)
AS
BEGIN
DECLARE @salaryLevel VARCHAR(10)
IF (@Salary < 30000)
    SET @salaryLevel = 'Low'
ELSE IF(@Salary <= 50000)
    SET @salaryLevel = 'Average'
ELSE
    SET @salaryLevel = 'High'
RETURN @salaryLevel
END

SELECT [dbo].[ufn_GetSalaryLevel] (45555)