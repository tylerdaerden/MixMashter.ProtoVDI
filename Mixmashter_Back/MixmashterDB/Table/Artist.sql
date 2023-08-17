CREATE TABLE [dbo].[Artist]
(
	[Id] INT NOT NULL IDENTITY (1,1),
	[ArtistName] NVARCHAR(80) NOT NULL ,
	[Genre] NVARCHAR(50) NOT NULL ,
	[Tag] NVARCHAR (80) NOT NULL

	CONSTRAINT [PK_Artist] Primary Key([Id]),
	CONSTRAINT [UK_Artist_Tag] Unique([Id])
)
