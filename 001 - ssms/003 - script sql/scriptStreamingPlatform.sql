USE [master]
GO
/****** Object:  Database [DatabaseStreamingPlatform]    Script Date: 15/12/2023 15:18:03 ******/
CREATE DATABASE [DatabaseStreamingPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DatabaseTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatabaseTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DatabaseTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseStreamingPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET QUERY_STORE = OFF
GO
USE [DatabaseStreamingPlatform]
GO
/****** Object:  User [userTest]    Script Date: 15/12/2023 15:18:03 ******/
CREATE USER [userTest] FOR LOGIN [userTest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 15/12/2023 15:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modifed_date] [datetime] NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Director]    Script Date: 15/12/2023 15:18:03 ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 15/12/2023 15:18:03 ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 15/12/2023 15:18:03 ******/
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
/****** Object:  Table [dbo].[Movie_Actor]    Script Date: 15/12/2023 15:18:03 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 15/12/2023 15:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
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
ALTER TABLE [dbo].[Actor] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Director] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Favorite] ADD  CONSTRAINT [DF_Favorite_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Movie] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Movie_Actor] ADD  CONSTRAINT [DF__Movie_Act__creat__75A278F5]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Director] FOREIGN KEY([FK_DirectorID])
REFERENCES [dbo].[Director] ([DirectorID])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Director]
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
USE [master]
GO
ALTER DATABASE [DatabaseStreamingPlatform] SET  READ_WRITE 
GO
