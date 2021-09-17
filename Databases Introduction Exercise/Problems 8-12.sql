USE [Minions]

GO

CREATE TABLE [Users](
	[Id] BIGINT IDENTITY PRIMARY KEY NOT NULL,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[ProfilePicture] VARBINARY(MAX),
	CHECK (ProfilePicture <= 900000),
	[LastLoginTime] DATETIME2,
	[IsDeleted] BIT
)

GO

INSERT INTO [Users]([Username],[Password],[ProfilePicture],[LastLoginTime],[IsDeleted])
VALUES('htopalov','123456',NULL,'2016-10-23 12:45:37.333',1)

GO

INSERT INTO [Users]([Username],[Password],[ProfilePicture],[LastLoginTime],[IsDeleted]) VALUES
('ivanov','1234567',NULL,'2016-10-28 12:45:37.333',0),
('stamat','12345asd67',NULL,'2020-10-28 12:45:37.333',1),
('pesho','234567',NULL,'2014-10-28 12:45:37.333',0),
('todor','1234567234',NULL,'2000-10-28 12:45:37.333',0),
('stamat','12345asd67',NULL,'2020-10-28 12:45:37.333',1)

GO

ALTER TABLE [Users]
DROP CONSTRAINT PK__Users__3214EC07BF4D66A3

GO

ALTER TABLE [Users]
ADD CONSTRAINT PK_Composite PRIMARY KEY([Id],[Username])

GO

ALTER TABLE [Users]
ADD CONSTRAINT Least_symbols_pass CHECK (DATALENGTH([Password]) > 5)

GO

ALTER TABLE [Users]
ADD CONSTRAINT Default_Date DEFAULT GETDATE() FOR [LastLoginTime]

GO

ALTER TABLE [Users]
DROP CONSTRAINT PK_Composite

GO

ALTER TABLE [Users]
ADD CONSTRAINT PK_Id PRIMARY KEY([Id])

GO

ALTER TABLE [Users]
ADD CONSTRAINT Username_least_3 UNIQUE([Username])

GO

ALTER TABLE [Users]
ADD CONSTRAINT Username_length CHECK(DATALENGTH([Username]) >= 3)