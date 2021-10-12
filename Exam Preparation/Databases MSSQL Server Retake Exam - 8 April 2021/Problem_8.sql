SELECT u.[Username],
	   c.[Name] AS [CategoryName]
FROM [Reports] AS r
JOIN [Users] AS u ON r.[UserId] = u.[Id]
JOIN [Categories] AS c ON r.[CategoryId] = c.[Id]
WHERE DAY(r.[OpenDate]) = DAY(u.[Birthdate]) AND MONTH(r.[OpenDate]) = MONTH(u.[Birthdate]) 
ORDER BY u.[Username],[CategoryName]