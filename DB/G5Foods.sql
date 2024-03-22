USE [master]
GO
/****** Object:  Database [G5Foods]    Script Date: 22/3/2024 7:32:44 AM ******/
CREATE DATABASE [G5Foods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'G5Foods', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\G5Foods.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'G5Foods_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\G5Foods_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [G5Foods] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [G5Foods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [G5Foods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [G5Foods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [G5Foods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [G5Foods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [G5Foods] SET ARITHABORT OFF 
GO
ALTER DATABASE [G5Foods] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [G5Foods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [G5Foods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [G5Foods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [G5Foods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [G5Foods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [G5Foods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [G5Foods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [G5Foods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [G5Foods] SET  ENABLE_BROKER 
GO
ALTER DATABASE [G5Foods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [G5Foods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [G5Foods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [G5Foods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [G5Foods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [G5Foods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [G5Foods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [G5Foods] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [G5Foods] SET  MULTI_USER 
GO
ALTER DATABASE [G5Foods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [G5Foods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [G5Foods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [G5Foods] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [G5Foods] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [G5Foods] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [G5Foods] SET QUERY_STORE = ON
GO
ALTER DATABASE [G5Foods] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [G5Foods]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](100) NULL,
	[AdminEmail] [nvarchar](50) NULL,
	[AdminPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Description] [nvarchar](999) NULL,
	[Image] [nvarchar](999) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Email] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[Freight] [int] NULL,
	[ShipName] [nvarchar](100) NULL,
	[ShipPhone] [nvarchar](50) NULL,
	[Address] [int] NULL,
	[AdminId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22/3/2024 7:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryID] [int] NOT NULL,
	[UnitPrice] [int] NULL,
	[Image] [nvarchar](999) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressID], [City], [Country]) VALUES (1, N'Hai Duong City', N'VN')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminID], [AdminName], [AdminEmail], [AdminPassword]) VALUES (1, N'KienBV2', N'Kienbv@gamil. com', N'0212')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (1, N'Fruit', N'Delicious perfect', N'image.png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Email], [Password]) VALUES (1, N'KienBV2', N'KienBV    ', N'0212      ')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 1, 100, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [Freight], [ShipName], [ShipPhone], [Address], [AdminId]) VALUES (1, 1, CAST(N'2024-02-03T00:00:00.000' AS DateTime), CAST(N'2024-02-03T00:00:00.000' AS DateTime), 100, N'Kien', N'123123123', 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [Freight], [ShipName], [ShipPhone], [Address], [AdminId]) VALUES (2, 1, CAST(N'2024-03-14T21:05:00.000' AS DateTime), CAST(N'2024-03-08T21:05:00.000' AS DateTime), NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [Image]) VALUES (1, N'Product 123', 1, 100, N'image.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY([Address])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Admins] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admins] ([AdminID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Admins]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [G5Foods] SET  READ_WRITE 
GO
