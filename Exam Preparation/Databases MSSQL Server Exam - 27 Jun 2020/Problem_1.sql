CREATE DATABASE [WMS]

USE [WMS]

CREATE TABLE [Clients](
	[ClientId] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL,
	[Phone] VARCHAR(12) NOT NULL
)

CREATE TABLE [Mechanics](
	[MechanicId] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(255) NOT NULL
)

CREATE TABLE [Vendors](
	[VendorId] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE [Parts](
	[PartId] INT PRIMARY KEY IDENTITY NOT NULL,
	[SerialNumber] VARCHAR(50) UNIQUE NOT NULL,
	[Description] VARCHAR(255),
	[Price] MONEY
	CHECK([Price] > 0),
	[VendorId] INT FOREIGN KEY ([VendorId]) REFERENCES [Vendors]([VendorId]) NOT NULL,
	[StockQty] INT DEFAULT 0
	CHECK([StockQty] >= 0)
)

CREATE TABLE [Models](
	[ModelId] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE [Jobs](
	[JobId] INT PRIMARY KEY IDENTITY NOT NULL,
	[ModelId] INT FOREIGN KEY([ModelId]) REFERENCES [Models]([ModelId]) NOT NULL,
	[Status] VARCHAR(11) NOT NULL DEFAULT 'Pending'
	CHECK([Status] IN('In Progress','Finished','Pending')),
	[ClientId] INT FOREIGN KEY ([ClientId]) REFERENCES [Clients]([ClientId]) NOT NULL,
	[MechanicId] INT FOREIGN KEY([MechanicId]) REFERENCES [Mechanics]([MechanicId]),
	[IssueDate] DATE NOT NULL,
	[FinishDate] DATE
)

CREATE TABLE [Orders](
	[OrderId] INT PRIMARY KEY IDENTITY NOT NULL,
	[JobId] INT FOREIGN KEY([JobId]) REFERENCES [Jobs]([JobId]) NOT NULL,
	[IssueDate] DATE,
	[Delivered] BIT DEFAULT 0
)

CREATE TABLE [OrderParts](
	[OrderId] INT FOREIGN KEY([OrderId]) REFERENCES [Orders]([OrderId]) NOT NULL,
	[PartId] INT FOREIGN KEY([PartId]) REFERENCES [Parts]([PartId]) NOT NULL,
	[Quantity] INT NOT NULL DEFAULT 1
	CHECK([Quantity] > 0),
	CONSTRAINT PK_OrderId_PartId PRIMARY KEY ([OrderId],[PartId])
)

CREATE TABLE [PartsNeeded](
	[JobId] INT FOREIGN KEY([JobId]) REFERENCES [Jobs]([JobId]) NOT NULL,
	[PartId] INT FOREIGN KEY([PartId]) REFERENCES [Parts]([PartId]) NOT NULL,
	[Quantity] INT NOT NULL DEFAULT 1
	CHECK([Quantity] > 0),
	CONSTRAINT PK_JobId_PartId PRIMARY KEY ([JobId],[PartId])
)