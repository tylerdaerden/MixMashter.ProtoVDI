CREATE TABLE [dbo].[Track]
(
	[Id] INT NOT NULL ,
	[Title] NVARCHAR(80) NOT NULL, 
	[Length]INT NOT NULL , 
	[Tag] NVARCHAR(50) NOT NULL , 
	[ArtistId] INT NOT NULL

	CONSTRAINT [PK_Track] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_Track_Artist] FOREIGN KEY ([ArtistId]) REFERENCES [Artist](Id)
)
