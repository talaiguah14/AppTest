CREATE PROCEDURE [dbo].[uspConsultarMujeres]
WITH  ENCRYPTION
AS
BEGIN

		SELECT  mensaje = 'el total de mujeres es de: ' + CONVERT(VARCHAR(10),COUNT (d.id_dato_usuario)) FROM db_datos d
		INNER JOIN db_generos g ON d.idGenero = g.idGenero
		WHERE codGenero = 'F'
END

