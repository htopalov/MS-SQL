SELECT p.[FirstName],
	   p.[LastName],
	   p.[Age]
FROM [Passengers] AS p
LEFT JOIN [Tickets] AS t ON p.[Id] = t.[PassengerId]
WHERE t.[Id] IS NULL
ORDER BY [Age] DESC,p.[FirstName],p.[LastName]