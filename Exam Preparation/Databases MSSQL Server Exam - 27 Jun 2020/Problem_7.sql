SELECT CONCAT(m.[FirstName],' ',m.[LastName]) AS [Mechanic],
	   AVG(DATEDIFF(DAY,j.[IssueDate],j.[FinishDate])) AS [Average Days]
FROM [Jobs] AS j
LEFT JOIN [Mechanics] AS m ON j.[MechanicId] = m.[MechanicId]
WHERE [Status] = 'Finished'
GROUP BY m.[MechanicId],m.[FirstName],m.[LastName]
ORDER BY m.[MechanicId]