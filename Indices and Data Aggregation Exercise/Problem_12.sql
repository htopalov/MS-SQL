SELECT SUM(XX.DIFF) AS [SumDifference]
FROM (
		SELECT DepositAmount - (SELECT DepositAmount FROM WizzardDeposits WHERE Id = g.Id + 1) AS DIFF 
		FROM WizzardDeposits g
	 ) AS XX