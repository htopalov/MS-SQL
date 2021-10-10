CREATE PROCEDURE usp_WithdrawMoney (@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	UPDATE [Accounts]
	SET [Balance] -= @MoneyAmount
	WHERE [Id] = @AccountId
	IF ((SELECT [Balance] FROM [Accounts] WHERE [Id] = @AccountId) < 0)
		ROLLBACK
COMMIT

EXECUTE usp_WithdrawMoney 5,25