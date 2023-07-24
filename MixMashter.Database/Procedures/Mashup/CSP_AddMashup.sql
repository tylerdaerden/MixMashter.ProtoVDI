CREATE PROCEDURE [dbo].[CSP_AddMashup]
	@Title NVARCHAR(80),
	@Tag NVARCHAR(50),
	@PathFile NVARCHAR(384),
	@Length INT,
	@TrackId INT,
	@MasherId INT

AS
BEGIN
INSERT INTO [Mashup]([Title] , [Tag] , [PathFile],[Length],[TrackId],[MasherId])
VALUES ( @Title , @Tag , @PathFile , @Length , @TrackId , @MasherId )

--check de l'insertion du Mashup
IF @@ROWCOUNT > 0
BEGIN 
	PRINT 'Le Mashup a bien été ajouté avec succès  '
	RETURN 0
		END

ELSE
BEGIN 
	PRINT ' Erreur dans Ajout du Mashup'
	RETURN 1
		END 

END