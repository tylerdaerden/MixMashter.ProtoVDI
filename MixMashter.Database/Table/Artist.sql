CREATE TABLE [dbo].[Artist]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[ArtistName] NVARCHAR(80) NOT NULL ,
	[BandName] NVARCHAR(80) ,
	[Genres] NVARCHAR(120) NOT NULL ,
	[Tag] NVARCHAR(80)NOT NULL

	CONSTRAINT [PK_Artist] Primary Key([Id]),
	CONSTRAINT [UK_Artist_Tag] UNIQUE ([Tag])

)
