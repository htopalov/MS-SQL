SELECT TOP(50)
		[FirstName],
		[LastName],
		t.[Name] AS [Town],
		a.[AddressText]
FROM [Employees] e
LEFT JOIN [Addresses] a ON e.[AddressID] = a.[AddressID]
LEFT JOIN [Towns] t ON t.TownID = a.[TownID]
ORDER BY [FirstName],[LastName]