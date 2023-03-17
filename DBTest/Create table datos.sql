IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[db_datos]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[db_datos](
		[id_dato_usuario] [int] IDENTITY(1,1) NOT NULL,
		[primer_nombre] [varchar](100) NOT NULL,
		[segundo_nombre] [varchar](100) NOT NULL,
		[primer_apellido] [varchar](100) NOT NULL,
		[segundo_apellido] [varchar](100) NOT NULL,
		[mail] [varchar](100) NOT NULL,
		[telefono] [varchar](100) NOT NULL,
		[numero_documento] [varchar](100) NOT NULL,
		[id_tipo_documento] [INT] NOT NULL,
		[direccion] [VARCHAR](100) NOT NULL,
		[edad] [INT] NOT NULL,
		[idGenero] [INT] NOT NULL,
	 CONSTRAINT [PK_db_datos] PRIMARY KEY CLUSTERED 
	(
		[id_dato_usuario] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

END
