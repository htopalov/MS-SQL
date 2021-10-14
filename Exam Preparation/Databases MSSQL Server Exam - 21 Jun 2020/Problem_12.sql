CREATE PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
BEGIN
	DECLARE @CurrentRoomId INT = (SELECT [RoomId] FROM [Trips] WHERE [Id] = @TripId)
	DECLARE @CurrentRoomHotelId INT = (SELECT [HotelId] FROM [Rooms] WHERE [Id] = @CurrentRoomId)
	DECLARE @TargetRoomHotelId INT = (SELECT [HotelId] FROM [Rooms] WHERE [Id] = @TargetRoomId)
	DECLARE @AccCount INT = (SELECT COUNT([TripId]) FROM [AccountsTrips] WHERE [TripId] = @TripId)
	DECLARE @TargetRoomBeds INT = (SELECT [Beds] FROM [Rooms] WHERE [Id] = @TargetRoomId)

	IF (@CurrentRoomHotelId != @TargetRoomHotelId)
		THROW 51000, 'Target room is in another hotel!', 1

	IF ( @AccCount > @TargetRoomBeds)
		THROW 52000, 'Not enough beds in target room!',1

	UPDATE [Trips]
	SET [RoomId] = @TargetRoomId
	WHERE [Id] = @TripId
END

EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10

EXEC usp_SwitchRoom 10, 7

EXEC usp_SwitchRoom 10, 8