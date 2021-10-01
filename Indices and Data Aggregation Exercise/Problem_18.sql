SELECT DISTINCT [DepartmentID],[Salary] AS [ThirdHighestSalary] FROM
(
   SELECT *,
         DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Row]
   FROM [Employees]
) AS [SalResult]
WHERE [Row] = 3