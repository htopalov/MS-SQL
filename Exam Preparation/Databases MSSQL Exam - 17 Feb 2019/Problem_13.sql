SELECT [FirstName],
	   [LastName],
	   [Grade]
	   FROM (
SELECT s.[FirstName],
	   s.[LastName],
	   ss.[Grade],
	   RANK () OVER ( 
			PARTITION BY ss.[StudentId]
			ORDER BY ss.[Grade] DESC
		) AS [Rank]
FROM [Students] AS s
JOIN [StudentsSubjects] AS ss ON s.[Id] = ss.[StudentId]
GROUP BY s.[FirstName],s.[LastName],ss.[StudentId],ss.[Grade]
) AS q
WHERE [Rank] = 2
ORDER BY [FirstName],[LastName]