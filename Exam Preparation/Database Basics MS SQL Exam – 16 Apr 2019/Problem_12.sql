CREATE PROCEDURE usp_CancelFlights
AS
BEGIN
		UPDATE Flights
       	SET [ArrivalTime] = NULL, [DepartureTime] = NULL
        WHERE [ArrivalTime] > [DepartureTime]	
END

EXEC usp_CancelFlights