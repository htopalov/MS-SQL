SELECT c.[Id],
	   CONCAT(c.[FirstName],' ',c.[LastName]) AS [ClientName],
	   c.[Email]
FROM [Clients] AS c
LEFT JOIN [ClientsCigars] AS cc ON c.[Id] = cc.[ClientId]
WHERE cc.[ClientId] IS NULL
ORDER BY [ClientName]