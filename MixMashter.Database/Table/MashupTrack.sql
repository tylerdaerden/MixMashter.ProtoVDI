CREATE TABLE [dbo].[MashupTrack]
(
    [MashupId] INT NOT NULL,
    [TrackId] INT NOT NULL,

    CONSTRAINT [PK_MashupTrack] PRIMARY KEY ([MashupId], [TrackId]),
    CONSTRAINT [FK_MashupTrack_Mashup] FOREIGN KEY ([MashupId]) REFERENCES [Mashup] (Id),
    CONSTRAINT [FK_MashupTrack_Track] FOREIGN KEY ([TrackId]) REFERENCES [Track] (Id)
);
