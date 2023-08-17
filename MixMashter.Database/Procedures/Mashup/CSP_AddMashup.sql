--SOUCIS SUR LA RECUPERATION DE LA TRACK ID A CORRIGER !!!



CREATE PROCEDURE [dbo].[CSP_AddMashup]
    @Title NVARCHAR(160),
    @PathFile NVARCHAR(384),
    @Length INT,
    @TrackTags NVARCHAR(1000),
    @MasherTag NVARCHAR(1000)
AS
BEGIN
    DECLARE @MasherId INT, @MashupId INT , @TrackId INT

    -- Vérification si le Masher existe dans la base de données en utilisant le Tag
    IF EXISTS (SELECT 1 FROM [Masher] WHERE [Tag] = @MasherTag)
    BEGIN
        -- Récupération de l'ID du Masher existant
        SELECT @MasherId = [Id] FROM [Masher] WHERE [Tag] = @MasherTag

        --Récupération ID des tracks existantes
        SELECT @TrackId =[Id] FROM [Track] WHERE [Tag] = @TrackTags

        -- Génération du Tag pour le Mashup en utilisant les Tags des Tracks
        DECLARE @MashupTag NVARCHAR(1000)
        SELECT @MashupTag = CONCAT(@MasherTag, '_', @TrackTags)

        -- Insertion du Mashup avec l'ID du Masher correspondant et le Tag généré
        INSERT INTO [Mashup] ([Title], [Tag], [PathFile], [Length],[TrackId], [MasherId])
        VALUES (@Title, @MashupTag, @PathFile, @Length, @TrackId , @MasherId)

        -- Vérification de l'insertion
        IF @@ROWCOUNT > 0 
        BEGIN
            PRINT 'Le Mashup a bien été ajouté avec succès.'
            SELECT @MashupId = SCOPE_IDENTITY()

            -- Vérification si les Tags des Tracks existent dans la base de données
            DECLARE @TrackIds NVARCHAR(1000)
            SELECT @TrackIds = STRING_AGG([Id], ',') FROM [Track] WHERE [Tag] IN (SELECT value FROM STRING_SPLIT(@TrackTags, ','))

            IF @TrackIds IS NULL
            BEGIN
                PRINT 'Erreur : Un ou plusieurs TrackTags spécifiés ne correspondent à aucune Track existante.'
                PRINT 'Veuillez vérifier les Tags des Tracks avant d''ajouter le Mashup.'
                DELETE FROM [Mashup] WHERE [Id] = @MashupId -- Suppression du Mashup si les Tracks ne sont pas valides
                RETURN 1
            END

            -- Insérer les relations entre le Mashup et les Tracks via la table de jointure MashupTrack
            INSERT INTO [MashupTrack] ([MashupId], [TrackId])
            SELECT @MashupId, [Value] FROM STRING_SPLIT(@TrackIds, ',')

            -- Vérification de l'insertion dans MashupTrack
            IF @@ROWCOUNT > 0
            BEGIN
                PRINT 'Les Tracks ont bien été associées au Mashup.'
                RETURN 0
            END
            ELSE
            BEGIN
                PRINT 'Erreur lors de l''association des Tracks au Mashup.'
                DELETE FROM [Mashup] WHERE [Id] = @MashupId -- Suppression du Mashup si l'association a échoué
                RETURN 1
            END
        END
        ELSE 
        BEGIN 
            PRINT 'Erreur pendant ajout Mashup.'
            RETURN 1
        END
    END
    ELSE
    BEGIN
        PRINT 'Le Masher avec le Tag spécifié n''existe pas dans la base de données.'
        PRINT 'Veuillez d''abord ajouter le Masher avant d''ajouter le Mashup.'
        PRINT 'Erreur pendant ajout Mashup.'
        RETURN 1
    END
END
