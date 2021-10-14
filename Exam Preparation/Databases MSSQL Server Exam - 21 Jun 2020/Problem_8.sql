SELECT TOP(10) c.[Id],
	   c.[Name] AS [City],
	   c.[CountryCode] AS [Country],
	   COUNT(a.[Id])  AS [Accounts]
FROM [Cities] AS c
JOIN [Accounts] AS a ON c.[Id] = a.[CityId]
GROUP BY c.[Name],c.[Id],c.[CountryCode]
ORDER BY [Accounts] DESC