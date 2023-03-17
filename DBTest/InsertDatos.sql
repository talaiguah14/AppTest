CREATE PROCEDURE [dbo].[uspInsertDatos] (@vrcPrimerNombre VARCHAR (100),@vrcSegundoNombre VARCHAR (10),@vrcPrimerApellido VARCHAR (10),@vrcSegundoApellido VARCHAR (10),@vrcMail VARCHAR(100),@vrcTelefono VARCHAR (20),@vrcNumeroDocumento Varchar(20),
										@intIdTipoIdentificacion INT,@vrcDireccion VARCHAR(100),@intEdad INT,@intGenero INT)
WITH  ENCRYPTION
AS
BEGIN

		INSERT INTO db_datos (primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,mail,telefono,numero_documento,id_tipo_documento,direccion,edad,idGenero) 
		VALUES (@vrcPrimerNombre,@vrcSegundoNombre,@vrcPrimerApellido,@vrcSegundoApellido,@vrcMail,@vrcTelefono,@vrcNumeroDocumento,@intIdTipoIdentificacion,@vrcDireccion,@intEdad,@intGenero)

		SELECT primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,mail,telefono,numero_documento,id_tipo_documento,direccion,edad,idGenero FROM db_datos 
END

