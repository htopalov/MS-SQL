SELECT
	mc.[CountryCode],
	m.[MountainRange],
	p.[PeakName],
	p.[Elevation]
FROM [MountainsCountries] mc
JOIN [Mountains] m ON m.Id = mc.[MountainId]
JOIN [Peaks] p ON m.[Id] = p.[MountainId]
WHERE p.[Elevation] > 2835 AND mc.[CountryCode] = 'BG'
ORDER BY p.[Elevation] DESC