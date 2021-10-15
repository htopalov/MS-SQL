CREATE PROCEDURE usp_ExcludeFromSchool(@StudentId INT)
AS
BEGIN
	IF ((SELECT [Id] FROM [Students] WHERE [Id] = @StudentId) IS NULL)
		THROW 50001, 'This school has no student with the provided id!',1

	BEGIN TRANSACTION
			DELETE FROM [StudentsExams]
			WHERE [StudentId] = @StudentId

			DELETE FROM [StudentsTeachers]
			WHERE [StudentId] = @StudentId

			DELETE FROM [StudentsSubjects]
			WHERE [StudentId] = @StudentId

			DELETE FROM [Students]
			WHERE [Id] = @StudentId
	COMMIT
END

EXEC usp_ExcludeFromSchool 301

EXEC usp_ExcludeFromSchool 1
SELECT COUNT(*) FROM Students
