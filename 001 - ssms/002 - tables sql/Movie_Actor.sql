USE [DatabaseStreamingPlatform]
GO
/****** Object:  Table [dbo].[Movie_Actor]    Script Date: 15/12/2023 15:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Actor](
	[Movie_ActorID] [int] IDENTITY(1,1) NOT NULL,
	[FK_MovieID] [int] NOT NULL,
	[FK_ActorID] [int] NOT NULL,
	[role] [varchar](50) NULL,
	[is_lead_role] [bit] NULL,
	[created_date] [datetime] NOT NULL,
	[modifed_date] [datetime] NULL,
 CONSTRAINT [PK_Movie_Actor_1] PRIMARY KEY CLUSTERED 
(
	[Movie_ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie_Actor] ADD  CONSTRAINT [DF__Movie_Act__creat__75A278F5]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Movie_Actor]  WITH CHECK ADD  CONSTRAINT [FK_ActorID] FOREIGN KEY([FK_ActorID])
REFERENCES [dbo].[Actor] ([ActorID])
GO
ALTER TABLE [dbo].[Movie_Actor] CHECK CONSTRAINT [FK_ActorID]
GO
ALTER TABLE [dbo].[Movie_Actor]  WITH CHECK ADD  CONSTRAINT [FK_MovieID] FOREIGN KEY([FK_MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[Movie_Actor] CHECK CONSTRAINT [FK_MovieID]
GO
