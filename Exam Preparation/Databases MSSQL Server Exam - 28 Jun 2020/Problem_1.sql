CREATE DATABASE [ColonialJourney]

USE [ColonialJourney]

CREATE TABLE [Planets](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE [Spaceports](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[PlanetId] INT FOREIGN KEY REFERENCES [Planets]([Id]) NOT NULL
)

CREATE TABLE [Spaceships](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Manufacturer] VARCHAR(30) NOT NULL,
	[LightSpeedRate] INT DEFAULT(0)
)

CREATE TABLE [Colonists](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] VARCHAR(20) NOT NULL,
	[LastName] VARCHAR(20) NOT NULL,
	[Ucn] VARCHAR(10) UNIQUE NOT NULL,
	[BirthDate] DATE NOT NULL
)

CREATE TABLE [Journeys](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[JourneyStart] DATETIME2 NOT NULL,
	[JourneyEnd] DATETIME2 NOT NULL,
	[Purpose] VARCHAR(11),
	CHECK([Purpose] IN ('Medical','Technical','Educational','Military')),
	[DestinationSpaceportId] INT FOREIGN KEY REFERENCES [Spaceports]([Id]) NOT NULL,
	[SpaceshipId] INT FOREIGN KEY REFERENCES [Spaceships]([Id]) NOT NULL
)

CREATE TABLE [TravelCards](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[CardNumber] VARCHAR(10) UNIQUE NOT NULL,
	CHECK(LEN([CardNumber]) = 10),
	[JobDuringJourney] VARCHAR(8),
	CHECK([JobDuringJourney] IN ('Pilot','Engineer','Trooper','Cleaner','Cook')),
	[ColonistId] INT FOREIGN KEY REFERENCES [Colonists]([Id]) NOT NULL,
	[JourneyId] INT FOREIGN KEY REFERENCES [Journeys]([Id]) NOT NULL
)