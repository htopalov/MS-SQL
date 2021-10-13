CREATE PROCEDURE usp_SearchForFiles(@fileExtension VARCHAR(MAX))
AS
BEGIN
	SELECT [Id],
		   [Name],
		   CONCAT([Size],'KB') AS [Size]
	FROM [Files]
	WHERE [Name] LIKE '%'+ @fileExtension
	ORDER BY [Id],[Name],[Size] DESC
END

EXEC usp_SearchForFiles 'txt'