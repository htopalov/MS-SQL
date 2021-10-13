SELECT p.[Name],
	   p.[Seats],
	   ISNULL(COUNT(t.[PassengerId]),0) AS [Passengers Count]
FROM [Flights] AS f
FULL JOIN [Tickets] AS t ON f.[Id] = t.[FlightId]
FULL JOIN [Planes] AS p ON f.[PlaneId] = p.[Id]
GROUP BY p.[Name],p.[Seats]
ORDER BY [Passengers Count] DESC,p.[Name],p.[Seats]