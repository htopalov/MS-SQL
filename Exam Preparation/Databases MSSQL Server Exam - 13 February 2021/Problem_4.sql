DELETE FROM [RepositoriesContributors]
WHERE [RepositoryId] = 3

DELETE FROM [Issues]
WHERE [RepositoryId] = 3

DELETE FROM [Files]
WHERE [CommitId] = 36

DELETE FROM [Commits]
WHERE [RepositoryId] = 3

DELETE FROM [Repositories]
WHERE [Name] = 'Softuni-Teamwork'

--SELECT [Id] FROM [Commits] WHERE [RepositoryId] = 3 id=36







