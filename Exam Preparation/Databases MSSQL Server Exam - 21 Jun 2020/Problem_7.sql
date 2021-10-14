SELECT  a.[Id] AS [AccountId],
		CONCAT(a.[FirstName],' ',a.[LastName]) AS [FullName],
		MAX(DATEDIFF(DAY,t.[ArrivalDate],t.[ReturnDate])) AS [LongestTrip],
		MIN(DATEDIFF(DAY,t.[ArrivalDate],t.[ReturnDate])) AS [ShortestTrip]
FROM [Accounts] AS a
LEFT JOIN [AccountsTrips] AS acct ON a.[Id] = acct.[AccountId]
JOIN [Trips] AS t ON acct.[TripId] = t.[Id]
WHERE t.[CancelDate] IS NULL AND a.[MiddleName] IS NULL
GROUP BY a.[FirstName],a.[LastName],a.[Id]
ORDER BY [LongestTrip] DESC,[ShortestTrip]