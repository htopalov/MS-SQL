SELECT s.[Name],
	   s.[Manufacturer]
FROM [Spaceships] AS s
JOIN [Journeys] AS j ON s.[Id] = j.[SpaceshipId]
JOIN [TravelCards] AS tc ON j.[Id] = tc.[JourneyId]
JOIN [Colonists] AS c ON tc.[ColonistId] = c.[Id]
WHERE DATEDIFF(YEAR,c.[BirthDate],'01/01/2019') < 30 AND tc.[JobDuringJourney] = 'Pilot'
GROUP BY s.[Name],s.[Manufacturer]
ORDER BY s.[Name]