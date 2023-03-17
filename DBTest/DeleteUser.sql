CREATE PROCEDURE [dbo].[uspDeletetUser] (@intIdUsuario INT)
WITH  ENCRYPTION
AS
BEGIN

		DELETE db_usuarios  WHERE id_usuario = @intIdUsuario

END

