CREATE TABLE [dbo].[TrackArtist]
(
    [TrackId] INT NOT NULL,
    [ArtistId] INT NOT NULL,

    CONSTRAINT [PK_TrackArtist] PRIMARY KEY ([TrackId], [ArtistId]),
    CONSTRAINT [FK_TrackArtist_Track] FOREIGN KEY ([TrackId]) REFERENCES [Track] (Id),
    CONSTRAINT [FK_TrackArtist_Artist] FOREIGN KEY ([ArtistId]) REFERENCES [Artist] (Id)
);

