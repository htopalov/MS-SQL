CREATE DATABASE [CarRental]

GO

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY NOT NULL,
	[CategoryName] NVARCHAR(50) NOT NULL,
	[DailyRate] DECIMAL(5,2) NOT NULL,
	[WeeklyRate] DECIMAL(5,2) NOT NULL,
	[MonthlyRate] DECIMAL(5,2) NOT NULL,
	[WeekendRate] DECIMAL(5,2) NOT NULL,
)

GO

CREATE TABLE [Cars](
	[Id] INT PRIMARY KEY NOT NULL,
	[PlateNumber] NVARCHAR(10) NOT NULL,
	[Manufacturer] NVARCHAR(20) NOT NULL,
	[Model] NVARCHAR(20) NOT NULL,
	[CarYear] DATE NOT NULL,
	[CategoryId] INT FOREIGN KEY([CategoryId]) REFERENCES [Categories](Id),
	[Doors] INT NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK(Picture <= 1000000),
	[Condition] NVARCHAR(10) NOT NULL,
	[Available] BIT NOT NULL
)

GO

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(10) NOT NULL,
	[LastName] NVARCHAR(10) NOT NULL,
	[Title] NVARCHAR(20) NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

CREATE TABLE [Customers](
	[Id] INT PRIMARY KEY NOT NULL,
	[DriverLicenceNumber] INT NOT NULL,
	[FullName] NVARCHAR(30) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[ZIPCode] INT NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

CREATE TABLE [RentalOrders](
	[Id] INT PRIMARY KEY NOT NULL,
	[EmployeeId] INT FOREIGN KEY([EmployeeId]) REFERENCES [Employees](Id),
	[CustomerId] INT FOREIGN KEY([CustomerId]) REFERENCES [Customers](Id),
	[CarId] INT FOREIGN KEY([CarId]) REFERENCES [Cars](Id),
	[TankLevel] DECIMAL(5,2) NOT NULL,
	[KilometrageStart] INT NOT NULL,
	[KilometrageEnd] INT NOT NULL,
	[TotalKilometrage] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] DECIMAL(5,2) NOT NULL,
	[TaxRate] DECIMAL(5,2) NOT NULL,
	[OrderStatus] BIT NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

INSERT INTO [Categories]([Id],[CategoryName],[DailyRate],[WeeklyRate],[MonthlyRate],[WeekendRate]) VALUES
(1,'Category1', 5.12,4.34,15.21,23.90),
(2,'Category2', 2.12,6.34,13.21,24.90),
(3,'Category3', 3.12,7.34,11.21,25.90)

GO

INSERT INTO [Cars]([Id],[PlateNumber],[Manufacturer],[Model],[CarYear],[CategoryId],[Doors],[Picture],[Condition],[Available]) VALUES
(1, 'ST1234SA','Subaru','Impreza','2001-01-01',1,5,NULL,'Used',1),
(2, 'ST5678SA','BMW','E36','2014-01-01',2,5,NULL,'Used',0),
(3, 'ST9999SA','Mercedes','C200','2021-01-01',3,5,NULL,'New',1)

GO

INSERT INTO [Employees]([Id],[FirstName],[LastName],[Title],[Notes]) VALUES
(1,'Stamat','Stamatov', 'Director', NULL),
(2,'Pesho','Petrov', 'Manager', 'note2'),
(3,'Ivanov','Ivan', 'Salesman', 'note3')

GO

INSERT INTO [Customers]([Id],[DriverLicenceNumber],[FullName],[Address],[City],[ZIPCode],[Notes]) VALUES
(1, 123454,'Hristo Topalov','Starozagoska','Kazanlak', 6100, NULL),
(2, 12233454,'Dimitar Ivanov','Opalchenska','Plovdiv', 2300, NULL),
(3, 12343354,'Galin Georgiev','Buzludja','Sofia', 1000, NULL)

GO

INSERT INTO [RentalOrders]([Id],[EmployeeId],[CustomerId],[CarId],[TankLevel],[KilometrageStart],[KilometrageEnd]
,[TotalKilometrage],[StartDate],[EndDate],[TotalDays],[RateApplied],[TaxRate],[OrderStatus],[Notes]) VALUES
(1,1,1,1,25.34,1234,1255,23,'2001-01-01','2001-01-23',22,5.4,10.1,1,NULL),
(2,1,2,1,32.84,5555,5556,23,'2002-02-02','2002-02-23',24,5.2,13.1,0,NULL),
(3,1,3,2,67.44,55667,55669,23,'2003-03-03','2003-03-15',22,5.4,14.0,0,NULL)