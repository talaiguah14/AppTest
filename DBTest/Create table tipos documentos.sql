IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[db_tipos_documentos]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[db_tipos_documentos](
		[id_tipo_documento] [int] IDENTITY(1,1) NOT NULL,
		[cod_tipo_documento] [varchar](8) NOT NULL,
		[des_tipo_documento] [varchar](100) NOT NULL,

	 CONSTRAINT [PK_db_tipos_documentos] PRIMARY KEY CLUSTERED 
	(
		[id_tipo_documento] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

END
