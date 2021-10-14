SELECT c.[Id],
	   CONCAT(c.[FirstName],' ',c.[LastName]) AS [full_name]
FROM [TravelCards] AS tc
LEFT JOIN [Colonists] AS c ON c.[Id] = tc.[ColonistId]
WHERE [JobDuringJourney] = 'Pilot'
ORDER BY c.[Id]