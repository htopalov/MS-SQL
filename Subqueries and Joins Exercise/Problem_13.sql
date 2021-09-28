SELECT mc.[CountryCode],
	   COUNT(mc.[CountryCode])
FROM [MountainsCountries] mc
JOIN [Mountains] m ON m.[Id] = mc.[MountainId]
WHERE mc.[CountryCode] IN ('US','BG','RU')
GROUP BY mc.[CountryCode]