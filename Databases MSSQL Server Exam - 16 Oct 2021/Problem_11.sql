CREATE FUNCTION udf_ClientWithCigars(@name NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @CigarCount INT =   (	
									SELECT COUNT(cc.[CigarId])
									FROM [Clients] AS c
									JOIN [ClientsCigars] AS cc ON c.[Id] = cc.[ClientId]
									WHERE [FirstName] = @name
								)
	RETURN @CigarCount
END


SELECT dbo.udf_ClientWithCigars('Betty')