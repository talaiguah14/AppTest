CREATE PROCEDURE [dbo].[uspConsultarPersonas]
WITH  ENCRYPTION
AS
BEGIN

		SELECT primer_nombre + ' ' + segundo_nombre AS Nombres,primer_apellido + ' ' + segundo_apellido AS Apellidos, td.cod_tipo_documento + ' - ' + td.des_tipo_documento AS tipoDocumento,numero_documento
		FROM db_datos d 
		INNER JOIN  db_tipos_documentos td ON d.id_tipo_documento = td.id_tipo_documento
END

