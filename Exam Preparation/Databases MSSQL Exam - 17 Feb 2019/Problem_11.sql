SELECT TOP(10) t.[FirstName],
			   t.[LastName],
			   COUNT(st.[StudentId]) AS [StudentsCount]
FROM [StudentsTeachers] AS st
JOIN [Teachers] AS t ON st.[TeacherId] = t.[Id]
GROUP BY t.[FirstName],t.[LastName]
ORDER BY [StudentsCount] DESC,t.[FirstName],t.[LastName]