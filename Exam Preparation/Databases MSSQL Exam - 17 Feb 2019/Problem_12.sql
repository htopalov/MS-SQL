SELECT TOP(10)  s.[FirstName],
				s.[LastName],
				FORMAT(AVG(se.[Grade]), 'N2') AS [Grade]
FROM [StudentsExams] AS se
JOIN [Students] AS s ON se.[StudentId] = s.[Id]
GROUP BY se.[StudentId],s.[FirstName],s.[LastName]
ORDER BY [Grade] DESC,s.[FirstName],s.[LastName]