SELECT TOP(10)
	[e].[FirstName],
	[e].[LastName],
	[Dept].[DepartmentID]
	FROM (
			SELECT [DepartmentID],
				   AVG([Salary]) AS [AverageDepartmentSalary]
			FROM [Employees]
			GROUP BY [DepartmentID]
		 ) AS [Dept],
			  [Employees] AS [e]
WHERE [e].DepartmentID = [Dept].DepartmentID AND [e].Salary > [Dept].AverageDepartmentSalary
ORDER BY [DepartmentID]