CREATE FUNCTION ufn_CalculateFutureValue (@InitialSum DECIMAL(15,4),@YearlyIntRate FLOAT,@Years INT)
RETURNS DECIMAL(15,4)
AS
BEGIN
		RETURN @InitialSum * POWER((1+@YearlyIntRate),@Years)
END

SELECT [dbo].[ufn_CalculateFutureValue](1000,0.1,5)