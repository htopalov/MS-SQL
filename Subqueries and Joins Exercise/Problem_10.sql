SELECT TOP(50)
	e.[EmployeeID],
	CONCAT(e.[FirstName], ' ', e.[LastName]),
	CONCAT(m.[FirstName], ' ', m.[LastName]) AS [ManagerName],
	d.[Name] AS [DepartmentName]
FROM [Employees] e
LEFT JOIN [Employees] m ON m.[EmployeeID] = e.[ManagerID]
LEFT JOIN [Departments] d ON e.DepartmentID = d.[DepartmentID]
ORDER BY e.[EmployeeID]