SELECT TOP(5)  r.[Id],
			   r.[Name],
			   COUNT(*) AS [Commits]
FROM [Repositories] AS r
JOIN [Commits] AS c ON r.[Id] = c.[RepositoryId]
JOIN [RepositoriesContributors] AS rc ON rc.[RepositoryId] = r.[Id]
GROUP BY r.[Name],r.[Id]
ORDER BY [Commits] DESC,r.[Id],r.[Name]