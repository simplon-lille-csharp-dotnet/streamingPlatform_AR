USE [DatabaseStreamingPlatform]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 15/12/2023 15:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FK_UserID] [int] NULL,
	[FK_MovieID] [int] NULL,
	[created_date] [datetime] NOT NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorite] ADD  CONSTRAINT [DF_Favorite_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
