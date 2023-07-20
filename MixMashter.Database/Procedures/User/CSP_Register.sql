CREATE PROCEDURE [dbo].[CSP_Register]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(80),
	@UserName NVARCHAR(80),
	@Email NVARCHAR(80),
	@BirthDate DATE,
	@Passwd NVARCHAR(30)
AS
BEGIN
	-- Insertion des données dans la table User
	INSERT INTO [User] ([FirstName], [LastName], [UserName], [Email], [BirthDate], [Passwd])
	VALUES (@FirstName, @LastName, @UserName, @Email, CONVERT(DATE, @BirthDate, 103), dbo.CSF_HashPassword(@Passwd))

	-- Vérification du résultat de l'insertion
	IF @@ROWCOUNT > 0
	BEGIN
		PRINT 'L''utilisateur a été enregistré avec succès.'
		RETURN 0
	END
	ELSE
	BEGIN
		PRINT 'L''enregistrement de l''utilisateur a échoué.'
		RETURN 1
	END
END
