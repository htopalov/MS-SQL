CREATE VIEW v_UserWithCountries
AS
	SELECT CONCAT(cu.[FirstName], ' ',cu.[LastName]) AS [CustomerName],
		   cu.[Age],
		   cu.[Gender],
		   c.[Name]
	FROM [Customers] AS cu
	LEFT JOIN [Countries] AS c ON c.[Id] = cu.[CountryId]

SELECT TOP 5 *
FROM v_UserWithCountries
ORDER BY Age
