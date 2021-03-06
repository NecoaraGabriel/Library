USE [master]
GO
/****** Object:  Database [LibraryDev]    Script Date: 21.01.2020 09:02:52 ******/
CREATE DATABASE [LibraryDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDev', FILENAME = N'C:\Users\Gabriel\LibraryDev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDev_log', FILENAME = N'C:\Users\Gabriel\LibraryDev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibraryDev] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDev] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDev] SET QUERY_STORE = OFF
GO
USE [LibraryDev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LibraryDev]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 21.01.2020 09:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchHours]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchHours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NULL,
	[DayOfWeek] [int] NOT NULL,
	[OpenTime] [int] NOT NULL,
	[CloseTime] [int] NOT NULL,
 CONSTRAINT [PK_BranchHours] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckoutHistories]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckoutHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibraryAssetId] [int] NOT NULL,
	[LibraryCardId] [int] NOT NULL,
	[CheckIn] [datetime2](7) NOT NULL,
	[CheckOut] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CheckoutHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checkouts]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibraryAssetId] [int] NULL,
	[LibraryCardId] [int] NULL,
	[Since] [datetime2](7) NOT NULL,
	[Until] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Checkouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holds]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibraryAssetId] [int] NULL,
	[LibraryCardId] [int] NULL,
	[HoldPlaced] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Holds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryAssets]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryAssets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Year] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[ImgUrl] [nvarchar](max) NULL,
	[NumberOfCopies] [int] NOT NULL,
	[LocationId] [int] NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[DeweyIndex] [nvarchar](max) NULL,
	[Director] [nvarchar](max) NULL,
 CONSTRAINT [PK_LibraryAssets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryBranches]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryBranches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](35) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[OpenDate] [datetime2](7) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_LibraryBranches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryCards]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fees] [decimal](18, 2) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LibraryCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patrons]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patrons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[LibraryBranchId] [int] NULL,
	[LibraryCardId] [int] NULL,
 CONSTRAINT [PK_Patrons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 21.01.2020 09:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191015143416_initial-migration', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191016090100_base_models', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[BranchHours] ON 

INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (1, 1, 1, 7, 14)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (2, 1, 2, 7, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (3, 1, 3, 7, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (4, 1, 4, 7, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (5, 1, 5, 8, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (6, 2, 1, 8, 20)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (7, 2, 2, 8, 20)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (8, 2, 3, 9, 20)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (9, 2, 4, 8, 20)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (10, 2, 5, 9, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (11, 3, 1, 9, 22)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (12, 3, 2, 9, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (13, 3, 3, 9, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (14, 3, 4, 9, 18)
INSERT [dbo].[BranchHours] ([Id], [BranchId], [DayOfWeek], [OpenTime], [CloseTime]) VALUES (15, 3, 5, 9, 18)
SET IDENTITY_INSERT [dbo].[BranchHours] OFF
SET IDENTITY_INSERT [dbo].[CheckoutHistories] ON 

INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (8, 1, 4, CAST(N'2019-10-29T22:29:31.2534883' AS DateTime2), CAST(N'2019-10-29T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (9, 1, 2, CAST(N'2019-10-29T22:29:34.2615525' AS DateTime2), CAST(N'2019-10-29T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (10, 1, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-29T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (11, 2, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (12, 6, 2, CAST(N'2019-11-10T21:11:12.9737980' AS DateTime2), CAST(N'2019-11-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CheckoutHistories] ([Id], [LibraryAssetId], [LibraryCardId], [CheckIn], [CheckOut]) VALUES (13, 6, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-10T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CheckoutHistories] OFF
SET IDENTITY_INSERT [dbo].[Checkouts] ON 

INSERT [dbo].[Checkouts] ([Id], [LibraryAssetId], [LibraryCardId], [Since], [Until]) VALUES (10, 1, 3, CAST(N'2019-10-29T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Checkouts] ([Id], [LibraryAssetId], [LibraryCardId], [Since], [Until]) VALUES (11, 2, 2, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Checkouts] ([Id], [LibraryAssetId], [LibraryCardId], [Since], [Until]) VALUES (13, 6, 1, CAST(N'2019-11-10T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Checkouts] OFF
SET IDENTITY_INSERT [dbo].[Holds] ON 

INSERT [dbo].[Holds] ([Id], [LibraryAssetId], [LibraryCardId], [HoldPlaced]) VALUES (9, 6, 3, CAST(N'2019-11-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Holds] ([Id], [LibraryAssetId], [LibraryCardId], [HoldPlaced]) VALUES (10, 6, 2, CAST(N'2020-01-21T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Holds] OFF
SET IDENTITY_INSERT [dbo].[LibraryAssets] ON 

INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (1, N'Emma', 1815, 1, CAST(18.00 AS Decimal(18, 2)), N'/images/emma.png', 1, 2, N'Book', N'9781519202987', N'Jane Austen', N'823.123', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (2, N'Jane Eyre', 1847, 1, CAST(18.00 AS Decimal(18, 2)), N'/images/janeeyre.png', 1, 3, N'Book', N'9781519133977', N'Charlotte Brontë', N'822.133', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (3, N'Moby Dick', 1851, 2, CAST(12.99 AS Decimal(18, 2)), N'/images/mobydick.png', 1, 2, N'Book', N'9780746062760', N'Herman Melville', N'821.153', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (4, N'Ulysses', 1922, 2, CAST(24.00 AS Decimal(18, 2)), N'/images/ulysses.png', 3, 2, N'Book', N'9788854139343', N'James Joyce', N'822.556', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (5, N'The Republic', -380, 2, CAST(11.00 AS Decimal(18, 2)), N'/images/republic.png', 2, 3, N'Book', N'9780758320209', N'Plato', N'820.119', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (6, N'Dracula', 1897, 1, CAST(18.00 AS Decimal(18, 2)), N'/images/dracula.png', 4, 3, N'Book', N'9781623750282', N'Bram Stoker', N'821.526', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (7, N'White Noise', 1985, 2, CAST(12.99 AS Decimal(18, 2)), N'/images/default.png', 1, 2, N'Book', N'9780670803736', N'Don Delillo', N'822.436', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (8, N'Another Country', 1962, 2, CAST(16.00 AS Decimal(18, 2)), N'/images/default.png', 2, 2, N'Book', N'9780552084574', N'James Baldwin', N'821.325', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (9, N'The Waves', 1931, 2, CAST(11.00 AS Decimal(18, 2)), N'/images/thewaves.png', 1, 1, N'Book', N'9781904919582', N'Virginia Woolf', N'822.888', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (10, N'The Color Purple', 1982, 2, CAST(11.99 AS Decimal(18, 2)), N'/images/default.png', 2, 1, N'Book', N'9780151191543', N'Alice Walker', N'820.298', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (11, N'One Hundred Years of Solitude', 1967, 2, CAST(12.50 AS Decimal(18, 2)), N'/images/default.png', 1, 1, N'Book', N'9789631420494', N'Gabriel García Márquez', N'821.544', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (12, N'Friend of My Youth', 1990, 2, CAST(22.00 AS Decimal(18, 2)), N'/images/default.png', 1, 1, N'Book', N'9788702163452', N'Alice Monroe', N'821.444', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (13, N'To the Lighthouse', 1927, 2, CAST(13.50 AS Decimal(18, 2)), N'/images/tothelighthouse.png', 5, 1, N'Book', N'9780795310522', N'Virginia Woolf', N'820.111', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (14, N'Mrs Dalloway', 1925, 2, CAST(15.99 AS Decimal(18, 2)), N'/images/mrsdalloway.png', 1, 3, N'Book', N'9785457626126', N'Virginia Woolf', N'821.254', NULL)
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (15, N'Blue Velvet', 1986, 2, CAST(24.00 AS Decimal(18, 2)), N'/images/default.png', 1, 1, N'Video', NULL, NULL, NULL, N'David Lynch')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (16, N'Trois Coleurs: Rouge', 1994, 2, CAST(24.00 AS Decimal(18, 2)), N'/images/default.png', 1, 1, N'Video', NULL, NULL, NULL, N'Krzysztof Kieslowski')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (17, N'Citizen Kane', 1941, 2, CAST(30.00 AS Decimal(18, 2)), N'/images/default.png', 1, 1, N'Video', NULL, NULL, NULL, N'Orson Welles')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (18, N'Spirited Away', 2002, 2, CAST(28.00 AS Decimal(18, 2)), N'/images/default.png', 1, 2, N'Video', NULL, NULL, NULL, N'Hayao Miyazaki')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (19, N'The Departed', 2006, 2, CAST(23.00 AS Decimal(18, 2)), N'/images/default.png', 1, 2, N'Video', NULL, NULL, NULL, N'Martin Scorsese')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (20, N'Taxi Driver', 1976, 2, CAST(17.99 AS Decimal(18, 2)), N'/images/default.png', 1, 2, N'Video', NULL, NULL, NULL, N'Martin Scorsese')
INSERT [dbo].[LibraryAssets] ([Id], [Title], [Year], [StatusId], [Cost], [ImgUrl], [NumberOfCopies], [LocationId], [Discriminator], [ISBN], [Author], [DeweyIndex], [Director]) VALUES (21, N'Casablanca', 1943, 2, CAST(18.00 AS Decimal(18, 2)), N'/images/default.png', 1, 3, N'Video', NULL, NULL, NULL, N'Michael Curtiz')
SET IDENTITY_INSERT [dbo].[LibraryAssets] OFF
SET IDENTITY_INSERT [dbo].[LibraryBranches] ON 

INSERT [dbo].[LibraryBranches] ([Id], [Name], [Address], [PhoneNumber], [Description], [OpenDate], [ImageUrl]) VALUES (1, N'Lake Shore Branch', N'88 Lakeshore Dr', N'555-1234', N'The oldest library branch in Lakeview, the Lake Shore Branch was opened in 1975. Patrons of all ages enjoy the wide selection of literature available at Lake Shore library. The coffee shop is open during library hours of operation.', CAST(N'1975-05-13T00:00:00.0000000' AS DateTime2), N'/images/branches/1.png')
INSERT [dbo].[LibraryBranches] ([Id], [Name], [Address], [PhoneNumber], [Description], [OpenDate], [ImageUrl]) VALUES (2, N'Mountain View Branch', N'123 Skyline Dr', N'555-1235', N'The Mountain View branch contains the largest collection of technical and language learning books in the region. This branch is within walking distance to the University campus', CAST(N'1998-06-01T00:00:00.0000000' AS DateTime2), N'/images/branches/2.png')
INSERT [dbo].[LibraryBranches] ([Id], [Name], [Address], [PhoneNumber], [Description], [OpenDate], [ImageUrl]) VALUES (3, N'Pleasant Hill Branch', N'540 Inventors Circle', N'555-1236', N'The newest Lakeview Library System branch, Pleasant Hill has high-speed wireless access for all patrons and hosts Chess Club every Monday and Wednesday evening at 6 PM.', CAST(N'2017-09-20T00:00:00.0000000' AS DateTime2), N'/images/branches/3.png')
SET IDENTITY_INSERT [dbo].[LibraryBranches] OFF
SET IDENTITY_INSERT [dbo].[LibraryCards] ON 

INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (1, CAST(12.00 AS Decimal(18, 2)), CAST(N'2017-06-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (2, CAST(0.00 AS Decimal(18, 2)), CAST(N'2017-06-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (3, CAST(0.50 AS Decimal(18, 2)), CAST(N'2017-06-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (4, CAST(0.00 AS Decimal(18, 2)), CAST(N'2017-06-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (5, CAST(3.50 AS Decimal(18, 2)), CAST(N'2017-06-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (6, CAST(1.50 AS Decimal(18, 2)), CAST(N'2017-06-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (7, CAST(0.00 AS Decimal(18, 2)), CAST(N'2017-06-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[LibraryCards] ([Id], [Fees], [Created]) VALUES (8, CAST(8.00 AS Decimal(18, 2)), CAST(N'2017-06-23T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[LibraryCards] OFF
SET IDENTITY_INSERT [dbo].[Patrons] ON 

INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (1, N'Jane', N'Patterson', N'165 Peace St', CAST(N'1986-07-10T00:00:00.0000000' AS DateTime2), N'555-1234', 1, 1)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (2, N'Margaret', N'Smith', N'324 Shadow Ln', CAST(N'1984-03-12T00:00:00.0000000' AS DateTime2), N'555-7785', 2, 2)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (3, N'Tomas', N'Galloway', N'18 Stone Cir', CAST(N'1956-02-10T00:00:00.0000000' AS DateTime2), N'555-3467', 2, 3)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (4, N'Mary', N'Li', N'246 Jennifer St', CAST(N'1997-01-17T00:00:00.0000000' AS DateTime2), N'555-1223', 3, 4)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (5, N'Dan', N'Carter', N'1465 Williamson St', CAST(N'1952-09-16T00:00:00.0000000' AS DateTime2), N'555-8884', 3, 5)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (6, N'Aruna', N'Adhiban', N'785 Park Ave', CAST(N'1994-03-24T00:00:00.0000000' AS DateTime2), N'555-9988', 3, 6)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (7, N'Raj', N'Prasad', N'5654 Main St', CAST(N'2001-11-23T00:00:00.0000000' AS DateTime2), N'555-7894', 1, 7)
INSERT [dbo].[Patrons] ([Id], [FirstName], [LastName], [Address], [DateOfBirth], [PhoneNumber], [LibraryBranchId], [LibraryCardId]) VALUES (8, N'Tatyana', N'Ponomaryova', N'1352 Bicycle Ct', CAST(N'1981-10-16T00:00:00.0000000' AS DateTime2), N'555-4568', 3, 8)
SET IDENTITY_INSERT [dbo].[Patrons] OFF
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([Id], [Name], [Description]) VALUES (1, N'Checked Out', N'A library asset that has been checked out')
INSERT [dbo].[Statuses] ([Id], [Name], [Description]) VALUES (2, N'Available', N'A library asset that is available for loan')
INSERT [dbo].[Statuses] ([Id], [Name], [Description]) VALUES (3, N'Lost', N'A library asset that has been lost')
INSERT [dbo].[Statuses] ([Id], [Name], [Description]) VALUES (4, N'On Hold', N'A library asset that has been placed On Hold for loan')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
/****** Object:  Index [IX_BranchHours_BranchId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_BranchHours_BranchId] ON [dbo].[BranchHours]
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckoutHistories_LibraryAssetId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_CheckoutHistories_LibraryAssetId] ON [dbo].[CheckoutHistories]
(
	[LibraryAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckoutHistories_LibraryCardId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_CheckoutHistories_LibraryCardId] ON [dbo].[CheckoutHistories]
(
	[LibraryCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Checkouts_LibraryAssetId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Checkouts_LibraryAssetId] ON [dbo].[Checkouts]
(
	[LibraryAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Checkouts_LibraryCardId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Checkouts_LibraryCardId] ON [dbo].[Checkouts]
(
	[LibraryCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Holds_LibraryAssetId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Holds_LibraryAssetId] ON [dbo].[Holds]
(
	[LibraryAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Holds_LibraryCardId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Holds_LibraryCardId] ON [dbo].[Holds]
(
	[LibraryCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LibraryAssets_LocationId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_LibraryAssets_LocationId] ON [dbo].[LibraryAssets]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LibraryAssets_StatusId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_LibraryAssets_StatusId] ON [dbo].[LibraryAssets]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patrons_LibraryBranchId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Patrons_LibraryBranchId] ON [dbo].[Patrons]
(
	[LibraryBranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patrons_LibraryCardId]    Script Date: 21.01.2020 09:02:53 ******/
CREATE NONCLUSTERED INDEX [IX_Patrons_LibraryCardId] ON [dbo].[Patrons]
(
	[LibraryCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchHours]  WITH CHECK ADD  CONSTRAINT [FK_BranchHours_LibraryBranches_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[LibraryBranches] ([Id])
GO
ALTER TABLE [dbo].[BranchHours] CHECK CONSTRAINT [FK_BranchHours_LibraryBranches_BranchId]
GO
ALTER TABLE [dbo].[CheckoutHistories]  WITH CHECK ADD  CONSTRAINT [FK_CheckoutHistories_LibraryAssets_LibraryAssetId] FOREIGN KEY([LibraryAssetId])
REFERENCES [dbo].[LibraryAssets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CheckoutHistories] CHECK CONSTRAINT [FK_CheckoutHistories_LibraryAssets_LibraryAssetId]
GO
ALTER TABLE [dbo].[CheckoutHistories]  WITH CHECK ADD  CONSTRAINT [FK_CheckoutHistories_LibraryCards_LibraryCardId] FOREIGN KEY([LibraryCardId])
REFERENCES [dbo].[LibraryCards] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CheckoutHistories] CHECK CONSTRAINT [FK_CheckoutHistories_LibraryCards_LibraryCardId]
GO
ALTER TABLE [dbo].[Checkouts]  WITH CHECK ADD  CONSTRAINT [FK_Checkouts_LibraryAssets_LibraryAssetId] FOREIGN KEY([LibraryAssetId])
REFERENCES [dbo].[LibraryAssets] ([Id])
GO
ALTER TABLE [dbo].[Checkouts] CHECK CONSTRAINT [FK_Checkouts_LibraryAssets_LibraryAssetId]
GO
ALTER TABLE [dbo].[Checkouts]  WITH CHECK ADD  CONSTRAINT [FK_Checkouts_LibraryCards_LibraryCardId] FOREIGN KEY([LibraryCardId])
REFERENCES [dbo].[LibraryCards] ([Id])
GO
ALTER TABLE [dbo].[Checkouts] CHECK CONSTRAINT [FK_Checkouts_LibraryCards_LibraryCardId]
GO
ALTER TABLE [dbo].[Holds]  WITH CHECK ADD  CONSTRAINT [FK_Holds_LibraryAssets_LibraryAssetId] FOREIGN KEY([LibraryAssetId])
REFERENCES [dbo].[LibraryAssets] ([Id])
GO
ALTER TABLE [dbo].[Holds] CHECK CONSTRAINT [FK_Holds_LibraryAssets_LibraryAssetId]
GO
ALTER TABLE [dbo].[Holds]  WITH CHECK ADD  CONSTRAINT [FK_Holds_LibraryCards_LibraryCardId] FOREIGN KEY([LibraryCardId])
REFERENCES [dbo].[LibraryCards] ([Id])
GO
ALTER TABLE [dbo].[Holds] CHECK CONSTRAINT [FK_Holds_LibraryCards_LibraryCardId]
GO
ALTER TABLE [dbo].[LibraryAssets]  WITH CHECK ADD  CONSTRAINT [FK_LibraryAssets_LibraryBranches_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[LibraryBranches] ([Id])
GO
ALTER TABLE [dbo].[LibraryAssets] CHECK CONSTRAINT [FK_LibraryAssets_LibraryBranches_LocationId]
GO
ALTER TABLE [dbo].[LibraryAssets]  WITH CHECK ADD  CONSTRAINT [FK_LibraryAssets_Statuses_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LibraryAssets] CHECK CONSTRAINT [FK_LibraryAssets_Statuses_StatusId]
GO
ALTER TABLE [dbo].[Patrons]  WITH CHECK ADD  CONSTRAINT [FK_Patrons_LibraryBranches_LibraryBranchId] FOREIGN KEY([LibraryBranchId])
REFERENCES [dbo].[LibraryBranches] ([Id])
GO
ALTER TABLE [dbo].[Patrons] CHECK CONSTRAINT [FK_Patrons_LibraryBranches_LibraryBranchId]
GO
ALTER TABLE [dbo].[Patrons]  WITH CHECK ADD  CONSTRAINT [FK_Patrons_LibraryCards_LibraryCardId] FOREIGN KEY([LibraryCardId])
REFERENCES [dbo].[LibraryCards] ([Id])
GO
ALTER TABLE [dbo].[Patrons] CHECK CONSTRAINT [FK_Patrons_LibraryCards_LibraryCardId]
GO
USE [master]
GO
ALTER DATABASE [LibraryDev] SET  READ_WRITE 
GO
