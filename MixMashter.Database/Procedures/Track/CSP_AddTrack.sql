CREATE PROCEDURE [dbo].[CSP_AddTrack]
	@Title NVARCHAR(80),
	@Length INT , 
	@ArtistTag NVARCHAR(80),
	@TrackTag NVARCHAR(80)

AS
BEGIN 
	DECLARE @ArtistId INT , @Track_ArtistTag NVARCHAR(80)

	-- Vérification si l'artiste existe dans la base de données en utilisant le Tag de la track
	IF EXISTS (SELECT 1 FROM [Artist] WHERE [Tag] = SUBSTRING(@ArtistTag, 1, 6))
	BEGIN
		-- Récupération de l'ID de l'artiste existant
		SELECT @ArtistId = [Id] FROM [Artist] WHERE [Tag] = SUBSTRING(@ArtistTag, 1, 6)
		SELECT @Track_ArtistTag = CONCAT(@ArtistTag,'_',@TrackTag)

		-- Insertion de la track avec l'ID de l'artiste correspondant
		INSERT INTO [Track] ([Title], [Length], [Tag], [ArtistId])
		VALUES (@Title, @Length, @Track_ArtistTag, @ArtistId)

		-- Vérification de l'insertion
		IF @@ROWCOUNT > 0 
		BEGIN
			PRINT 'Track Ajoutée'
		END
		ELSE 
		BEGIN 
			PRINT 'Erreur Ajout Track'
		END
	END
	ELSE
	BEGIN
		-- L'artiste n'existe pas, renvoyer une erreur
		PRINT 'L''artiste avec le Tag spécifié n''existe pas dans la base de données.'
		PRINT 'Veuillez d''abord ajouter l''artiste avant d''ajouter la track.'
		PRINT 'Erreur Ajout Track'
	END
END
