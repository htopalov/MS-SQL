UPDATE  t
SET t.[Price] = t.[Price]*1.13
FROM [Tickets] AS t
	JOIN [Flights] AS f ON t.[FlightId] = f.[Id]
	WHERE f.[Destination] = 'Carlsbad'