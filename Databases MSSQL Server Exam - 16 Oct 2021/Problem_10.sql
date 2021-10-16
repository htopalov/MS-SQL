SELECT c.[LastName],
	   AVG(s.[Length]) AS [CiagrLength],
	   CEILING(AVG(s.[RingRange])) AS [CiagrRingRange]
FROM [Clients] AS c
JOIN [ClientsCigars] AS cc ON c.[Id] = cc.[ClientId]
JOIN [Cigars] AS cig ON cc.[CigarId] = cig.[Id]
JOIN [Sizes] AS s ON cig.[SizeId] = s.[Id]
GROUP BY c.[LastName]
ORDER BY [CiagrLength] DESC

