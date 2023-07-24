CREATE PROCEDURE [dbo].[CSP_Login]
	@UserName NVARCHAR(80),
	@Email NVARCHAR(384),
	@Password NVARCHAR(20)
AS
BEGIN
	DECLARE @Result INT

	SELECT [Id], [FirstName], [LastName], [UserName], [Email], [BirthDate], [Passwd] 
	FROM [User]
	WHERE	
		[UserName] = @UserName
		AND [Email] = @Email 
		AND [Passwd] = dbo.CSF_HashPassword(@Password);

	 --Vérification si un utilisateur a été trouvé
	IF @@ROWCOUNT = 0
	BEGIN
		 --Aucun utilisateur correspondant aux critères de recherche
		SET @Result = -1; -- Code d'erreur pour l'absence d'utilisateur
	END
	ELSE
	BEGIN
		SET @Result = 0; -- Succès, un utilisateur a été trouvé
	END

	RETURN @Result; -- Renvoie le résultat de la recherche
END