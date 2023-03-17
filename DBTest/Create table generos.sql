IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[db_generos]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[db_generos](
		[idGenero] [int] IDENTITY(1,1) NOT NULL,
		[codGenero] [varchar](12) NOT NULL,
		[desGenero] [varchar](100) NOT NULL,

	 CONSTRAINT [PK_db_generos] PRIMARY KEY CLUSTERED 
	(
		[idGenero] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

END
