SELECT TOP(5)
	c.[CountryName],
	ISNULL(p.[PeakName],'(no highest peak)') AS [Highest Peak Name],
	ISNULL(MAX(p.[Elevation]), 0) AS [Highest Peak Elevation],
	ISNULL(m.MountainRange, '(no mountain)') AS [Mountain]
FROM [Countries] c
LEFT JOIN [MountainsCountries] mc ON c.[CountryCode] = mc.[CountryCode]
LEFT JOIN [Peaks] p ON mc.[MountainId] = p.[MountainId]
LEFT JOIN [Mountains] m ON p.[MountainId] = m.[Id]
GROUP BY c.[CountryName],p.[PeakName],m.[MountainRange]	
ORDER BY c.[CountryName], p.[PeakName]