CREATE PROCEDURE [dbo].[CSP_AddMashup]
	@Title NVARCHAR(80),
	@Tag NVARCHAR(80),
	@PathFile NVARCHAR(384),
	@Length INT,
	@TrackTags NVARCHAR(1000),
	@MasherTag NVARCHAR(1000)
AS
BEGIN
	DECLARE @MasherId INT, @MashupId INT

	-- Vérification si le Masher existe dans la base de données en utilisant le Tag
	IF EXISTS (SELECT 1 FROM [Masher] WHERE [Tag] = @MasherTag)
	BEGIN
		-- Récupération de l'ID du Masher existant
		SELECT @MasherId = [Id] FROM [Masher] WHERE [Tag] = @MasherTag

		-- Insertion du Mashup avec l'ID du Masher correspondant
		INSERT INTO [Mashup] ([Title], [Tag], [PathFile], [Length], [MasherId])
		VALUES (@Title, @Tag, @PathFile, @Length, @MasherId)

		-- Vérification de l'insertion
		IF @@ROWCOUNT > 0 
		BEGIN
			PRINT 'Le Mashup a bien été ajouté avec succès.'
			SELECT @MashupId = SCOPE_IDENTITY()

			-- Vérification si les Tags des Tracks existent dans la base de données
			IF NOT EXISTS (SELECT 1 FROM [Track] WHERE [Tag] IN (SELECT value FROM STRING_SPLIT(@TrackTags, ',')))
			BEGIN
				PRINT 'Erreur : Un ou plusieurs TrackTags spécifiés ne correspondent à aucune Track existante.'
				PRINT 'Veuillez vérifier les Tags des Tracks avant d''ajouter le Mashup.'
				DELETE FROM [Mashup] WHERE [Id] = @MashupId -- Suppression du Mashup si les Tracks ne sont pas valides
				RETURN 1
			END

			-- Insertion des relations entre le Mashup et les Tracks
			INSERT INTO [MashupTrack] ([MashupId], [TrackId])
			SELECT @MashupId, [Id] FROM [Track] WHERE [Tag] IN (SELECT value FROM STRING_SPLIT(@TrackTags, ','))

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
