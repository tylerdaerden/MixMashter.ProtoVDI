CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL IDENTITY (1,1),
	[FirstName] NVARCHAR(50) NOT NULL , 
	[LastName] NVARCHAR(50) NOT NULL , 
	[UserName] NVARCHAR(50) NOT NULL , 
	[Email] NVARCHAR(384) NOT NULL,
	[Password] BINARY(64) NOT NULL 

	CONSTRAINT [PK_User] Primary KEY ([Id]),
	CONSTRAINT [UK_User_Email] UNIQUE ([Email])
 
)
