SELECT TOP(5) c.[Name] AS [CategoryName],
			  COUNT([CategoryId]) AS [ReportsNumber]
FROM [Reports] AS r
JOIN [Categories] AS c ON r.[CategoryId] = c.[Id]
GROUP BY [CategoryId],[Name]
ORDER BY [ReportsNumber] DESC,[CategoryName]

