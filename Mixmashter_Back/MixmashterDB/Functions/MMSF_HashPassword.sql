CREATE FUNCTION [dbo].[MMSF_HashPassword]
(
@Password NVARCHAR(30)

)
RETURNS BINARY(64)
AS 
BEGIN

RETURN  HASHBYTES( 'SHA_512' , CONCAT(dbo.MMSF_GetPreSalt(),@Password,dbo.MMSF_GetPostSalt()));

END
