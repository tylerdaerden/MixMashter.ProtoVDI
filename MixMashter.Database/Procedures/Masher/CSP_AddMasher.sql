CREATE PROCEDURE [dbo].[CSP_AddMasher]
	@MasherName NVARCHAR(80),
	@Tag NVARCHAR(80)

AS
BEGIN
INSERT INTO [Masher] ( [MasherName] , [Tag] )
VALUES ( @MasherName , @Tag )

--Check Insertion 

IF @@ROWCOUNT > 0
BEGIN 
	PRINT ' Masher Ajouté avec succès '
	RETURN 0
	END

ELSE
BEGIN 
	PRINT ' Erreur dans ajout du Masher '
	RETURN 1
	END


END
