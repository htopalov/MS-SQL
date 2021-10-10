CREATE OR ALTER PROCEDURE usp_DepositMoney(@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	UPDATE [Accounts]
	SET [Balance] += @MoneyAmount
	WHERE [Id] = @AccountId
COMMIT

EXECUTE usp_DepositMoney