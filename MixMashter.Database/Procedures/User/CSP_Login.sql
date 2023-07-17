CREATE PROCEDURE [dbo].[CSP_Login]
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(20)
AS
BEGIN
	SELECT Id, FirstName, LastName,UserName, Email 
	FROM [User]
	WHERE	Email = @Email 
	AND		Passwd = HASHBYTES('SHA2_512', @Passwd);
	RETURN 0
END
