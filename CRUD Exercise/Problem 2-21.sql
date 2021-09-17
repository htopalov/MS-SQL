SELECT * FROM [Departments]

GO

SELECT [Name] FROM [Departments]

GO

SELECT [FirstName],[LastName],[Salary] FROM [Employees]

GO

SELECT [FirstName],[MiddleName],[LastName] FROM [Employees]

GO

SELECT CONCAT([FirstName],'.',[LastName],'@','softuni.bg') AS [Full Email Address]
FROM [Employees]

GO

SELECT DISTINCT([Salary]) FROM [Employees]

GO

SELECT * FROM [Employees]
WHERE [JobTitle] = 'Sales Representative'

GO

SELECT [FirstName],[LastName],[JobTitle] FROM [Employees]
WHERE [Salary] BETWEEN 20000 AND 30000

GO

SELECT CONCAT([FirstName],' ',[MiddleName],' ',[LastName]) AS [Full Name]
FROM [Employees]
WHERE [Salary] = 25000 
OR [Salary] = 14000 
OR [Salary] = 12500 
OR [Salary] = 23600

GO

SELECT [FirstName],[LastName] FROM [Employees]
WHERE [ManagerID] IS NULL

GO

SELECT [FirstName],[LastName] FROM [Employees]
WHERE [Salary] > 50000
ORDER BY [Salary] DESC

GO

SELECT TOP(5) [FirstName],[LastName] FROM [Employees]
ORDER BY [Salary] DESC

GO

SELECT [FirstName],[LastName] FROM [Employees]
WHERE [DepartmentID] != 4

GO

SELECT * FROM [Employees]
ORDER BY 
	[Salary] DESC,
	[FirstName] ASC,
	[LastName] DESC,
	[MiddleName] ASC

GO

CREATE VIEW V_EmployeesSalaries AS
SELECT [FirstName],[LastName],[Salary]
FROM [Employees]

GO

CREATE VIEW V_EmployeeNameJobTitle AS
SELECT CONCAT([FirstName],' ',ISNULL([MiddleName], ''),' ',[LastName]) AS [Full Name], [JobTitle] 
FROM [Employees]

GO

SELECT DISTINCT([JobTitle]) FROM [Employees]

GO

SELECT TOP(10) * FROM [Projects]
WHERE [StartDate] IS NOT NULL
ORDER BY 
	[StartDate],
	[Name]

GO

SELECT TOP(7) [FirstName],[LastName],[HireDate] FROM [Employees]
ORDER BY
	[HireDate] DESC

GO
