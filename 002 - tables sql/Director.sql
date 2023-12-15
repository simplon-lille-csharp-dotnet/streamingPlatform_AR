USE [DatabaseStreamingPlatform]
GO

/****** Object:  Table [dbo].[Director]    Script Date: 15/12/2023 11:20:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Director](
	[DirectorID] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modifed_date] [datetime] NULL,
 CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Director] ADD  DEFAULT (getdate()) FOR [created_date]
GO


