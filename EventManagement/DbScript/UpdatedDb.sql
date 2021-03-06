USE [master]
GO
/****** Object:  Database [Event_Management]    Script Date: 6/1/2018 7:25:16 PM ******/
CREATE DATABASE [Event_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Event_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Event_Management.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Event_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Event_Management_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Event_Management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Event_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Event_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event_Management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Event_Management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Event_Management]
GO
/****** Object:  Table [dbo].[Activites]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[Description] [varchar](500) NOT NULL,
	[Thumbnail] [varchar](500) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[CreateON] [datetime] NULL,
	[Status] [bit] NULL,
	[ActivityTypeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActivityTPYES]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivityTPYES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppSetting]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppSetting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](max) NULL,
	[key] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](500) NOT NULL,
	[LastName] [varchar](500) NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[Password] [varchar](1000) NOT NULL,
	[PhoneNumber] [varchar](500) NOT NULL,
	[UserRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendes]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[FacebookURL] [varchar](1000) NULL,
	[TwitterURL] [varchar](1000) NULL,
	[InstagramURL] [varchar](1000) NULL,
	[AddedON] [datetime] NULL,
	[AddedBY] [int] NULL,
	[Status] [bit] NULL,
	[DeviceToken] [varchar](500) NULL,
	[Email] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendesEvents]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendesEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttendesID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookMark]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookMark](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[AttendesID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModeratePost] [bit] NULL,
	[GalacticEventId] [int] NULL,
	[EventName] [varchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[ManagerUserId] [int] NULL,
	[EnableThemes] [bit] NULL,
	[EnableActivity] [bit] NULL,
	[EnableQrCode] [bit] NULL,
	[EnableAttendees] [bit] NULL,
	[EnableFloormap] [bit] NULL,
	[EnablePhotos] [bit] NULL,
	[EnableSponsor] [bit] NULL,
	[EnableComments] [bit] NULL,
	[EnableGoogleApi] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FloorMapping]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FloorMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[PhotoURL] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FloorRegionMapping]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FloorRegionMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[FMid] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[Width] [decimal](16, 2) NULL,
	[height] [decimal](16, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForumSocialComments]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForumSocialComments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[AttendesID] [int] NOT NULL,
	[Comments] [varchar](500) NULL,
	[ApprovedON] [datetime] NULL,
	[ApprovedBY] [int] NULL,
	[CommentedON] [datetime] NULL,
	[ReplyerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[Text] [varchar](500) NULL,
	[AddedON] [datetime] NULL,
	[AddedBY] [int] NULL,
	[Status] [bit] NULL,
	[AttendesID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Photos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[URL] [varchar](1000) NULL,
	[UploadON] [datetime] NULL,
	[UploadBY] [int] NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostType]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostUserLike]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostUserLike](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[AttendesID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QRCode]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QRCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[AtivitityID] [int] NULL,
	[WebURL] [varchar](1000) NOT NULL,
	[GeneratedON] [datetime] NULL,
	[GeneratedBY] [int] NULL DEFAULT ('0'),
	[Status] [bit] NULL,
	[CodePath] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QRHistory]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QRid] [int] NOT NULL,
	[AttendesID] [int] NOT NULL,
	[CommentON] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sections]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SocialForum]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SocialForum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[URL] [varchar](1000) NULL,
	[UploadON] [datetime] NULL,
	[UploadBY] [int] NULL,
	[Description] [varchar](500) NULL,
	[PostTypeid] [int] NOT NULL,
	[ApprovedON] [datetime] NULL,
	[ApprovedBY] [int] NULL DEFAULT ('0'),
	[Status] [bit] NULL,
	[TotalLikes] [int] NULL,
	[AttendesID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sponsors]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sponsors](
	[ID] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[DocURL] [varchar](1000) NULL,
	[Status] [bit] NULL,
	[Name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SponsorsEvents]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SponsorsEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SponsorID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Theme]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Theme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[SplashScreemURL] [varchar](1000) NULL,
	[AppBackgroundURL] [varchar](1000) NULL,
	[ButtonURL] [varchar](1000) NULL,
	[ButtonBackgroundColor] [varchar](10) NULL,
	[ButtonForegroundColor] [varchar](10) NULL,
	[LabelForegroundColor] [varchar](10) NULL,
	[HeadingForegroundColor] [varchar](10) NULL,
	[Message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserEvent_Permission]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEvent_Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 6/1/2018 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthToken] [varchar](200) NULL,
	[Platform] [varchar](200) NULL,
	[UserID] [int] NULL,
	[AttendesID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Activites] ON 

GO
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid]) VALUES (1, 1, N'tewt 1', N'fd5c26c0-9150-4949-a91d-5afc38534c8d.png', CAST(N'2018-04-16 00:00:00.000' AS DateTime), CAST(N'2018-04-18 00:00:00.000' AS DateTime), N'fdfgdfg', CAST(N'2018-04-22 19:32:42.137' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid]) VALUES (2, 2, N'test', N'48653a59-babb-4c6d-b74e-23b63ccad67e.png', CAST(N'2018-05-16 00:00:00.000' AS DateTime), CAST(N'2018-05-30 00:00:00.000' AS DateTime), N'abc', CAST(N'2018-05-15 22:06:06.517' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid]) VALUES (3, 2, N'test', N'', CAST(N'2018-05-28 00:00:00.000' AS DateTime), CAST(N'2018-05-29 00:00:00.000' AS DateTime), N'123', CAST(N'2018-05-23 23:42:53.263' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Activites] OFF
GO
SET IDENTITY_INSERT [dbo].[AppUser] ON 

GO
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (4, N'toufique', N'ahmed', N'email@email.com', N'12345', N'12345', 0)
GO
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (5, N'moderator', N'che', N'e@e.com', N'12345', N'32154', 2)
GO
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (6, N'Manager', N'test', N'm@m.com', N'12345', N'32115', 1)
GO
SET IDENTITY_INSERT [dbo].[AppUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendes] ON 

GO
INSERT [dbo].[Attendes] ([ID], [Name], [Description], [Thumbnail], [FacebookURL], [TwitterURL], [InstagramURL], [AddedON], [AddedBY], [Status], [DeviceToken], [Email]) VALUES (1, N'test', N'desi', N'9953dee7-424d-4aa7-a557-93f6b208c76d.png', NULL, NULL, NULL, NULL, 4, NULL, NULL, N'dakhtar@galacticps.com')
GO
SET IDENTITY_INSERT [dbo].[Attendes] OFF
GO
SET IDENTITY_INSERT [dbo].[AttendesEvents] ON 

GO
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (2, 1, 2)
GO
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (3, 1, 2)
GO
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (4, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[AttendesEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

GO
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi]) VALUES (1, 1, 5, N'my event', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi]) VALUES (2, NULL, 191, N'191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi]) VALUES (3, NULL, 14, N'test event', N'abc message', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[FloorMapping] ON 

GO
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL]) VALUES (1, 2, N'')
GO
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL]) VALUES (2, 2, N'ad1d5b83-d50a-4ffb-8767-3135a944b611.png')
GO
SET IDENTITY_INSERT [dbo].[FloorMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[FloorRegionMapping] ON 

GO
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height]) VALUES (1, 2, 2, N'this is the test', 184, 459, NULL, NULL)
GO
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height]) VALUES (3, 2, 2, N'000', 695, 485, NULL, NULL)
GO
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height]) VALUES (4, 2, 1, N'000', 65, 23, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FloorRegionMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

GO
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status]) VALUES (1, 1, N'49c323ee-9bd0-49a9-9f76-2146d9f4d428.png', CAST(N'2018-04-14 19:44:32.710' AS DateTime), 4, N'', 1)
GO
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status]) VALUES (2, 1, N'1f6cc57e-1ef7-460c-b068-0890f1c8442b.png', CAST(N'2018-04-14 19:44:32.710' AS DateTime), 4, N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[PostType] ON 

GO
INSERT [dbo].[PostType] ([ID], [Name]) VALUES (1, N'Normal')
GO
SET IDENTITY_INSERT [dbo].[PostType] OFF
GO
SET IDENTITY_INSERT [dbo].[QRCode] ON 

GO
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath]) VALUES (1, 2, N'TEST DESCRIPTION', NULL, N'2e27297a-5659-4cd9-bad4-01dcb89d2def.png', CAST(N'2018-05-21 22:57:57.910' AS DateTime), 4, 1, N'2e27297a-5659-4cd9-bad4-01dcb89d2def.png')
GO
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath]) VALUES (2, 1, N'abc test', NULL, N'300ac4cf-a9ba-4873-a29b-a19443a9d655.png', CAST(N'2018-05-23 00:45:35.637' AS DateTime), 6, 1, N'https://www.google.com')
GO
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath]) VALUES (3, 1, N'abc test test 0', NULL, N'https://www.google.com', CAST(N'2018-05-23 00:51:36.787' AS DateTime), 6, 1, N'1a72302c-115e-4fec-b58d-5bfb7402b554.png')
GO
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath]) VALUES (4, 2, N'', 2, N'', CAST(N'2018-05-23 23:37:11.640' AS DateTime), 4, 1, N'98caebfe-2ea1-4928-abfd-efa7cb526760.png')
GO
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath]) VALUES (5, 2, N'', 3, N'', CAST(N'2018-05-23 23:42:56.967' AS DateTime), 4, 1, N'0f0db4fe-fb26-4f18-9461-b59f146b45d7.png')
GO
SET IDENTITY_INSERT [dbo].[QRCode] OFF
GO
SET IDENTITY_INSERT [dbo].[SocialForum] ON 

GO
INSERT [dbo].[SocialForum] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [PostTypeid], [ApprovedON], [ApprovedBY], [Status], [TotalLikes], [AttendesID]) VALUES (3, 2, NULL, NULL, NULL, N'abc', 1, NULL, 0, 1, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SocialForum] OFF
GO
INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name]) VALUES (0, N'test desi and i', N'b2766ef4-c52a-4e04-9aea-1a2493b27350.png', NULL, NULL, N'gtest')
GO
SET IDENTITY_INSERT [dbo].[SponsorsEvents] ON 

GO
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (2, 0, 2)
GO
SET IDENTITY_INSERT [dbo].[SponsorsEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSession] ON 

GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (1, N'e644ad076d4a4be6bddfb93219797224', N'Web', 4, NULL, CAST(N'2018-04-14 19:39:20.270' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (2, N'360cca54a91e4768b4e96c214056f313', N'IOS', NULL, 1, CAST(N'2018-04-22 16:58:49.233' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (3, N'c944825d09e744ab94daf5efcd1323b7', N'IOS', NULL, 1, CAST(N'2018-04-22 17:08:10.220' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (4, N'291269374e834d52ac087dd4889f33d8', N'IOS', NULL, 1, CAST(N'2018-04-22 17:11:10.400' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (5, N'a24fa3b20dc44a9a9f50051a250701cf', N'Web', 6, NULL, CAST(N'2018-05-22 23:41:19.067' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (6, N'378c7a58f5be482ca7beca9bbfe01a68', N'Web', 6, NULL, CAST(N'2018-05-23 00:12:30.363' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (7, N'591d3ed09f9d4b2d803daace0ef0f439', N'Web', 6, NULL, CAST(N'2018-05-23 01:07:18.617' AS DateTime), 1)
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive]) VALUES (8, N'ad80b05412dd413db1a19dce1e362f7c', N'Web', 5, NULL, CAST(N'2018-05-27 14:21:09.290' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserSession] OFF
GO
ALTER TABLE [dbo].[ForumSocialComments] ADD  DEFAULT ('0') FOR [ApprovedBY]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [AddedBY]
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD FOREIGN KEY([ActivityTypeid])
REFERENCES [dbo].[ActivityTPYES] ([ID])
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD FOREIGN KEY([ActivityTypeid])
REFERENCES [dbo].[ActivityTPYES] ([ID])
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([ManagerUserId])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[FloorMapping]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorMapping]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD FOREIGN KEY([FMid])
REFERENCES [dbo].[FloorMapping] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD FOREIGN KEY([FMid])
REFERENCES [dbo].[FloorMapping] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([ReplyerID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([ReplyerID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([ID])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([ID])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD FOREIGN KEY([AtivitityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD FOREIGN KEY([AtivitityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD FOREIGN KEY([QRid])
REFERENCES [dbo].[QRCode] ([ID])
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD FOREIGN KEY([QRid])
REFERENCES [dbo].[QRCode] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([PostTypeid])
REFERENCES [dbo].[PostType] ([ID])
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD FOREIGN KEY([PostTypeid])
REFERENCES [dbo].[PostType] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([ID])
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[UserEvent_Permission]  WITH CHECK ADD FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([ID])
GO
ALTER TABLE [dbo].[UserEvent_Permission]  WITH CHECK ADD FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([ID])
GO
ALTER TABLE [dbo].[UserEvent_Permission]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[UserEvent_Permission]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Event_Management] SET  READ_WRITE 
GO
