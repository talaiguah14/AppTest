CREATE PROCEDURE [dbo].[uspConsultarHombres]
WITH  ENCRYPTION
AS
BEGIN

		SELECT mensaje =  'el total de hombres es de: ' + CONVERT(VARCHAR(10),COUNT (d.id_dato_usuario)) FROM db_datos d
		INNER JOIN db_generos g ON d.idGenero = g.idGenero
		WHERE codGenero = 'M'
END

