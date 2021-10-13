	CREATE FUNCTION udf_GetCost(@JobId INT) 
	RETURNS DECIMAL(16, 2) AS
	BEGIN
		DECLARE @Total DECIMAL(16, 2)
		SELECT @Total = SUM([PartsPrice]) FROM
		(
			SELECT ISNULL(SUM(p.[Price] * op.[Quantity]), 0) AS [PartsPrice] FROM [Orders] AS o
			JOIN [OrderParts] AS op
			ON o.[OrderId] = op.[OrderId]
			JOIN [Parts] AS p
			ON op.[PartId] = p.[PartId]
			WHERE o.[JobId] = @JobId
		) AS t
		RETURN @Total
	END


SELECT dbo.udf_GetCost(1)