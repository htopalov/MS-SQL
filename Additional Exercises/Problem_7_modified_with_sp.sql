--Problem solved with stored procedure to avoid repetion of same actions
--Solution will not pass tests in SoftUni Judge

CREATE PROCEDURE usp_BuyItem (@userId INT, @gameId INT, @itemId INT)
AS
BEGIN TRANSACTION

UPDATE [UsersGames]
  SET
      [Cash] -= 
(
    SELECT [Price]
    FROM [Items]
    WHERE [Id] = @itemId
)
WHERE [UserId] = @userId AND [GameId] = @gameId

IF(0 >
  (
      SELECT [Cash]
      FROM [UsersGames]
      WHERE [UserId] = @userId AND [GameId] = @gameId
  ))
    BEGIN
        PRINT 'Cash is not enough!'
        ROLLBACK
	END

INSERT INTO [UserGameItems]
VALUES
(
       @itemId,
	(
		SELECT Id
		FROM UsersGames
		WHERE [UserId] = @userId AND [GameId] = @gameId
	)
)

COMMIT

GO

CREATE FUNCTION udf_GetItemId
(
	@ItemName VARCHAR(MAX)
)
RETURNS INT
AS
	BEGIN
		DECLARE @result INT = (SELECT [Id] 
		FROM [Items] 
		WHERE [Name] = @ItemName)
		RETURN @result
	END

GO

DECLARE @user INT = (SELECT [Id] FROM [Users] WHERE [Username] = 'Alex')
DECLARE @game INT = (SELECT [Id] FROM [Games] WHERE [Name] = 'Edinburgh')
DECLARE @item1 INT = [dbo].udf_GetItemId('Blackguard')
DECLARE @item2 INT = [dbo].udf_GetItemId('Bottomless Potion of Amplification')
DECLARE @item3 INT = [dbo].udf_GetItemId('Eye of Etlich (Diablo III)')
DECLARE @item4 INT = [dbo].udf_GetItemId('Gem of Efficacious Toxin')
DECLARE @item5 INT = [dbo].udf_GetItemId('Golden Gorget of Leoric')
DECLARE @item6 INT = [dbo].udf_GetItemId('Hellfire Amulet')


EXECUTE usp_BuyItem @user,@game,@item1
EXECUTE usp_BuyItem @user,@game,@item2
EXECUTE usp_BuyItem @user,@game,@item3
EXECUTE usp_BuyItem @user,@game,@item4
EXECUTE usp_BuyItem @user,@game,@item5
EXECUTE usp_BuyItem @user,@game,@item6

GO

SELECT u.[Username],
       g.[Name],
       ug.[Cash],
       i.[Name] AS [Item Name]
FROM [Users] AS u
     JOIN [UsersGames] AS ug ON ug.[UserId] = u.[Id]
     JOIN [Games] AS g ON g.[Id] = ug.[GameId]
     JOIN [UserGameItems] AS ugi ON ugi.[UserGameId] = ug.[Id]
     JOIN [Items] AS i ON i.[Id] = ugi.[ItemId]
WHERE g.[Id] = (SELECT [Id] FROM [Games] WHERE [Name] = 'Edinburgh')
ORDER BY [Item Name]