CREATE PROCEDURE [dbo].[uspFuncionesConsulta] (@intOpcionConsulta INT,@vrcCodGenero VARCHAR(8))
WITH  ENCRYPTION
AS
BEGIN
/*1. Consultar el nombre completo de todas las personas que fueron insertadas.
2. Cuántas mujeres hay?
3. Cuántos hombres hay?
4. El nombre completo de la persona con mayor edad.
5. El promedio de la edad.*/

	DECLARE @vrcGenero VARCHAR (50)

	IF @intOpcionConsulta = 1
	BEGIN
		SELECT primer_nombre + ' ' + segundo_nombre AS Nombres,primer_apellido + ' ' + segundo_apellido AS Apellidos, td.cod_tipo_documento + ' - ' + td.des_tipo_documento AS tipoDocumento,numero_documento
		FROM db_datos d 
		INNER JOIN  db_tipos_documentos td ON d.id_tipo_documento = td.id_tipo_documento
	END
	ELSE IF @intOpcionConsulta IN (2,3)
		BEGIN
			IF @vrcCodGenero = 'F'
			BEGIN
				SET @vrcGenero = 'mujeres'
			END
			ELSE 
			BEGIN
				SET @vrcGenero = 'hombres'
			END
		
			SELECT 'el total de ' + @vrcGenero + ' es de: ' + CONVERT(VARCHAR(10),COUNT (d.id_dato_usuario)) FROM db_datos d
			INNER JOIN db_generos g ON d.idGenero = g.idGenero
			WHERE codGenero = @vrcCodGenero
		END
	ELSE IF @intOpcionConsulta = 4
		BEGIN
			SELECT primer_nombre + ' ' + segundo_nombre + ' ' + primer_apellido + ' ' + segundo_apellido AS nombres, edad
			FROM db_datos 
			WHERE edad = (SELECT MAX(edad) FROM db_datos )
		END
	ELSE IF @intOpcionConsulta = 5
		BEGIN
			SELECT 'EL promedio de edad es de: '+ CONVERT(VARCHAR(10),AVG (edad)) + ' años' AS Promedio FROM db_datos
		END
END

