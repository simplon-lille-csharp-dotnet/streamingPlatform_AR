USE [DatabaseStreamingPlatform]
GO

/****** Object:  Table [dbo].[User]    Script Date: 15/12/2023 11:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modifed_date] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_created_date]  DEFAULT (getdate()) FOR [created_date]
GO


