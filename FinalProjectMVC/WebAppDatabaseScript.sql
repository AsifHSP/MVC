USE [master]
GO
/****** Object:  Database [WebApp]    Script Date: 4/14/2023 2:45:28 PM ******/
CREATE DATABASE [WebApp]
 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApp] SET RECOVERY FULL 
GO
ALTER DATABASE [WebApp] SET  MULTI_USER 
GO
ALTER DATABASE [WebApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebApp', N'ON'
GO
ALTER DATABASE [WebApp] SET QUERY_STORE = OFF
GO
USE [WebApp]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 4/14/2023 2:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [decimal](10, 4) NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 4/14/2023 2:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 4/14/2023 2:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Product_Price] [decimal](10, 4) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 4/14/2023 2:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Gender] [nvarchar](50) NULL,
	[InterestedInC#] [bit] NULL,
	[InterestedInJavaScript] [bit] NULL,
	[InterestedInPython] [bit] NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (1, N'Lahore')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (2, N'Karachi')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (3, N'Islamabad')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (4, N'Pashwar')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (5, N'Bahawalpur')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (6, N'Multan')
GO
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (7, N'Mardan')
GO
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (1, N'Asif', N'asifhsp1234@gmail.com', N'asif.4215', N'Female', 1, 0, 0, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (2, N'usman', N'usman@gmail.com', N'usman1234', N'Male', 1, 1, 1, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (3, N'usman', N'usman@gmail.com', N'usman1234', N'Female', 0, 1, 0, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (4, N'usman', N'usman@gmail.com', N'usman1234', N'Male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (5, N'usman', N'usman@gmail.com', N'usman1234', N'Male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (6, N'najeeb', N'najeeb@gmail.com', N'najeeb1234', N'Female', 0, 0, 1, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (7, N'wahab', N'wahab@gmail.co,', N'kdslfjkldf', N'Male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (8, N'Asif Bhatii', N'asifhsp1234@gmail.com', N'asif.4215', N'Male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [InterestedInC#], [InterestedInJavaScript], [InterestedInPython], [CityId]) VALUES (9, N'awais', N'awais@gmail.com', N'awais1234', N'Male', 1, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[tbl_City] ([CityId])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_City]
GO
USE [master]
GO
ALTER DATABASE [WebApp] SET  READ_WRITE 
GO
