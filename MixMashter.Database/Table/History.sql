CREATE TABLE [dbo].[History]
(
	[Id] INT NOT NULL ,
	[UserId] INT NOT NULL , 
	[MashupId] INT NOT NULL,
	[LastPlayed] Date

	CONSTRAINT [PK_HistoryId] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_History_User] FOREIGN KEY ([UserId]) REFERENCES [User](Id),
	CONSTRAINT [FK_History_Mashup] FOREIGN KEY ([MashupId]) REFERENCES [Mashup](Id)
)
