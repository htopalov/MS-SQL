SELECT COUNT(*) AS [count]
FROM [TravelCards] AS tc
LEFT JOIN [Colonists] AS c ON c.[Id] = tc.[ColonistId]
LEFT JOIN [Journeys] AS j ON j.[Id] = tc.[JourneyId]
WHERE j.[Purpose] = 'Technical'
