CREATE PROCEDURE [dbo].[MMSP_Register]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@UserName NVARCHAR(50),
	@Email NVARCHAR(384),
	@Password NVARCHAR(30)
AS
BEGIN 
	INSERT INTO [User] ([FirstName] , [LastName] , [UserName], [Email], [Password])
	VALUES (@FirstName , @LastName , @UserName , @Email ,dbo.MMSF_HashPassword(@Password))

	--Check de l'insertion : je passe par un Rowcount 👇

	IF @@ROWCOUNT > 0
		BEGIN 
			PRINT 'User enregistré avec succès'
		RETURN 0
		END
	ELSE 
		BEGIN
			PRINT 'Erreur au Niveau enregistrement User'
		RETURN 1
		END
END
