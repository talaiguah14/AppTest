CREATE PROCEDURE [dbo].[uspConsultarPersonaMayor]
WITH  ENCRYPTION
AS
BEGIN
		SELECT primer_nombre + ' ' + segundo_nombre + ' ' + primer_apellido + ' ' + segundo_apellido AS nombres
			FROM db_datos 
			WHERE edad = (SELECT MAX(edad) FROM db_datos )
END

