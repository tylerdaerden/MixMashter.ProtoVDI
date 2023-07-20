CREATE PROCEDURE [dbo].[CSP_Register]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(80),
	@UserName NVARCHAR(80),
	@Email NVARCHAR(80),
	@BirthDate DATE,
	@Passwd NVARCHAR(30)
AS
BEGIN
	INSERT INTO [User] ([FirstName], [LastName], [UserName], [Email], [BirthDate], [Passwd])
	VALUES (@FirstName, @LastName, @UserName, @Email, CONVERT(DATE, @BirthDate, 103),  dbo.CSF_HashPassword(@Passwd))
	RETURN 0
END
