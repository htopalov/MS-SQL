CREATE PROCEDURE usp_EmployeesBySalaryLevel (@LevelOfSalary VARCHAR(10))
AS
BEGIN
	SELECT [FirstName],[LastName]
	FROM [Employees]
	WHERE [dbo].[ufn_GetSalaryLevel] ([Salary]) = @LevelOfSalary
END

EXECUTE usp_EmployeesBySalaryLevel 'High'