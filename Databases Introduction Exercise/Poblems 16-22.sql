CREATE DATABASE [SoftUni]

GO

CREATE TABLE [Towns](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL
)

GO

CREATE TABLE [Addresses](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[AddressText] NVARCHAR(50) NOT NULL,
	[TownId] INT FOREIGN KEY(TownId) REFERENCES [Towns](Id)
)

GO

CREATE TABLE [Departments](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL,
)

GO

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[FirstName] NVARCHAR(30) NOT NULL,
	[MiddleName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[JobTitle] NVARCHAR(50) NOT NULL,
	[DepartmentId] INT FOREIGN KEY(DepartmentId) REFERENCES [Departments](Id),
	[HireDate] DATE NOT NULL,
	[Salary] DECIMAL(8,3) NOT NULL,
	[AddressId] INT FOREIGN KEY(AddressId) REFERENCES [Addresses](Id)
)

GO

INSERT INTO [Towns]([Name]) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

GO

INSERT INTO [Departments]([Name]) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

GO

INSERT INTO [Employees]([FirstName],[MiddleName],[LastName],[JobTitle],[DepartmentId],[HireDate],[Salary]) VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-01-02',3500.00),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02',4000.00),
('Maria','Petrova','Ivanova','Intern',5,'2016-08-28',525.25),
('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09',3000.00),
('Peter','Pan','Pan','Inter',3,'2016-08-28',3500.00)

GO

SELECT * FROM [Towns]

GO

SELECT * FROM [Departments]

GO

SELECT * FROM [Employees]

GO

SELECT * FROM [Towns]
ORDER BY [Name] ASC

GO

SELECT * FROM [Departments]
ORDER BY [Name] ASC

GO

SELECT * FROM [Employees]
ORDER BY [Salary] DESC

GO

SELECT [Name] FROM [Towns]
ORDER BY [Name] ASC

GO

SELECT [Name] FROM [Departments]
ORDER BY [Name] ASC

GO

SELECT [FirstName],[LastName],[JobTitle],[Salary] FROM [Employees]
ORDER BY [Salary] DESC

GO

UPDATE [Employees] 
	SET 
		[Salary] = [Salary] * 1.10

SELECT [Salary] FROM [Employees]  
