CREATE DATABASE [Movies]

GO

CREATE TABLE [Directors](
	[Id] INT PRIMARY KEY NOT NULL,
	[DirectorName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

CREATE TABLE [Genres](
	[Id] INT PRIMARY KEY NOT NULL,
	[GenreName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY NOT NULL,
	[CategoryName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(200)
)

GO

CREATE TABLE [Movies](
	[Id] INT PRIMARY KEY NOT NULL,
	[Title] NVARCHAR(50) NOT NULL,
	[DirectorId] INT FOREIGN KEY([DirectorId]) REFERENCES [Directors](Id),
	[CopyrightYear] DATE NOT NULL,
	[Length] INT NOT NULL,
	[GenreId] INT FOREIGN KEY([GenreId]) REFERENCES [Genres](Id),
	[CategoryId] INT FOREIGN KEY([CategoryId]) REFERENCES [Categories](Id),
	[Rating] VARCHAR(10),
	[Notes] NVARCHAR(200)
)

GO

INSERT INTO [Directors]([Id],[DirectorName],[Notes]) VALUES
(1,'Director1','note1'),
(2,'Director2','note2'),
(3,'Director3','note3'),
(4,'Director4','note4'),
(5,'Director5','note5')

GO

INSERT INTO [Genres]([Id],[GenreName],[Notes]) VALUES
(1,'Genre1','note1'),
(2,'Genre2','note2'),
(3,'Genre3','note3'),
(4,'Genre4','note4'),
(5,'Genre5','note5')

GO

INSERT INTO [Categories]([Id],[CategoryName],[Notes]) VALUES
(1,'Category1','note1'),
(2,'Category2','note2'),
(3,'Category3','note3'),
(4,'Category4','note4'),
(5,'Category5','note5')

GO

INSERT INTO [Movies]([Id],[Title],[DirectorId],[CopyrightYear],[Length],[GenreId],[CategoryId],[Rating],[Notes]) VALUES
(1,'Title1',1,'2001-01-01',112,1,2,'R','note1'),
(2,'Title2',1,'2002-01-01',113,2,3,'R','note2'),
(3,'Title3',2,'2003-01-01',114,2,4,'R','note3'),
(4,'Title4',5,'2004-01-01',115,3,4,'R','note4'),
(5,'Title5',4,'2005-01-01',116,5,5,'R','note5')