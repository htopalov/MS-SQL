SELECT CONCAT(c.[FirstName], ' ', c.[LastName]) AS [Client],
	   DATEDIFF(DAY,j.[IssueDate],'2017-04-24') AS [Days going],
	   j.[Status]
FROM [Jobs] AS j
LEFT JOIN [Clients] AS c ON j.[ClientId] = c.[ClientId]
WHERE [Status] != 'Finished'
ORDER BY [Days going] DESC,j.[ClientId]