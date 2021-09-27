SELECT 
	e.[FirstName],
	e.[LastName],
	e.[HireDate],
	d.[Name] AS [DeptName]
FROM [Employees] e
JOIN [Departments] d ON e.[DepartmentID] = d.[DepartmentID]
WHERE d.[Name] IN (SELECT [Name] FROM [Departments] WHERE [Name] IN('Sales','Finance'))
ORDER BY e.[HireDate]