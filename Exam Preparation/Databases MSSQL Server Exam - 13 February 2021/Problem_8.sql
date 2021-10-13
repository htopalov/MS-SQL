SELECT f.[Id],
	   f.[Name],
	   CONCAT(f.[Size],'KB') AS [Size]
FROM [Files] AS f
LEFT JOIN [Files] AS f1 ON f.[Id] = f1.[ParentId]
WHERE f1.[ParentId] IS NULL
ORDER BY [Id],[Name],[Size] DESC