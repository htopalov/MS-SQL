CREATE PROCEDURE usp_CalculateFutureValueForAccount (@AccountId INT,@InterestRate FLOAT)
AS
BEGIN
		SELECT 
			ah.[Id],
			ah.[FirstName] AS [First Name],
			ah.[LastName] AS [Last Name],
			a.[Balance] AS [Current Balance],
			[dbo].ufn_CalculateFutureValue([Balance],@InterestRate,5) AS [Balance in 5 years]
		FROM [AccountHolders] AS ah
		LEFT JOIN [Accounts] AS a ON ah.[Id] = a.[Id]
		WHERE ah.[Id] = @AccountId
END

EXECUTE usp_CalculateFutureValueForAccount 1,0.1