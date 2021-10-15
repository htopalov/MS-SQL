SELECT CONCAT(t.[FirstName],' ',t.[LastName]) AS [FullName],
	   CONCAT(s.[Name],'-',s.[Lessons]) AS [Subjects],
	   COUNT(st.[StudentId]) AS [Students]
FROM [StudentsTeachers] AS st
JOIN [Teachers] AS t ON st.[TeacherId] = t.[Id]
JOIN [Subjects] AS s ON t.[SubjectId] = s.[Id]
GROUP BY t.[FirstName],t.[LastName],s.[Name],s.[Lessons]
ORDER BY [Students] DESC,[FullName],[Subjects]