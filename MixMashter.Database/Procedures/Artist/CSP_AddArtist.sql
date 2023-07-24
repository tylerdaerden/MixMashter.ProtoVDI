CREATE PROCEDURE [dbo].[CSP_AddArtist]
	@ArtistName NVARCHAR(80) ,
	@BandName NVARCHAR(80) , 
	@Genres NVARCHAR(120) ,
	@Tag NVARCHAR(80)

AS
BEGIN 
INSERT INTO [Artist] ( [ArtistName], [BandName], [Genres], [Tag] )
VALUES ( @ArtistName , @BandName , @Genres , @Tag )

--Check Insertion


IF @@ROWCOUNT > 0
BEGIN 
	PRINT ' Artist Ajouté avec succès  '
	RETURN 0
	END

ELSE
BEGIN 
	PRINT ' Erreur dans ajout Artist '
	RETURN 1
	END

END


