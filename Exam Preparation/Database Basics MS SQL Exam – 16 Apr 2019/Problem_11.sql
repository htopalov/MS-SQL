CREATE FUNCTION udf_CalculateTickets(@origin VARCHAR(MAX), @destination VARCHAR(MAX), @peopleCount INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @IsOrigin INT = (SELECT COUNT(*) FROM [Flights] WHERE [Origin] = @origin)
	DECLARE @IsDestination INT = (SELECT COUNT(*) FROM [Flights] WHERE [Destination] = @destination)
	DECLARE @FlightId INT = (SELECT [Id] FROM [Flights] WHERE [Origin] = @origin AND [Destination] = @destination)
	DECLARE @FlightPrice DECIMAL(16,2) = (SELECT [Price] FROM [Tickets] WHERE [FlightId] = @FlightId)
	DECLARE @TotalPrice DECIMAL(16,2)

	IF(@peopleCount <= 0)
	RETURN 'Invalid people count!'

	IF(@IsOrigin = 0 OR @IsDestination = 0)
	RETURN 'Invalid flight!'

	SET @TotalPrice = @FlightPrice * @peopleCount
	RETURN CONCAT('Total price ',@TotalPrice)
END

SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', 33)

SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', -1)

SELECT dbo.udf_CalculateTickets('Invalid','Rancabolang', 33)