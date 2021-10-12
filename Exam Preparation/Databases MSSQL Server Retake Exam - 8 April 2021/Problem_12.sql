CREATE PROCEDURE usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
AS
BEGIN
	DECLARE @EmployeeDepartmentId INT
	SET @EmployeeDepartmentId = (SELECT [DepartmentId] FROM [Employees] WHERE [Id] = @EmployeeId)

	DECLARE @ReportCategoryId INT
	SET @ReportCategoryId = (SELECT [CategoryId] FROM [Reports] WHERE [Id] = @ReportId)

	DECLARE @CategoryDepartmentId INT
	SET @CategoryDepartmentId = (SELECT [DepartmentId] FROM [Categories] WHERE [Id] = @ReportCategoryId)

	IF(@EmployeeDepartmentId != @CategoryDepartmentId)
		BEGIN
			THROW 50001, 'Employee doesn''t belong to the appropriate department!',1
		END
	ELSE
		BEGIN
			UPDATE [Reports]
			SET [EmployeeId] = @EmployeeId
			WHERE [Id] = @ReportId
		END	
END

EXEC usp_AssignEmployeeToReport 30, 1
EXEC usp_AssignEmployeeToReport 17, 2