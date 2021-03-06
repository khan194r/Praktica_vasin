USE [master]
GO
/****** Object:  Database [Maksim220]    Script Date: 24.02.2022 14:17:11 ******/
CREATE DATABASE [Maksim220]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Maksim220', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\Maksim220.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Maksim220_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\Maksim220_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Maksim220] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Maksim220].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Maksim220] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Maksim220] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Maksim220] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Maksim220] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Maksim220] SET ARITHABORT OFF 
GO
ALTER DATABASE [Maksim220] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Maksim220] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Maksim220] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Maksim220] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Maksim220] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Maksim220] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Maksim220] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Maksim220] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Maksim220] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Maksim220] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Maksim220] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Maksim220] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Maksim220] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Maksim220] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Maksim220] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Maksim220] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Maksim220] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Maksim220] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Maksim220] SET  MULTI_USER 
GO
ALTER DATABASE [Maksim220] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Maksim220] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Maksim220] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Maksim220] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Maksim220] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Maksim220] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Maksim220', N'ON'
GO
ALTER DATABASE [Maksim220] SET QUERY_STORE = OFF
GO
USE [Maksim220]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 24.02.2022 14:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Гранулы зеленый 0x3', 10, N'л', 937, 31, NULL, CAST(33037.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Рулон зеленый 0x0', 8, N'м', 371, 32, NULL, CAST(43562.00 AS Decimal(10, 2)), N'\materials\material_25.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Нарезка серый 1x1', 7, N'м', 302, 41, NULL, CAST(36682.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Рулон серый 1x0', 10, N'кг', 811, 26, NULL, CAST(1998.00 AS Decimal(10, 2)), N'\materials\material_12.jpeg', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Нарезка белый 1x2', 4, N'м', 248, 27, NULL, CAST(39259.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Нарезка зеленый 3x0', 4, N'кг', 345, 30, NULL, CAST(25985.00 AS Decimal(10, 2)), N'\materials\material_7.jpeg', 6)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Спрессованный пак синий 0x2', 9, N'м', 881, 14, NULL, CAST(47443.00 AS Decimal(10, 2)), N'\materials\material_24.jpeg', 7)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Спрессованный пак зеленый 2x0', 6, N'кг', 215, 25, NULL, CAST(25974.00 AS Decimal(10, 2)), N'', 8)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Нарезка белый 3x1', 8, N'м', 439, 50, NULL, CAST(27374.00 AS Decimal(10, 2)), N'', 9)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Гранулы цветной 1x3', 4, N'кг', 20, 23, NULL, CAST(16651.00 AS Decimal(10, 2)), N'\materials\material_11.jpeg', 10)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Рулон синий 1x0', 9, N'м', 972, 40, NULL, CAST(49990.00 AS Decimal(10, 2)), N'', 11)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Спрессованный пак цветной 3x0', 5, N'кг', 159, 42, NULL, CAST(36740.00 AS Decimal(10, 2)), N'', 12)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Нарезка белый 0x1', 10, N'м', 368, 16, NULL, CAST(32370.00 AS Decimal(10, 2)), N'', 13)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Рулон зеленый 1x3', 6, N'м', 20, 17, NULL, CAST(12393.00 AS Decimal(10, 2)), N'', 14)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Спрессованный пак белый 1x2', 2, N'м', 27, 28, NULL, CAST(21359.00 AS Decimal(10, 2)), N'\materials\material_16.jpeg', 15)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Спрессованный пак белый 0x2', 7, N'м', 601, 49, NULL, CAST(36343.00 AS Decimal(10, 2)), N'\materials\material_5.jpeg', 16)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Рулон зеленый 2x2', 4, N'кг', 94, 6, NULL, CAST(7610.00 AS Decimal(10, 2)), N'', 17)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Спрессованный пак зеленый 1x2', 4, N'м', 1, 12, NULL, CAST(35304.00 AS Decimal(10, 2)), N'\materials\material_3.jpeg', 18)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Рулон зеленый 1x1', 1, N'кг', 884, 5, NULL, CAST(28235.00 AS Decimal(10, 2)), N'', 19)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Нарезка синий 2x1', 7, N'кг', 82, 44, NULL, CAST(30327.00 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Гранулы цветной 2x1', 1, N'л', 757, 5, NULL, CAST(33885.00 AS Decimal(10, 2)), N'', 21)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Нарезка синий 2x3', 5, N'м', 44, 5, NULL, CAST(53097.00 AS Decimal(10, 2)), N'\materials\material_23.jpeg', 22)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Нарезка серый 2x2', 3, N'м', 476, 5, NULL, CAST(30474.00 AS Decimal(10, 2)), N'', 23)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Спрессованный пак серый 0x2', 7, N'м', 497, 27, NULL, CAST(2540.00 AS Decimal(10, 2)), N'', 24)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Гранулы серый 3x0', 9, N'кг', 705, 34, NULL, CAST(50093.00 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Спрессованный пак серый 3x1', 8, N'м', 429, 22, NULL, CAST(10763.00 AS Decimal(10, 2)), N'', 26)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Спрессованный пак зеленый 1x0', 10, N'м', 560, 17, NULL, CAST(18413.00 AS Decimal(10, 2)), N'\materials\material_17.jpeg', 27)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Рулон синий 0x3', 4, N'м', 243, 41, NULL, CAST(47343.00 AS Decimal(10, 2)), N'\materials\material_8.jpeg', 28)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Спрессованный пак цветной 0x3', 2, N'м', 610, 41, NULL, CAST(10544.00 AS Decimal(10, 2)), N'', 29)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Рулон белый 3x2', 8, N'м', 608, 5, NULL, CAST(17632.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Спрессованный пак зеленый 1x1', 7, N'м', 577, 28, NULL, CAST(13911.00 AS Decimal(10, 2)), N'', 31)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Гранулы зеленый 2x0', 2, N'л', 708, 11, NULL, CAST(18961.00 AS Decimal(10, 2)), N'', 32)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Нарезка серый 3x3', 5, N'м', 149, 18, NULL, CAST(51486.00 AS Decimal(10, 2)), N'', 33)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Рулон синий 2x3', 8, N'м', 775, 42, NULL, CAST(15889.00 AS Decimal(10, 2)), N'', 34)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Спрессованный пак цветной 1x2', 9, N'м', 189, 31, NULL, CAST(1382.00 AS Decimal(10, 2)), N'\materials\material_15.jpeg', 35)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Нарезка синий 1x2', 4, N'м', 353, 5, NULL, CAST(40754.00 AS Decimal(10, 2)), N'', 36)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Спрессованный пак цветной 2x1', 9, N'кг', 549, 21, NULL, CAST(20404.00 AS Decimal(10, 2)), N'', 37)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Гранулы белый 1x2', 10, N'л', 265, 10, NULL, CAST(28326.00 AS Decimal(10, 2)), N'', 38)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Рулон зеленый 3x2', 10, N'м', 111, 37, NULL, CAST(40932.00 AS Decimal(10, 2)), N'\materials\material_2.jpeg', 39)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Гранулы зеленый 1x2', 9, N'л', 2, 29, NULL, CAST(36121.00 AS Decimal(10, 2)), N'\materials\material_4.jpeg', 40)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Гранулы серый 2x3', 6, N'кг', 185, 22, NULL, CAST(30903.00 AS Decimal(10, 2)), N'', 41)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Гранулы синий 1x0', 9, N'л', 579, 12, NULL, CAST(19889.00 AS Decimal(10, 2)), N'', 42)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Гранулы белый 2x2', 9, N'л', 232, 22, NULL, CAST(11843.00 AS Decimal(10, 2)), N'', 43)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Нарезка зеленый 1x1', 7, N'м', 883, 42, NULL, CAST(53096.00 AS Decimal(10, 2)), N'\materials\material_6.jpeg', 44)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Рулон зеленый 0x2', 10, N'м', 35, 10, NULL, CAST(50081.00 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Гранулы белый 2x1', 4, N'л', 437, 40, NULL, CAST(49124.00 AS Decimal(10, 2)), N'', 46)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Гранулы зеленый 2x3', 10, N'кг', 848, 18, NULL, CAST(19788.00 AS Decimal(10, 2)), N'', 47)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Нарезка зеленый 0x3', 4, N'м', 943, 25, NULL, CAST(7884.00 AS Decimal(10, 2)), N'', 48)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Рулон белый 0x1', 7, N'м', 99, 8, NULL, CAST(50081.00 AS Decimal(10, 2)), N'', 49)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Спрессованный пак синий 2x1', 10, N'кг', 921, 18, NULL, CAST(31625.00 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (51, N'Спрессованный пак серый 3x0', 7, N'м', 391, 29, NULL, CAST(35304.00 AS Decimal(10, 2)), N'', 51)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (52, N'Спрессованный пак зеленый 0x3', 6, N'м', 966, 7, NULL, CAST(18848.00 AS Decimal(10, 2)), N'', 52)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (53, N'Нарезка белый 2x2', 7, N'м', 614, 7, NULL, CAST(39945.00 AS Decimal(10, 2)), N'\materials\material_26.jpeg', 53)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (54, N'Нарезка синий 2x0', 8, N'кг', 899, 9, NULL, CAST(13380.00 AS Decimal(10, 2)), N'', 54)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (55, N'Рулон цветной 1x3', 6, N'кг', 423, 48, NULL, CAST(45185.00 AS Decimal(10, 2)), N'', 55)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (56, N'Спрессованный пак серый 1x3', 7, N'кг', 805, 50, NULL, CAST(375.00 AS Decimal(10, 2)), N'', 56)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (57, N'Спрессованный пак белый 3x3', 10, N'м', 158, 34, NULL, CAST(28510.00 AS Decimal(10, 2)), N'', 57)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (58, N'Гранулы цветной 0x3', 3, N'кг', 641, 35, NULL, CAST(16202.00 AS Decimal(10, 2)), N'\materials\material_20.jpeg', 58)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (59, N'Нарезка зеленый 0x1', 4, N'м', 502, 36, NULL, CAST(53874.00 AS Decimal(10, 2)), N'', 59)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (60, N'Нарезка белый 0x3', 5, N'м', 444, 27, NULL, CAST(34619.00 AS Decimal(10, 2)), N'', 60)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (61, N'Рулон зеленый 0x1', 2, N'м', 60, 14, NULL, CAST(46510.00 AS Decimal(10, 2)), N'', 61)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (62, N'Нарезка цветной 2x0', 7, N'кг', 118, 22, NULL, CAST(49221.00 AS Decimal(10, 2)), N'', 62)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (63, N'Спрессованный пак цветной 2x3', 10, N'кг', 746, 27, NULL, CAST(4347.00 AS Decimal(10, 2)), N'', 63)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (64, N'Гранулы цветной 3x0', 4, N'л', 151, 25, NULL, CAST(3273.00 AS Decimal(10, 2)), N'', 64)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (65, N'Спрессованный пак серый 0x3', 9, N'кг', 386, 34, NULL, CAST(40699.00 AS Decimal(10, 2)), N'', 65)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (66, N'Спрессованный пак цветной 3x1', 8, N'м', 146, 23, NULL, CAST(45318.00 AS Decimal(10, 2)), N'', 66)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (67, N'Спрессованный пак цветной 3x3', 5, N'м', 932, 47, NULL, CAST(18048.00 AS Decimal(10, 2)), N'', 67)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (68, N'Рулон зеленый 1x0', 3, N'кг', 124, 5, NULL, CAST(41572.00 AS Decimal(10, 2)), N'', 68)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (69, N'Спрессованный пак зеленый 3x2', 5, N'м', 890, 5, NULL, CAST(18071.00 AS Decimal(10, 2)), N'', 69)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (70, N'Нарезка зеленый 3x3', 2, N'кг', 172, 20, NULL, CAST(30112.00 AS Decimal(10, 2)), N'', 70)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (71, N'Рулон белый 3x1', 10, N'м', 613, 13, NULL, CAST(13360.00 AS Decimal(10, 2)), N'', 71)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (72, N'Нарезка цветной 2x2', 2, N'м', 326, 34, NULL, CAST(41538.00 AS Decimal(10, 2)), N'\materials\material_9.jpeg', 72)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (73, N'Гранулы цветной 2x0', 9, N'л', 309, 15, NULL, CAST(2670.00 AS Decimal(10, 2)), N'\materials\material_21.jpeg', 73)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (74, N'Нарезка белый 1x0', 5, N'кг', 924, 33, NULL, CAST(16050.00 AS Decimal(10, 2)), N'', 74)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (75, N'Нарезка зеленый 1x2', 4, N'м', 339, 8, NULL, CAST(45568.00 AS Decimal(10, 2)), N'', 75)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (76, N'Нарезка цветной 2x3', 3, N'кг', 498, 45, NULL, CAST(32336.00 AS Decimal(10, 2)), N'', 76)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (77, N'Спрессованный пак цветной 0x2', 7, N'кг', 474, 30, NULL, CAST(24205.00 AS Decimal(10, 2)), N'', 77)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (78, N'Нарезка синий 3x1', 6, N'м', 631, 27, NULL, CAST(50887.00 AS Decimal(10, 2)), N'', 78)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (79, N'Нарезка серый 2x1', 6, N'кг', 2, 50, NULL, CAST(7801.00 AS Decimal(10, 2)), N'', 79)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (80, N'Рулон белый 1x2', 2, N'кг', 599, 18, NULL, CAST(17952.00 AS Decimal(10, 2)), N'', 80)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (81, N'Спрессованный пак цветной 2x0', 5, N'кг', 211, 46, NULL, CAST(17965.00 AS Decimal(10, 2)), N'\materials\material_13.jpeg', 81)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (82, N'Нарезка цветной 0x0', 6, N'м', 311, 9, NULL, CAST(4018.00 AS Decimal(10, 2)), N'', 82)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (83, N'Нарезка серый 2x0', 6, N'м', 858, 37, NULL, CAST(35548.00 AS Decimal(10, 2)), N'', 83)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (84, N'Рулон белый 1x0', 9, N'м', 960, 35, NULL, CAST(37126.00 AS Decimal(10, 2)), N'\materials\material_18.jpeg', 84)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (85, N'Спрессованный пак синий 2x0', 9, N'кг', 744, 50, NULL, CAST(53857.00 AS Decimal(10, 2)), N'\materials\material_22.jpeg', 85)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (86, N'Спрессованный пак цветной 0x1', 7, N'м', 175, 50, NULL, CAST(21081.00 AS Decimal(10, 2)), N'', 86)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (87, N'Спрессованный пак синий 0x3', 4, N'м', 349, 41, NULL, CAST(29128.00 AS Decimal(10, 2)), N'', 87)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (88, N'Рулон синий 2x1', 3, N'м', 859, 5, NULL, CAST(32118.00 AS Decimal(10, 2)), N'', 88)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (89, N'Гранулы белый 3x2', 9, N'кг', 732, 50, NULL, CAST(36635.00 AS Decimal(10, 2)), N'', 89)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (90, N'Гранулы зеленый 0x2', 7, N'л', 787, 40, NULL, CAST(46326.00 AS Decimal(10, 2)), N'', 90)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (91, N'Рулон синий 2x2', 4, N'м', 426, 17, NULL, CAST(16303.00 AS Decimal(10, 2)), N'', 91)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (92, N'Рулон серый 3x0', 8, N'м', 34, 17, NULL, CAST(39760.00 AS Decimal(10, 2)), N'\materials\material_10.jpeg', 92)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (93, N'Гранулы цветной 3x1', 10, N'кг', 44, 45, NULL, CAST(21534.00 AS Decimal(10, 2)), N'\materials\material_1.jpeg', 93)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (94, N'Нарезка синий 2x2', 3, N'м', 845, 42, NULL, CAST(55748.00 AS Decimal(10, 2)), N'', 94)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (95, N'Гранулы зеленый 1x3', 8, N'л', 603, 5, NULL, CAST(48576.00 AS Decimal(10, 2)), N'', 95)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (96, N'Спрессованный пак белый 1x1', 2, N'м', 547, 35, NULL, CAST(16919.00 AS Decimal(10, 2)), N'', 96)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (97, N'Рулон зеленый 0x3', 4, N'м', 913, 13, NULL, CAST(52323.00 AS Decimal(10, 2)), N'', 97)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (98, N'Нарезка синий 3x0', 8, N'кг', 696, 42, NULL, CAST(52955.00 AS Decimal(10, 2)), N'\materials\material_19.jpeg', 98)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (99, N'Нарезка цветной 2x1', 2, N'кг', 168, 40, NULL, CAST(9509.00 AS Decimal(10, 2)), N'', 99)
GO
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (100, N'Рулон синий 1x1', 4, N'кг', 22, 37, NULL, CAST(40995.00 AS Decimal(10, 2)), N'\materials\material_14.jpeg', 100)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 25)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 44)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 9)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 21)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 23)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 34)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 17)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (8, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (8, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (16, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (17, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (17, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 2)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (22, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (23, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (23, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (27, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (27, 24)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (27, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (27, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (28, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (28, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (39, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (40, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (42, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (42, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (45, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (46, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (46, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (46, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (46, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (48, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (48, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (48, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (50, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (50, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 17)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (53, 44)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (58, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (58, 43)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (59, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (63, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (63, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (63, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (65, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (66, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (72, 3)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (72, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (72, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 15)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (81, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (81, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 43)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 25)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (85, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (87, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 24)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (94, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (94, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (94, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (96, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (96, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (96, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (98, 14)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (98, 21)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (98, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (100, 21)
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Спрессованный пак белый 1x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Спрессованный пак белый 1x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Нарезка цветной 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Спрессованный пак белый 1x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'Нарезка цветной 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (6, N'Нарезка цветной 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (7, N'Гранулы цветной 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (8, N'Нарезка синий 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (9, N'Нарезка серый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (10, N'Нарезка синий 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (11, N'Нарезка синий 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (12, N'Нарезка серый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (13, N'Гранулы цветной 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (14, N'Гранулы цветной 1x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (15, N'Гранулы цветной 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (16, N'Спрессованный пак зеленый 1x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (17, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (18, N'Гранулы цветной 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (19, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (20, N'Нарезка зеленый 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (21, N'Гранулы белый 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (22, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (23, N'Рулон синий 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (24, N'Нарезка зеленый 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (25, N'Гранулы цветной 1x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (26, N'Нарезка белый 1x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (27, N'Нарезка зеленый 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (28, N'Рулон зеленый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (29, N'Гранулы белый 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (30, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (31, N'Гранулы белый 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (32, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (33, N'Гранулы цветной 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (34, N'Нарезка зеленый 0x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (35, N'Рулон зеленый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (36, N'Рулон синий 1x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (37, N'Спрессованный пак зеленый 1x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (38, N'Гранулы белый 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (39, N'Спрессованный пак синий 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (40, N'Нарезка зеленый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (41, N'Рулон синий 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (42, N'Нарезка синий 2x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (43, N'Спрессованный пак цветной 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (44, N'Спрессованный пак цветной 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (45, N'Нарезка цветной 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (46, N'Нарезка серый 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (47, N'Спрессованный пак зеленый 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (48, N'Нарезка цветной 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (49, N'Нарезка цветной 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (50, N'Нарезка цветной 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (51, N'Спрессованный пак зеленый 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (52, N'Нарезка серый 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (53, N'Гранулы зеленый 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (54, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (55, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (56, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (57, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (58, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (59, N'Нарезка белый 2x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (60, N'Спрессованный пак белый 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (61, N'Рулон зеленый 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (62, N'Рулон зеленый 0x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (63, N'Рулон серый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (64, N'Спрессованный пак цветной 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (65, N'Рулон серый 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (66, N'Нарезка синий 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (67, N'Нарезка синий 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (68, N'Нарезка синий 3x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (69, N'Спрессованный пак синий 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (70, N'Гранулы синий 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (71, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (72, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (73, N'Спрессованный пак синий 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (74, N'Гранулы цветной 2x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (75, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (76, N'Спрессованный пак синий 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (77, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (78, N'Гранулы зеленый 1x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (79, N'Спрессованный пак синий 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (80, N'Спрессованный пак серый 0x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (81, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (82, N'Гранулы синий 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (83, N'Рулон белый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (84, N'Спрессованный пак синий 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (85, N'Рулон зеленый 0x2', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (86, N'Гранулы цветной 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (87, N'Спрессованный пак синий 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (88, N'Спрессованный пак синий 2x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (89, N'Спрессованный пак зеленый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (90, N'Гранулы цветной 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (91, N'Рулон белый 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (92, N'Спрессованный пак зеленый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (93, N'Спрессованный пак зеленый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (94, N'Спрессованный пак цветной 2x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (95, N'Гранулы цветной 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (96, N'Спрессованный пак цветной 2x3', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (97, N'Спрессованный пак зеленый 1x0', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (98, N'Гранулы цветной 3x1', 0)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (99, N'Рулон зеленый 3x2', 0)
GO
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (100, N'Спрессованный пак цветной 2x3', 0)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (1, N'ОблВектор', N'1385540089', CAST(N'2014-11-01' AS Date), 40, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (2, N'Строй', N'2255810682', CAST(N'2010-04-06' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (3, N'МонтажНефтьОрион', N'1298208597', CAST(N'2014-12-13' AS Date), 45, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (4, N'ХозБашкирГла', N'1708759159', CAST(N'2010-09-07' AS Date), 10, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (5, N'ДизайнТекстил', N'2093683523', CAST(N'2012-12-16' AS Date), 69, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (6, N'Инфо', N'1272826845', CAST(N'2011-12-28' AS Date), 33, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (7, N'ОрионБухМетал', N'2193222008', CAST(N'2012-04-09' AS Date), 52, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (8, N'РыбИнфо', N'1418660803', CAST(N'2013-05-23' AS Date), 71, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (9, N'Тех', N'2148577794', CAST(N'2010-12-15' AS Date), 28, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (10, N'ЦементОрион', N'1536344749', CAST(N'2016-02-06' AS Date), 43, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (11, N'ФинансСервис', N'1499914719', CAST(N'2016-05-27' AS Date), 21, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (12, N'ТрансМясМясКомплекс', N'1184923897', CAST(N'2019-07-14' AS Date), 78, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (13, N'ГлавСтрой', N'1107467048', CAST(N'2014-05-01' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (14, N'ИнжСофт', N'2209210168', CAST(N'2019-07-21' AS Date), 99, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (15, N'ТелекомМетизХмель', N'1001436679', CAST(N'2013-06-14' AS Date), 67, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (16, N'Лифт', N'1226636245', CAST(N'2013-12-02' AS Date), 26, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (17, N'МонтажОр', N'1687338212', CAST(N'2015-01-18' AS Date), 6, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (18, N'РыбОбл', N'2097643775', CAST(N'2016-03-05' AS Date), 80, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (19, N'ГлавСерви', N'2112058447', CAST(N'2016-11-05' AS Date), 20, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (20, N'СервисБашкирКазТраст', N'1549832431', CAST(N'2018-03-19' AS Date), 36, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (21, N'Компания Нефть', N'2173203619', CAST(N'2010-08-09' AS Date), 97, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (22, N'РыбВостокХоз', N'1311161756', CAST(N'2017-09-09' AS Date), 47, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (23, N'Радио', N'1104637210', CAST(N'2016-08-21' AS Date), 27, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (24, N'РечСофтРе', N'1155044386', CAST(N'2012-08-08' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (25, N'Компания ТелекомРосКрепПром', N'1124623718', CAST(N'2012-06-17' AS Date), 71, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (26, N'Омск', N'1567184813', CAST(N'2016-12-01' AS Date), 90, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (27, N'РосЮпитер', N'2100448888', CAST(N'2013-07-21' AS Date), 23, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (28, N'БухИнфо', N'2192138211', CAST(N'2017-12-17' AS Date), 91, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (29, N'РечТранс', N'2237035085', CAST(N'2019-10-12' AS Date), 22, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (30, N'ТелекомТра', N'1144555605', CAST(N'2010-08-26' AS Date), 31, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (31, N'Глав', N'1859167660', CAST(N'2012-05-24' AS Date), 87, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (32, N'ЖелДорСтройВекторКомплекс', N'2004254497', CAST(N'2019-05-12' AS Date), 97, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (33, N'Вод', N'1492095710', CAST(N'2017-12-21' AS Date), 63, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (34, N'ТверьМор', N'2013469587', CAST(N'2017-01-08' AS Date), 61, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (35, N'ЦементИнфоМонтаж', N'1389100819', CAST(N'2014-06-19' AS Date), 46, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (36, N'Вектор', N'1009676137', CAST(N'2012-06-20' AS Date), 22, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (37, N'Компания МорКаза', N'1177669508', CAST(N'2016-05-28' AS Date), 6, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (38, N'Урал', N'1439263529', CAST(N'2013-05-06' AS Date), 21, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (39, N'ГорТверьЛифт', N'1865606765', CAST(N'2015-04-01' AS Date), 50, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (40, N'ЭлектроВод', N'1521101623', CAST(N'2017-05-27' AS Date), 16, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (41, N'АлмазМикроМобайлПром', N'1664868343', CAST(N'2016-03-06' AS Date), 94, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (42, N'Компания ТомскТверьТ', N'1341807682', CAST(N'2015-12-25' AS Date), 26, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (43, N'Тверь', N'1860530128', CAST(N'2017-06-25' AS Date), 17, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (44, N'УралТексти', N'1705799898', CAST(N'2018-04-28' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (45, N'ТверьЛайт', N'1499654365', CAST(N'2015-02-09' AS Date), 14, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (46, N'ХозСервис', N'1656715446', CAST(N'2015-11-13' AS Date), 99, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (47, N'КрепМетизВектор', N'1209084074', CAST(N'2016-06-04' AS Date), 64, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (48, N'ЖелДорХ', N'2004002859', CAST(N'2015-05-03' AS Date), 65, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (49, N'ВодОбл', N'1987741499', CAST(N'2019-04-25' AS Date), 38, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (50, N'Электро', N'1827769521', CAST(N'2015-05-03' AS Date), 86, N' ПАО')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Maksim220] SET  READ_WRITE 
GO
