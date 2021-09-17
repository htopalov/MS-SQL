USE [Minions]

GO

CREATE TABLE [People](
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (Picture <= 16000000),
	[Height] DECIMAL(5,2),
	[Weight] DECIMAL(5,2),
	[Gender] CHAR(1) NOT NULL,
	CHECK(Gender='m' OR Gender='f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX),
)

GO

INSERT INTO [People]([Name],[Picture],[Height],[Weight],[Gender],[Birthdate],[Biography]) VALUES
('htopalov',Null,1.65,44.55,'f','2000-09-22',Null),
('todor',Null,2.15,95.55,'m','1989-11-02',Null),
('stamat',Null,1.55,33.00,'m','2010-04-11','sdfsdfsdfsd'),
('gosho',Null,2.15,55.55,'f','2001-11-11','saasdasdadasasdadasdasdasssd'),
('pesho',Null,1.85,90.00,'m','1983-07-22',Null)