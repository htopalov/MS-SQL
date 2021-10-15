CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3,2))
RETURNS NVARCHAR(MAX)
AS
BEGIN
	IF ((SELECT TOP(1) [StudentId] FROM [StudentsExams] WHERE [StudentId] = @studentId) IS NULL)
		RETURN 'The student with provided id does not exist in the school!'

	IF (@grade > 6.00)
		RETURN 'Grade cannot be above 6.00!'

	DECLARE @StudentName NVARCHAR(MAX) = (SELECT [FirstName] FROM [Students] WHERE [Id] = @studentId)
	DECLARE @GradeCount INT = (
									SELECT COUNT(*)
									FROM [Students] AS s
									JOIN [StudentsExams] AS ss ON s.[Id] = ss.[StudentId]
									WHERE [Grade] BETWEEN @grade AND (@grade + 0.5) AND s.[Id] = @studentId
							  )
	RETURN CONCAT('You have to update ',@GradeCount,' grades for the student ',@StudentName)
END

SELECT dbo.udf_ExamGradesToUpdate(12, 6.20)

SELECT dbo.udf_ExamGradesToUpdate(12, 5.50)

SELECT dbo.udf_ExamGradesToUpdate(121, 5.50)



