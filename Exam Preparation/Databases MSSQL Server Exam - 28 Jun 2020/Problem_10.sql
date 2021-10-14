SELECT * FROM
(
SELECT tc.[JobDuringJourney],
	   CONCAT(c.[FirstName], ' ', c.[LastName]) AS [FullName],
RANK () OVER ( 
			PARTITION BY tc.[JobDuringJourney]
			ORDER BY c.[BirthDate] ASC
		) AS [JobRank]
FROM [TravelCards] AS tc
JOIN [Colonists] AS c ON tc.[ColonistId] = c.[Id]
) AS q
WHERE [JobRank] = 2
