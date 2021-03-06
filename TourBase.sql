USE [master]
GO
/****** Object:  Database [TourBase]    Script Date: 07.11.2020 15:58:41 ******/
CREATE DATABASE [TourBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TourBase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TourBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TourBase_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TourBase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TourBase] SET  MULTI_USER 
GO
ALTER DATABASE [TourBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourBase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TourBase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TourBase]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](90) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](120) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelCommet]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelCommet](
	[Name] [nchar](10) NULL,
	[HotelId] [nchar](10) NULL,
	[Text] [nchar](10) NULL,
	[Author] [nchar](10) NULL,
	[CreationDate] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelImages]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelImages](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [nchar](10) NULL,
	[TicketCount] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[Description] [nchar](10) NULL,
	[ImagesPreview] [nchar](10) NULL,
	[Price] [nchar](10) NULL,
	[IsActual] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeTour]    Script Date: 07.11.2020 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTour](
	[id] [int] NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TypeTour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[TypeTour] ([id], [Name], [Description]) VALUES (1, N'Тип1 ', NULL)
INSERT [dbo].[TypeTour] ([id], [Name], [Description]) VALUES (2, N'Тип2', NULL)
INSERT [dbo].[TypeTour] ([id], [Name], [Description]) VALUES (3, N'Тип3', NULL)
INSERT [dbo].[TypeTour] ([id], [Name], [Description]) VALUES (4, N'тип 4', NULL)
INSERT [dbo].[TypeTour] ([id], [Name], [Description]) VALUES (5, N'тип5', NULL)
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country1] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country1]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImages]  WITH CHECK ADD  CONSTRAINT [FK_HotelImages_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImages] CHECK CONSTRAINT [FK_HotelImages_Hotel]
GO
USE [master]
GO
ALTER DATABASE [TourBase] SET  READ_WRITE 
GO
