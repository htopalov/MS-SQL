CREATE FUNCTION udf_GetColonistsCount(@PlanetName VARCHAR (30))
RETURNS INT
AS
BEGIN
	RETURN
	(
	SELECT COUNT(tc.[ColonistId])
	FROM [Planets] AS p
	JOIN [Spaceports] AS sp ON p.[Id] = sp.[PlanetId]
	JOIN [Journeys] AS j ON sp.[Id] = j.[DestinationSpaceportId]
	JOIN [TravelCards] AS tc ON j.[Id] = tc.[JourneyId]
	WHERE p.[Name] = @PlanetName
	)
END

SELECT dbo.udf_GetColonistsCount('Otroyphus')