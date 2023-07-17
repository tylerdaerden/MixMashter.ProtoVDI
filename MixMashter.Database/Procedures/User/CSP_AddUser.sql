CREATE PROCEDURE [dbo].[CSP_AddUser]

@FirstName NVARCHAR(50) ,
@LastName NVARCHAR(80),
@UserName NVARCHAR(80),
@Email NVARCHAR(80),
@BirthDate DATE,
@Passwd NVARCHAR(30)

AS
BEGIN
INSERT INTO [User] ([FirstName] , [LastName] , [UserName] ,[Email] , [BirthDate] , [Passwd])
VALUES ( @FirstName , @LastName , @UserName , @Email , @BirthDate , HASHBYTES('SHA2_512', @Passwd) )

RETURN 0
END

