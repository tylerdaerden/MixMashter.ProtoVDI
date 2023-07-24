CREATE PROCEDURE [dbo].[CSP_AddTrack]
	@Title NVARCHAR(80),
	@Length INT , 
	@Tag NVARCHAR(50)
AS
BEGIN 
	DECLARE @ArtistId INT

	-- Vérification si l'artiste existe dans la base de données en utilisant le Tag de la track
	IF EXISTS (SELECT 1 FROM [Artist] WHERE [Tag] = SUBSTRING(@Tag, 1, 3))
	BEGIN
		-- Récupération de l'ID de l'artiste existant
		SELECT @ArtistId = [Id] FROM [Artist] WHERE [Tag] = SUBSTRING(@Tag, 1, 3)

		-- Insertion de la track avec l'ID de l'artiste correspondant
		INSERT INTO [Track] ([Title], [Length], [Tag], [ArtistId])
		VALUES (@Title, @Length, @Tag, @ArtistId)

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
