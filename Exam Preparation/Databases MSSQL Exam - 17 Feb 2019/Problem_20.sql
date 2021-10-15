CREATE TABLE [ExcludedStudents]
(
 [StudentId] INT, 
 [StudentName] VARCHAR(30)
)

CREATE TRIGGER tr_StudentsDelete ON [Students]
INSTEAD OF DELETE
AS
INSERT INTO [ExcludedStudents]([StudentId], [StudentName])
		SELECT [Id], CONCAT([FirstName],' ',[LastName]) FROM [deleted]



EXEC usp_ExcludeFromSchool 3

SELECT * FROM ExcludedStudents
