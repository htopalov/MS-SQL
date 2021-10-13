SELECT CONCAT(P.[FirstName], ' ',p.[LastName]) AS [Full Name],
	   f.[Origin],
	   f.[Destination]
FROM [Passengers] AS p
LEFT JOIN [Tickets] AS t ON p.[Id] = t.[PassengerId]
JOIN [Flights] AS f ON t.[FlightId] = f.[Id]
ORDER BY [Full Name],f.[Origin],f.[Destination]