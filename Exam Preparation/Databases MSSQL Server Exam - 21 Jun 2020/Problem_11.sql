CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @AllRooms TABLE ([Id] INT)
    INSERT INTO @AllRooms 
    SELECT DISTINCT r.[Id]
               FROM [Rooms] AS r
          LEFT JOIN [Trips] AS t
                 ON t.[RoomId] = r.[Id]
              WHERE r.[HotelId] = @HotelId
                AND @Date BETWEEN t.[ArrivalDate] AND t.[ReturnDate]
                AND t.[CancelDate] IS NULL

    DECLARE @Room TABLE ([Id] INT, [Price] DECIMAL(15, 2), [Type] NVARCHAR(MAX), [Beds] INT, [TotalPrice] DECIMAL(15, 2))
    INSERT INTO @Room
    SELECT TOP (1)  r.[Id],
					r.[Price],
				    r.[Type],
                    r.[Beds],
                    (h.[BaseRate] + r.[Price]) * @People AS [TotalPrice]
          FROM [Rooms] AS r
     LEFT JOIN [Hotels] AS h
            ON h.[Id] = r.[HotelId]
         WHERE r.[HotelId] = @HotelId
           AND r.[Beds] >= @People
           AND r.[Id] NOT IN (SELECT [Id] FROM @AllRooms)
      ORDER BY [TotalPrice] DESC

    IF ((SELECT COUNT(*) FROM @Room) < 1)
        RETURN 'No rooms available'

    DECLARE @Result NVARCHAR(MAX)
    SET @Result = (SELECT CONCAT('Room ', r.[Id], ': ', r.[Type], ' (', r.[Beds], ' beds) - $', r.[TotalPrice]) FROM @Room AS r)

    RETURN @Result
END


SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)