CREATE DATABASE [Minions]

GO

USE [Minions]

GO

CREATE TABLE [Minions](
	[Id] INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Age] INT NOT NULL
)

GO

CREATE TABLE [Towns](
	[Id] INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL
)

GO

ALTER TABLE [Minions]
ADD [TownId] INT FOREIGN KEY(TownId) REFERENCES [Towns](Id) NOT NULL

GO

INSERT INTO [Towns] ([Id],[Name])
VALUES(1,'Sofia')

GO

INSERT INTO [Towns] ([Id],[Name])
VALUES(2,'Plovdiv')

GO

INSERT INTO [Towns] ([Id],[Name])
VALUES(3,'Varna')

GO

INSERT INTO [Minions] ([Id],[Name],[Age],[TownId])
VALUES(1,'Kevin',22,1)

GO

INSERT INTO [Minions] ([Id],[Name],[Age],[TownId])
VALUES(2,'Bob',15,3)

GO

ALTER TABLE [Minions] ALTER COLUMN [Age] INTEGER

GO

INSERT INTO [Minions] ([Id],[Name],[Age],[TownId])
VALUES(3,'Steward',NULL,2)

GO

TRUNCATE TABLE [Minions]

GO

DROP TABLE [Minions]

GO

DROP TABLE [Towns]