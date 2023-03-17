CREATE PROCEDURE [dbo].[uspInsertUser] (@vrcUserName VARCHAR (50),@vrcPassword VARCHAR(100), @bitStatus bit,@intRol int)
WITH  ENCRYPTION
AS
BEGIN

		INSERT INTO db_usuarios (user,password,status,rol) VALUES (@vrcUserName,@vrcPassword,@bitStatus,@intRol)

		SELECT userName,password,status,rol FROM db_usuarios 
END

