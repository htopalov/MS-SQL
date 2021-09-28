SELECT MIN(a.[AverageSalary]) AS [MinimumAverageSalary]
FROM
(
SELECT AVG([Salary]) AS [AverageSalary]
FROM [Employees]
GROUP BY [DepartmentID]
) AS a