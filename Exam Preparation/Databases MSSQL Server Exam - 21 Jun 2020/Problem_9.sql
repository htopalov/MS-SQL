SELECT a.[Id],
	   a.[Email],
	   c.[Name] AS [City],
	   COUNT(c.[Id]) AS [Trips]
FROM [Accounts] AS a
JOIN [AccountsTrips] AS acct ON acct.[AccountId] = a.[Id]
JOIN [Trips] AS t ON t.[Id] = acct.[TripId]
JOIN [Rooms] AS r ON r.[Id] = t.[RoomId]
JOIN [Hotels] AS h ON h.[Id] = r.[HotelId]
JOIN [Cities] AS c ON a.[CityId] = c.[Id] AND h.[CityId] = c.[Id]
GROUP BY a.[Id],a.[Email],c.[Name]
ORDER BY [Trips] DESC,a.[Id]