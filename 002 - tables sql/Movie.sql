USE [DatabaseStreamingPlatform]
GO

/****** Object:  Table [dbo].[Movie]    Script Date: 15/12/2023 11:20:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[duration] [int] NULL,
	[release_year] [int] NULL,
	[FK_DirectorID] [int] NULL,
	[created_date] [datetime] NOT NULL,
	[modifed_date] [datetime] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Movie] ADD  DEFAULT (getdate()) FOR [created_date]
GO

ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Director] FOREIGN KEY([FK_DirectorID])
REFERENCES [dbo].[Director] ([DirectorID])
GO

ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Director]
GO


