CREATE PROCEDURE usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
BEGIN TRANSACTION
	EXECUTE usp_DepositMoney @ReceiverId, @Amount
	EXECUTE usp_WithdrawMoney @SenderId, @Amount
COMMIT

EXECUTE usp_TransferMoney 5,1,5000