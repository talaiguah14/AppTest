IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[db_usuarios]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[db_usuarios](
		[id_usuario] [int] IDENTITY(1,1) NOT NULL,
		[userName] [varchar](8) NOT NULL,
		[password] [varchar](100) NOT NULL,
		[status] [varchar](100) NOT NULL,
		[rol] [INT] NOT NULL,

	 CONSTRAINT [PK_db_usuarios] PRIMARY KEY CLUSTERED 
	(
		[id_usuario] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

END
