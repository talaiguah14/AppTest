CREATE PROCEDURE [dbo].[uspConsultaPromedio]
WITH  ENCRYPTION
AS
BEGIN
	SELECT 'EL promedio de edad es de: '+ CONVERT(VARCHAR(10),AVG (edad)) + ' a�os' AS Promedio FROM db_datos
END

