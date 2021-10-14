SELECT t.[Id],
	   CONCAT(a.[FirstName],' ', ISNULL(a.[MiddleName] + ' ',''),a.[LastName]) AS [Full Name],
	   c.[Name] AS [From],
	   c2.[Name] AS [To],
	   CASE
			WHEN t.[CancelDate] IS NULL THEN CONCAT(DATEDIFF(DAY,t.[ArrivalDate],t.[ReturnDate]),' ','days')
			ELSE
				 'Canceled'
			END AS [Duration]
FROM [AccountsTrips] AS acct
JOIN [Accounts] AS a ON acct.[AccountId] = a.[Id]
JOIN [Cities] AS c ON a.[CityId] = c.[Id]
JOIN [Trips] AS t ON acct.[TripId] =t.[Id]
JOIN [Rooms] AS r ON t.[RoomId] =r.[Id]
JOIN [Hotels] AS h ON r.[HotelId] = h.[Id]
JOIN [Cities] AS c2 ON c2.[Id] = h.[CityId]
ORDER BY [Full Name],t.[Id]