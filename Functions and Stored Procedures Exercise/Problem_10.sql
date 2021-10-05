CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@Number MONEY)
AS
BEGIN
	SELECT a.[FirstName],a.[LastName]
	FROM [AccountHolders] AS a
	LEFT JOIN [Accounts] AS acc ON a.[Id] = acc.[AccountHolderId]
	GROUP BY a.[FirstName],a.[LastName]
	HAVING SUM(acc.[Balance]) > @Number
	ORDER BY a.[FirstName],a.[LastName]
END

EXECUTE usp_GetHoldersWithBalanceHigherThan 10000