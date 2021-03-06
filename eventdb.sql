USE [master]
GO
/****** Object:  Database [Event_Management2]    Script Date: 5/20/2019 11:56:01 AM ******/
CREATE DATABASE [Event_Management2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Event_Management1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Event_Management2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Event_Management1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Event_Management2_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Event_Management2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event_Management2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event_Management2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event_Management2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event_Management2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event_Management2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event_Management2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event_Management2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Event_Management2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event_Management2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event_Management2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event_Management2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event_Management2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event_Management2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event_Management2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event_Management2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event_Management2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Event_Management2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event_Management2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event_Management2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event_Management2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event_Management2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event_Management2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event_Management2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event_Management2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event_Management2] SET  MULTI_USER 
GO
ALTER DATABASE [Event_Management2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event_Management2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event_Management2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event_Management2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Event_Management2]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 5/20/2019 11:56:02 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Activites]    Script Date: 5/20/2019 11:56:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[Status] [bit] NOT NULL,
	[ActivityTypeid] [int] NULL,
	[GalacticActivityId] [int] NULL,
	[Name] [varchar](100) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
 CONSTRAINT [PK__Activite__3214EC2768EDFF98] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityTPYES]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Attendes]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[Status] [bit] NOT NULL,
	[DeviceToken] [varchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[LinkedinURL] [varchar](1000) NULL,
	[Lastname] [varchar](100) NULL,
	[code] [int] NULL,
	[codeDate] [datetime] NULL,
	[Unique_Participant_ID] [varchar](50) NULL,
	[Imageapprove] [bit] NULL,
	[RequestedImage] [varchar](500) NULL,
 CONSTRAINT [PK__Attendes__3214EC27795E67ED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendesEvents]    Script Date: 5/20/2019 11:56:03 AM ******/
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
/****** Object:  Table [dbo].[BookMark]    Script Date: 5/20/2019 11:56:03 AM ******/
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
/****** Object:  Table [dbo].[Config]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupportEmail] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[Subject] [varchar](100) NULL,
	[EmailBody] [varchar](1000) NULL,
	[ScreenTitle] [varchar](100) NULL,
 CONSTRAINT [PK__Config__3214EC27D1013630] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupportEmail] [varchar](50) NULL,
	[isActive] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModeratePost] [bit] NULL,
	[GalacticEventId] [int] NULL,
	[EventName] [varchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[ManagerUserId] [int] NULL,
	[EnableThemes] [bit] NOT NULL,
	[EnableActivity] [bit] NOT NULL,
	[EnableQrCode] [bit] NOT NULL,
	[EnableAttendees] [bit] NOT NULL,
	[EnableFloormap] [bit] NOT NULL,
	[EnablePhotos] [bit] NOT NULL,
	[EnableSponsor] [bit] NOT NULL,
	[EnableComments] [bit] NOT NULL,
	[EnableGoogleApi] [bit] NOT NULL,
	[allow_bookmark] [bit] NOT NULL,
	[EventImage] [varchar](200) NULL,
	[EnableSocialScreen] [bit] NOT NULL,
	[EnableSearchScreen] [bit] NOT NULL,
	[Destination] [varchar](1000) NULL,
	[ClientName] [varchar](150) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[WebURL] [varchar](200) NULL,
	[ActivityTitle] [varchar](50) NULL,
	[QrCodeTitle] [varchar](50) NULL,
	[AttendeeTitle] [varchar](50) NULL,
	[FloormapTitle] [varchar](50) NULL,
	[PhotosTitle] [varchar](50) NULL,
	[SponsorTitle] [varchar](50) NULL,
	[MapTitle] [varchar](50) NULL,
	[SocialTitle] [varchar](50) NULL,
	[SearchTitle] [varchar](50) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[EnableSpeaker] [bit] NOT NULL,
	[SpeakerTitle] [varchar](50) NULL,
	[EnableExhibitor] [bit] NOT NULL,
	[ExhibitorTitle] [varchar](50) NULL,
	[EnableVendor] [bit] NOT NULL,
	[VendorTitle] [varchar](50) NULL,
	[GoogleFolderID] [varchar](300) NULL,
	[GoogleAlbumphotoUrl] [varchar](1000) NULL,
	[EnableChatscreen] [bit] NOT NULL,
 CONSTRAINT [PK__Event__3214EC27283B4BA3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exhibitors]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exhibitors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[DocURL] [varchar](1000) NULL,
	[Status] [bit] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Packagetype] [int] NOT NULL,
 CONSTRAINT [PK__Exhibitors__3214EC279DB8158D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExhibitorsEvents]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExhibitorsEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExhibitorsID] [int] NULL,
	[EventID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FloorMapping]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FloorMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[PhotoURL] [varchar](500) NULL,
	[PhotoHeight] [int] NULL,
	[PhotoWidth] [int] NULL,
	[FloorName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FloorRegionMapping]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FloorRegionMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[FMid] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[X] [decimal](16, 3) NULL,
	[Y] [decimal](16, 3) NULL,
	[Width] [decimal](16, 2) NULL,
	[height] [decimal](16, 2) NULL,
	[Regioncolor] [varchar](50) NULL,
 CONSTRAINT [PK__FloorReg__3214EC27613E712E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumSocialComments]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumSocialComments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[AttendesID] [int] NOT NULL,
	[Comments] [varchar](500) NULL,
	[ApprovedON] [datetime] NULL,
	[ApprovedBY] [int] NULL,
	[CommentedON] [datetime] NULL,
	[ReplyerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[Text] [varchar](500) NULL,
	[AddedON] [datetime] NULL,
	[AddedBY] [int] NULL,
	[Status] [bit] NOT NULL,
	[AttendesID] [int] NOT NULL,
	[ReadDate] [datetime] NULL,
	[Isread] [bit] NULL,
	[description] [varchar](1000) NULL,
 CONSTRAINT [PK__Notifica__3214EC2786870860] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 5/20/2019 11:56:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[URL] [varchar](1000) NULL,
	[UploadON] [datetime] NULL,
	[UploadBY] [int] NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
	[isSync] [bit] NOT NULL,
 CONSTRAINT [PK__Photos__3214EC27D2FB477D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostType]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[PostUserLike]    Script Date: 5/20/2019 11:56:04 AM ******/
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
/****** Object:  Table [dbo].[QRCode]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[Description] [varchar](500) NOT NULL,
	[AtivitityID] [int] NULL,
	[WebURL] [varchar](1000) NOT NULL,
	[GeneratedON] [datetime] NULL,
	[GeneratedBY] [int] NULL,
	[Status] [bit] NOT NULL,
	[CodePath] [nvarchar](1000) NULL,
	[SponsorID] [int] NULL,
 CONSTRAINT [PK__QRCode__3214EC27D55FECFE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRHistory]    Script Date: 5/20/2019 11:56:04 AM ******/
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
/****** Object:  Table [dbo].[SocialForum]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[ApprovedBY] [int] NULL,
	[Status] [bit] NOT NULL,
	[TotalLikes] [int] NULL,
	[AttendesID] [int] NOT NULL,
	[DeleteRequest] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__SocialFo__3214EC270B125EC8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speakers ]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speakers ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[DocURL] [varchar](1000) NULL,
	[Status] [bit] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Packagetype] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpeakersEvents]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeakersEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerID] [int] NULL,
	[EventID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsors]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[DocURL] [varchar](1000) NULL,
	[Status] [bit] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Packagetype] [int] NOT NULL,
 CONSTRAINT [PK__Sponsors__3214EC279DB8158D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SponsorsEvents]    Script Date: 5/20/2019 11:56:04 AM ******/
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
/****** Object:  Table [dbo].[Theme]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[UserPackageType]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPackageType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[iconimage] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthToken] [varchar](200) NULL,
	[Platform] [varchar](200) NULL,
	[UserID] [int] NULL,
	[AttendesID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[DeviceToken] [varchar](800) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[DocURL] [varchar](1000) NULL,
	[Status] [bit] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Packagetype] [int] NOT NULL,
 CONSTRAINT [PK__Vendors__3214EC279DB8158D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorsEvents]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorsEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorsID] [int] NULL,
	[EventID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitStrings_XML]    Script Date: 5/20/2019 11:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE FUNCTION [dbo].[SplitStrings_XML]
(
   @List       VARCHAR(MAX),
   @Delimiter  CHAR(1) = ','
)
RETURNS TABLE
WITH SCHEMABINDING
AS
   RETURN 
   (  
      SELECT Item = y.i.value('(./text())[1]', 'varchar(8000)')
      FROM 
      ( 
        SELECT x = CONVERT(XML, '<i>' 
          + REPLACE(@List, @Delimiter, '</i><i>') 
          + '</i>').query('.')
      ) AS a CROSS APPLY x.nodes('i') AS y(i)
   );
GO
SET IDENTITY_INSERT [dbo].[Activites] ON 

INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (16, 2, N'', N'', CAST(N'2018-08-16T00:00:00.000' AS DateTime), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 63, N'No Activity', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (20, 2, N'', N'', CAST(N'2018-08-16T00:00:00.000' AS DateTime), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 64, N'ATV Tour', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (22, 3, N'dsfsdfsd', N'', CAST(N'2018-12-07T00:00:00.000' AS DateTime), CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'Pakistan, Damascus, Syria', NULL, 0, 1, 1, N'No Activity', 33.5209747, 36.292734099999961)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (23, 3, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2018-12-07T00:00:00.000' AS DateTime), CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'Pakistan Town, Rawalpindi, Pakistan', NULL, 0, 1, 2, N'Sea Passion Catamaran Snorkel', 33.5753184, 73.14307400000007)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (24, 3, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2018-12-26T00:00:00.000' AS DateTime), CAST(N'2018-12-26T00:00:00.000' AS DateTime), N'Indiana, USA', NULL, 0, 1, 20, N'No Activity', 40.2671941, -86.134901899999988)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (25, 3, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2018-12-06T00:00:00.000' AS DateTime), CAST(N'2018-12-06T00:00:00.000' AS DateTime), N'Delhi, India', NULL, 0, 1, 21, N'Shopping Shuttle', 28.686273800000009, 77.221783100000039)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (65, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2014-10-01T04:26:05.000' AS DateTime), CAST(N'2014-10-09T04:18:06.000' AS DateTime), N'Frankfurt am Main, Germany', NULL, 0, 1, 23, N'Guided Tour of Montmartre Village', 50.110922099999989, 8.6821267000000262)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (66, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'Nazimabad, Karachi, Pakistan', NULL, 0, 1, 24, N'Guided Tour of the Louvre Museum', 24.910688, 67.031097300000056)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (67, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'Gujarat, India', NULL, 0, 1, 25, N'Guided Visit of the Palace of Versailles', 22.258652, 71.192380500000013)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (68, 1, N'Demo', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'Indianapolis, IN, USA', NULL, 0, 1, 26, N'Gastronomical Tour of Paris', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (69, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'Canada', NULL, 0, 1, 27, N'Dinner Cruise on the Seine River', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (70, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'France Avenue South, Edina, MN, USA', NULL, 0, 1, 28, N'Veuve Cliquot Experience', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (71, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to', N'd9bb0c0d-ed12-414c-a81b-7f5956ef1356.png', CAST(N'2014-11-06T12:53:29.000' AS DateTime), CAST(N'2014-11-07T12:54:12.000' AS DateTime), N'Preston Lane, Chippenham, UK', NULL, 0, 1, 29, N'Alan Ducasse Cooking School', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (72, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'Paris, France', NULL, 0, 1, 31, N'Guided Tour to Normandy and Landing Beaches', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (73, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'Germany', NULL, 0, 1, 32, N'Guided tour to the Champagne Region', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (74, 1, N'Demo', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'Fiji Way, Marina del Rey, CA, USA', NULL, 0, 1, 33, N'Guided Tour of the Loire Valley', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (75, 1, N'Demo', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'Portuguesa, Venezuela', NULL, 0, 1, 35, N'Dinner Cruise on the Seine River', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (76, 1, N'demo', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'Dubai Silicon Oasis - Dubai - United Arab Emirates', NULL, 0, 1, 36, N'Alan Ducasse Cooking School', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (77, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'Sr No 13/2A, Akashwani, Satav Plot, National Highway 65, Satav Plot, Amardip Pratishthan, Indraprashtha Society, Hadapsar, Pune, Maharashtra, India', NULL, 0, 1, 37, N'Backstage of the Opera House', 18.498746999999991, 73.945177199999989)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (78, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 4, N'Guided Tour of Montmartre Village', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (79, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 5, N'Guided Tour of the Louvre Museum ', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (80, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 6, N'Guided Visit of the Palace of Versailles ', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (81, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 7, N'Gastronomical Tour of Paris', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (82, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 9, N'Dinner Cruise on the Seine River', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (83, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 10, N'Veuve Cliquot Experience', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (84, 5, N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 11, N'Alan Ducasse Cooking School', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (85, 5, N'', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 13, N'Guided Tour to Normandy and Landing Beaches', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (86, 5, N'', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 14, N'Guided tour to the Champagne Region', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (87, 5, N'', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 15, N'Guided Tour of the Loire Valley', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (88, 5, N'', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 17, N'Dinner Cruise on the Seine River', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (89, 5, N'', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 18, N'Alan Ducasse Cooking School', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (90, 5, N'', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-03-09T00:00:00.000' AS DateTime), N'', NULL, 1, 1, 19, N'Backstage of the Opera House', NULL, NULL)
INSERT [dbo].[Activites] ([ID], [EventID], [Description], [Thumbnail], [StartTime], [EndTime], [Address], [CreateON], [Status], [ActivityTypeid], [GalacticActivityId], [Name], [latitude], [longitude]) VALUES (91, 1, N'CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to develop and execute plans with speed and precision on a national or hyper-local basis.', N'd6b81e34-7916-4a37-b756-2527caae4d68.png', CAST(N'2018-11-05T18:03:31.000' AS DateTime), CAST(N'2018-11-06T18:03:35.000' AS DateTime), N'DFW International Airport (DFW), Aviation Drive, DFW Airport, TX, USA', CAST(N'2018-11-05T18:03:40.563' AS DateTime), 0, NULL, 23, N'Guided Tour of Montmartre Villaged', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Activites] OFF
SET IDENTITY_INSERT [dbo].[ActivityTPYES] ON 

INSERT [dbo].[ActivityTPYES] ([ID], [Name]) VALUES (1, N'd')
SET IDENTITY_INSERT [dbo].[ActivityTPYES] OFF
SET IDENTITY_INSERT [dbo].[AppUser] ON 

INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (14, N'waqar', N'khan', N'email@email.com', N'12345', N'3332311299', 0)
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (15, N'Harry ', N'Potter', N'e@e.com', N'12345', N'12344', 1)
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (16, N'Raza', N'khan', N'm@m.com', N'12345', N'12345', 2)
INSERT [dbo].[AppUser] ([Id], [FirstName], [LastName], [Email], [Password], [PhoneNumber], [UserRole]) VALUES (17, N'waqar', N'khan', N'emailssss@email.com', N'12345', N'saadas', 0)
SET IDENTITY_INSERT [dbo].[AppUser] OFF
SET IDENTITY_INSERT [dbo].[Attendes] ON 

INSERT [dbo].[Attendes] ([ID], [Name], [Description], [Thumbnail], [FacebookURL], [TwitterURL], [InstagramURL], [AddedON], [AddedBY], [Status], [DeviceToken], [Email], [LinkedinURL], [Lastname], [code], [codeDate], [Unique_Participant_ID], [Imageapprove], [RequestedImage]) VALUES (1, N'waqar', N'Golf at the Four Seasons Costa Rica', N'noimage.png', N'https://www.google.com/', N'https://www.google.com/', N'https://www.google.com/', NULL, 14, 1, NULL, N'developer2.hrsts@gmail.com', N'https://www.google.com/', NULL, 8486, CAST(N'2019-03-12T14:45:05.520' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Attendes] ([ID], [Name], [Description], [Thumbnail], [FacebookURL], [TwitterURL], [InstagramURL], [AddedON], [AddedBY], [Status], [DeviceToken], [Email], [LinkedinURL], [Lastname], [code], [codeDate], [Unique_Participant_ID], [Imageapprove], [RequestedImage]) VALUES (58, N'Danish ', N'<h1>khgghghghghhgjhgjh<img src="https://www.gstatic.com/webp/gallery/2.jpg"></h1>', N'noimage.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'dakhtar@galacticps.com', NULL, N'Akhtar', 9821, CAST(N'2019-05-06T19:41:06.017' AS DateTime), N'd8c67d35-2035-407e-9921-30c4184a70a8', NULL, NULL)
INSERT [dbo].[Attendes] ([ID], [Name], [Description], [Thumbnail], [FacebookURL], [TwitterURL], [InstagramURL], [AddedON], [AddedBY], [Status], [DeviceToken], [Email], [LinkedinURL], [Lastname], [code], [codeDate], [Unique_Participant_ID], [Imageapprove], [RequestedImage]) VALUES (60, N'kgocke', NULL, N'noimage.png', N'https://facebook.com', N'https://facebook.com', N'https://facebook.come', CAST(N'2018-10-30T04:22:31.313' AS DateTime), NULL, 0, NULL, N'kgocke@galacticps.com', N'https://www.linkedin.com/', N'h', 5940, CAST(N'2019-04-19T20:21:00.387' AS DateTime), N'213a49f2-71cf-4d9e-8301-a8c4afb44c63', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Attendes] OFF
SET IDENTITY_INSERT [dbo].[AttendesEvents] ON 

INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (80, 1, 3)
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (87, 1, 1)
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (93, 1, 5)
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (97, 60, 3)
INSERT [dbo].[AttendesEvents] ([ID], [AttendesID], [EventID]) VALUES (99, 58, 3)
SET IDENTITY_INSERT [dbo].[AttendesEvents] OFF
SET IDENTITY_INSERT [dbo].[BookMark] ON 

INSERT [dbo].[BookMark] ([ID], [ActivityID], [AttendesID]) VALUES (22, 91, 58)
INSERT [dbo].[BookMark] ([ID], [ActivityID], [AttendesID]) VALUES (30, 24, 60)
SET IDENTITY_INSERT [dbo].[BookMark] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([ID], [SupportEmail], [isActive], [Subject], [EmailBody], [ScreenTitle]) VALUES (1, N'developer2.hrsts@gmail.com', NULL, N'You Can Create Email Body By Default', N'Hello Galactic Team I forgot My password Please Help', N'Forget Password')
SET IDENTITY_INSERT [dbo].[Config] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (1, 1, 191, N'Galactic Celebration', N'<div><big style=""><big style=""><big style=""><b>Welcome </b><span style="font-size: 27.648px;"><b>Attendees</b></span><b>!</b></big></big></big><br></div><div><br></div><div>We hope you enjoy ,.~`?/!@#$%^^&amp;*()our program. <font face="arial, sans-serif" color="#666666"><span style="background-color: rgb(255, 255, 255);"><b style=""><font size="2">let''</font><font size="2">s</font></b></span></font>edit d<span style="font-size: 13.3333px;">escription</span>&nbsp;to test formatting in app thanks</div><div><br></div><div>Thank you <br></div>', 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'4ccca878-f55a-4b58-87c9-1037ceeeedcf.png', 1, 1, N'Playa Conchal - Costa Rica', N'Galactic', CAST(N'2018-06-06T00:00:00.000' AS DateTime), CAST(N'2018-06-10T00:00:00.000' AS DateTime), N'https://test.galacticps.com/reg/2018/AppTest/GalacticCelebration/', N'Activity', N'QR', N'Attendees', N'Floor Maps', N'Photo', N'Sponsor', N'Google MAp', N'Social Platform', N'Search', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (2, 1, 192, N'Mobile App Test Program2', N'<div><b>Rewards Platinum Attendees,</b></div><div><br></div><p>Welcome to Jackson Hole!<br>We are very pleased to have you here with us as we enjoy our successes.<br>We could not have done it without you! Over the next several days we will be<br>surrounded with camaraderie and laughter, memories and elegance, as we relish<br>in private dinner events and one in a lifetime excursions.&nbsp;<br>We thank you for all your dedication over the years and hope<br>this is an experience you will not soon forget.</p>', 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'5dca27b3-e3f4-4cf8-9e94-43414bf18b70.png', 1, 1, NULL, N'Galactic', CAST(N'2018-08-15T00:00:00.000' AS DateTime), CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (3, 1, 500, N'Fresh Adventures', N'<p class="MsoNormal"><b>Fresh Adventures Attendees,</b></p>

<p class="MsoNormal">Welcome to Cancun!<span style="mso-spacerun:yes">&nbsp;
</span>We are very pleased to have you here with us as we enjoy our successes.
We could not have done it without you! Over the next several days we will be
surrounded with camaraderie and laughter, memories and elegance, as we relish
in private dinner events and one in a lifetime excursions. </p>

<p class="MsoNormal">We thank you for all your dedication over the years and hope
this is an experience you won’t soon forget. <br></p><div align="center"><br></div>

<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="371">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin-top:0in;
	mso-para-margin-right:0in;
	mso-para-margin-bottom:8.0pt;
	mso-para-margin-left:0in;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->', 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'fc9d2355-a4eb-462b-9739-a85e2053b7c3.png', 1, 1, N'Cancun - MEXICO', N'Core Mark Kentucky', CAST(N'2018-12-05T00:00:00.000' AS DateTime), CAST(N'2018-12-09T00:00:00.000' AS DateTime), N'https://test.galacticps.com/reg/2018/cmky', N'Activity', N'Scan Code', N'Attendee', N'Floor Directions', N'Pictures', N'Our Sponsors', N'Map', N'Social Platform', N'Search', -86.8515279, 21.161908, 1, N'Our Speakers', 1, N'Our Exhibitors', 1, N'Our Vendors', NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (4, NULL, 123, N'Demo', N'hello<img src="https://www.gstatic.com/webp/gallery3/1.sm.png">', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'287d700a-cfc5-4aa4-85ca-1cc23dc74ad2.png', 0, 0, N'Park Avenue, Shahrah-e-Faisal Road, Karachi, Pakistan', NULL, NULL, NULL, NULL, N'Activity', N'QR Code', N'Attendee', N'Floor Map', N'Photos', N'Sponsors', N'Maps', N'Social Screen', N'Search Screen', 67.070380800000066, 24.861044199999991, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (5, NULL, 501, N'Dealer Sales Incentive', N';lk;l', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'Paris - France', N'Kubota Tractor Corporation', CAST(N'2019-03-05T00:00:00.000' AS DateTime), CAST(N'2019-03-11T00:00:00.000' AS DateTime), N'https://test.galacticps.com/reg/2018/kubotaparis/', N'Activity', N'QR Code', N'Attendee', N'Floor Map', N'Photos', N'Sponsors', N'Maps', N'Social Screen', N'Search Screen', 2.35222190000002, 48.856614, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (6, NULL, 503, N'Adventures in Aruba', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (7, NULL, 506, N'Demo Event', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[Event] ([ID], [ModeratePost], [GalacticEventId], [EventName], [Message], [ManagerUserId], [EnableThemes], [EnableActivity], [EnableQrCode], [EnableAttendees], [EnableFloormap], [EnablePhotos], [EnableSponsor], [EnableComments], [EnableGoogleApi], [allow_bookmark], [EventImage], [EnableSocialScreen], [EnableSearchScreen], [Destination], [ClientName], [StartDate], [EndDate], [WebURL], [ActivityTitle], [QrCodeTitle], [AttendeeTitle], [FloormapTitle], [PhotosTitle], [SponsorTitle], [MapTitle], [SocialTitle], [SearchTitle], [longitude], [latitude], [EnableSpeaker], [SpeakerTitle], [EnableExhibitor], [ExhibitorTitle], [EnableVendor], [VendorTitle], [GoogleFolderID], [GoogleAlbumphotoUrl], [EnableChatscreen]) VALUES (8, 1, 1021, N'My Event', N'Hello I create this event', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, NULL, NULL, NULL, NULL, NULL, N'Activity', N'QR Code', N'Attendee', N'Floor Map', N'Photos', N'Sponsors', N'Maps', N'Social Screen', N'Search Screen', 0, 0, 0, N'Speakers', 0, N'Exhibitors', 0, N'Vendors', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[Exhibitors] ON 

INSERT [dbo].[Exhibitors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (1, N'Exhibitor Description', N'8a5aae64-f309-4905-9b0d-52dbd2c69342.png', N'https://www.hersheys.com/en_us/home.html', 0, N'Exhibitor2', 1)
INSERT [dbo].[Exhibitors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (2, N'Descrioptiom', N'4863035a-58b1-4e13-a64e-97ed19a61633.png', NULL, 0, N'Exhibitor1', 1)
INSERT [dbo].[Exhibitors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (3, N'<b><i><u>Exhibitor 3</u></i></b>', N'5b2b235f-ac2a-4409-913d-abad675446df.png', N'https://www.hersheys.com/en_us/home.html', 0, N'Exhibitor 3', 2)
SET IDENTITY_INSERT [dbo].[Exhibitors] OFF
SET IDENTITY_INSERT [dbo].[ExhibitorsEvents] ON 

INSERT [dbo].[ExhibitorsEvents] ([ID], [ExhibitorsID], [EventID]) VALUES (1, 2, 3)
INSERT [dbo].[ExhibitorsEvents] ([ID], [ExhibitorsID], [EventID]) VALUES (2, 3, 1)
INSERT [dbo].[ExhibitorsEvents] ([ID], [ExhibitorsID], [EventID]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[ExhibitorsEvents] OFF
SET IDENTITY_INSERT [dbo].[FloorMapping] ON 

INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (27, 1, N'8a5954ef-7da5-4342-861e-aabcfe3146d2.png', 440, 698, N'floormap8')
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (28, 2, N'1705f2a5-7307-4593-9d25-accba39f7a67.png', 835, 1250, N'floormap7')
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (30, 1, N'66528620-aa22-45bd-bf3d-fd1d45e0309a.png', 215, 215, N'floormap5')
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (31, 2, N'74051745-72bd-491d-9d5b-a1723db3b005.png', 71, 60, N'floormap4')
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (34, 3, N'795a65ae-f26d-4fff-888f-ddfcde5d1a23.png', 326, 640, N'floormap1')
INSERT [dbo].[FloorMapping] ([ID], [EventID], [PhotoURL], [PhotoHeight], [PhotoWidth], [FloorName]) VALUES (37, 3, N'1984870e-3ee5-43c7-9eba-9626b2da387f.png', 1200, 622, N'Demo FM')
SET IDENTITY_INSERT [dbo].[FloorMapping] OFF
SET IDENTITY_INSERT [dbo].[FloorRegionMapping] ON 

INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (6, 2, 28, N'asssd', CAST(244.000 AS Decimal(16, 3)), CAST(192.000 AS Decimal(16, 3)), CAST(229.00 AS Decimal(16, 2)), CAST(123.00 AS Decimal(16, 2)), N'#31a3dd')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (1009, 1, 27, N'Upper', CAST(90.000 AS Decimal(16, 3)), CAST(46.000 AS Decimal(16, 3)), CAST(63.00 AS Decimal(16, 2)), CAST(29.00 AS Decimal(16, 2)), N'#e71919')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (1010, 1, 30, N'dfsfsdf', CAST(47.000 AS Decimal(16, 3)), CAST(45.000 AS Decimal(16, 3)), CAST(108.00 AS Decimal(16, 2)), CAST(68.00 AS Decimal(16, 2)), N'#000000')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (1012, 1, 27, NULL, CAST(14.000 AS Decimal(16, 3)), CAST(9.000 AS Decimal(16, 3)), CAST(201.00 AS Decimal(16, 2)), CAST(206.00 AS Decimal(16, 2)), N'#000000')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (1013, 1, 27, N'fdgfdg', CAST(5.000 AS Decimal(16, 3)), CAST(9.000 AS Decimal(16, 3)), CAST(204.00 AS Decimal(16, 2)), CAST(206.00 AS Decimal(16, 2)), N'#000000')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (1014, 1, 30, N'fsdfsdf', CAST(14.000 AS Decimal(16, 3)), CAST(0.000 AS Decimal(16, 3)), CAST(201.00 AS Decimal(16, 2)), CAST(215.00 AS Decimal(16, 2)), N'#000000')
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (2035, 3, 37, N'hello', CAST(365.000 AS Decimal(16, 3)), CAST(162.888 AS Decimal(16, 3)), NULL, NULL, NULL)
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (2057, 3, 34, N'hello', CAST(59.000 AS Decimal(16, 3)), CAST(164.000 AS Decimal(16, 3)), NULL, NULL, NULL)
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (2058, 3, 34, N'demo1', CAST(501.000 AS Decimal(16, 3)), CAST(198.000 AS Decimal(16, 3)), NULL, NULL, NULL)
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (2059, 3, 34, N'felelle', CAST(349.000 AS Decimal(16, 3)), CAST(200.000 AS Decimal(16, 3)), NULL, NULL, NULL)
INSERT [dbo].[FloorRegionMapping] ([ID], [EventID], [FMid], [Description], [X], [Y], [Width], [height], [Regioncolor]) VALUES (2060, 3, 34, N'del', CAST(209.000 AS Decimal(16, 3)), CAST(195.000 AS Decimal(16, 3)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FloorRegionMapping] OFF
SET IDENTITY_INSERT [dbo].[ForumSocialComments] ON 

INSERT [dbo].[ForumSocialComments] ([ID], [PostID], [AttendesID], [Comments], [ApprovedON], [ApprovedBY], [CommentedON], [ReplyerID]) VALUES (2, 58, 60, N'abc', NULL, NULL, NULL, NULL)
INSERT [dbo].[ForumSocialComments] ([ID], [PostID], [AttendesID], [Comments], [ApprovedON], [ApprovedBY], [CommentedON], [ReplyerID]) VALUES (3, 58, 60, N'ffgg', NULL, NULL, CAST(N'2019-01-30T21:55:22.273' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ForumSocialComments] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (46, 3, N'96e496fc-0312-4702-ab62-1b541e9e1351.png', CAST(N'2019-01-15T17:31:30.170' AS DateTime), 14, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (47, 3, N'6cc5a0de-9599-4410-8316-dc393a1a5032.png', CAST(N'2019-01-15T17:31:21.003' AS DateTime), 14, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (48, 3, N'8b4d490c-77e6-4715-aa40-19409a9e217b.png', CAST(N'2019-01-15T17:31:23.367' AS DateTime), 14, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (49, 3, N'2ea67c37-7688-4179-9f05-1eef4ee2ba07.png', CAST(N'2019-01-15T17:31:23.363' AS DateTime), 14, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (51, 6, N'6011db54-ea35-436c-a6b4-1d0641f426c4.png', CAST(N'2019-01-15T17:45:37.417' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (52, 6, N'845343d3-4c28-4154-acf8-dd03ed35259e.png', CAST(N'2019-01-15T17:45:38.597' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (53, 6, N'99e7a485-8105-41ef-88fb-e352a5b7370d.png', CAST(N'2019-01-15T17:50:05.137' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (54, 6, N'fc236fa7-76a8-46e8-928c-703acbf5e94f.png', CAST(N'2019-01-15T17:51:05.093' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (55, 6, N'87d0aedd-a2b4-4227-8ba8-3b23eebf8ab2.png', CAST(N'2019-01-15T18:02:52.150' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (56, 3, N'0551862a-ecc9-4845-a9fa-718acb7f59e9.jpg', CAST(N'2019-01-25T16:41:33.287' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (57, 3, N'4c580c87-e406-475d-95c4-90f38d2b75bf.jpg', CAST(N'2019-01-25T16:41:33.290' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (60, 3, N'044717d2-7dbd-4bb2-9b9c-997ae1f104ad.png', CAST(N'2019-01-30T16:00:47.167' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (61, 3, N'8a7c57ef-1e82-4d61-a3f1-992115508611.png', CAST(N'2019-01-30T16:00:47.830' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (62, 3, N'ea4470fc-7820-4ebf-af88-1a46b4cf23e1.png', CAST(N'2019-01-30T21:51:23.610' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (63, 3, N'60f7c106-62b7-4473-b7e1-9edb444d153c.png', CAST(N'2019-01-31T15:52:52.823' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (64, 3, N'b17c8728-95fc-44f4-a30c-d84b60ed1168.png', CAST(N'2019-01-31T15:52:53.547' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (65, 3, N'7d94bf7e-6baf-4673-832e-b09c1d2d8ac8.png', CAST(N'2019-01-31T23:08:39.960' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (66, 3, N'eeed22b9-4dbf-41a3-84c4-60a55c2f3668.png', CAST(N'2019-01-31T23:08:42.073' AS DateTime), 60, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (67, 3, N'15a9877c-8a06-467f-97a2-7c452a49f83a.png', CAST(N'2019-03-15T19:39:01.327' AS DateTime), 14, N'', 0, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (68, 1, N'48f8d0d4-9cf1-462a-8b23-407fa18dc1d7.png', CAST(N'2019-03-15T19:44:37.077' AS DateTime), 14, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (69, 3, N'fba7dda1-b5b7-4e55-a34b-a345f3bc4da1.png', CAST(N'2019-04-19T20:13:37.860' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (70, 3, N'd4ee27d6-b885-4e84-8e44-62eca20d91a3.png', CAST(N'2019-04-19T20:13:37.863' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (71, 3, N'70693d7d-2df0-4225-88c2-f9320f282f9e.png', CAST(N'2019-04-19T20:13:37.863' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (72, 3, N'd903c671-ae86-4320-82a6-c7c4b0d9d55f.png', CAST(N'2019-04-19T20:13:37.867' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (73, 3, N'8041cb10-7a31-4968-8f67-01484393ab4f.png', CAST(N'2019-04-19T20:16:52.147' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (74, 3, N'8d496648-5122-4fcc-9281-364949c149e8.png', CAST(N'2019-04-19T20:16:52.153' AS DateTime), 60, N'', 1, 1)
INSERT [dbo].[Photos] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [Status], [isSync]) VALUES (75, 3, N'a672fa88-bfdc-40fd-bafe-3bd4bdb72e63.png', CAST(N'2019-04-19T20:16:52.157' AS DateTime), 60, N'', 1, 1)
SET IDENTITY_INSERT [dbo].[Photos] OFF
SET IDENTITY_INSERT [dbo].[PostType] ON 

INSERT [dbo].[PostType] ([ID], [Name]) VALUES (1, N'Photo')
INSERT [dbo].[PostType] ([ID], [Name]) VALUES (2, N'Text')
INSERT [dbo].[PostType] ([ID], [Name]) VALUES (3, N'Link')
INSERT [dbo].[PostType] ([ID], [Name]) VALUES (4, N'Video')
SET IDENTITY_INSERT [dbo].[PostType] OFF
SET IDENTITY_INSERT [dbo].[PostUserLike] ON 

INSERT [dbo].[PostUserLike] ([ID], [PostID], [AttendesID]) VALUES (44, 65, 60)
SET IDENTITY_INSERT [dbo].[PostUserLike] OFF
SET IDENTITY_INSERT [dbo].[QRCode] ON 

INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (17, NULL, N'', NULL, N'http://localhost:56877/Events/Create/4', CAST(N'2018-08-02T02:14:51.090' AS DateTime), 14, 1, N'2911e7ce-542e-46dd-afd5-91c02682e83d.png', 1)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (18, NULL, N'', NULL, N'http://localhost:56877/sponsors/Create', CAST(N'2018-08-02T02:14:52.303' AS DateTime), 14, 1, N'1d908a59-e4eb-44ba-b0c1-55a4e8348a58.png', 2)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (21, NULL, N'', NULL, N'https://www.hersheys.com/en_us/home.html', CAST(N'2018-08-09T14:17:29.703' AS DateTime), 14, 1, N'9c18b4ea-c27f-4b16-974d-285a8c2013d8.png', 3)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (24, 3, N'hello', NULL, N'http://localhost:56877/events/Create/1#QrCode', CAST(N'2018-09-24T23:57:05.617' AS DateTime), 14, 1, N'7637e3be-f304-4011-bc64-fadac8596c42.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (25, 1, N'', 67, N'', CAST(N'2018-10-03T03:58:44.710' AS DateTime), 14, 1, N'eee5654b-75e7-41cd-928c-1a5c89fd3777.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (26, 2, N'', 16, N'', CAST(N'2018-10-03T03:59:42.763' AS DateTime), 14, 1, N'38f07119-38d4-47eb-aaad-984c1d33fd06.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (27, 1, N'', 66, N'', CAST(N'2018-10-05T08:15:20.127' AS DateTime), 14, 1, N'ac4b4405-20ea-44e2-ba64-6d33fc2fb93d.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (28, 3, N'', 25, N'', CAST(N'2018-10-30T05:12:36.983' AS DateTime), 14, 1, N'123ec2e5-6a8d-4887-8633-b5fa52685f6a.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (29, 1, N'', 71, N'', CAST(N'2018-11-22T12:41:09.740' AS DateTime), 14, 1, N'1540fb4b-c967-4add-b9f1-9dfc1a09189c.png', NULL)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (30, NULL, N'', NULL, N'', CAST(N'2019-01-25T15:55:47.697' AS DateTime), 14, 1, N'6bba391c-1b72-4799-9eb2-c9b03956f58f.png', 5)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (31, NULL, N'', NULL, N'', CAST(N'2019-01-25T15:55:55.033' AS DateTime), 14, 1, N'5ed429d6-14aa-4d97-8029-ddd5ed9dc76f.png', 4)
INSERT [dbo].[QRCode] ([ID], [EventID], [Description], [AtivitityID], [WebURL], [GeneratedON], [GeneratedBY], [Status], [CodePath], [SponsorID]) VALUES (32, 3, N'', 24, N'', CAST(N'2019-01-31T15:21:37.643' AS DateTime), 14, 1, N'a34c3349-2fa1-4d3e-ba3f-598f350fea01.png', NULL)
SET IDENTITY_INSERT [dbo].[QRCode] OFF
SET IDENTITY_INSERT [dbo].[QRHistory] ON 

INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (28, 25, 58, CAST(N'2018-10-03T03:58:56.857' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (29, 26, 58, CAST(N'2018-10-03T04:00:09.403' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (30, 26, 58, CAST(N'2018-10-03T04:01:45.627' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (31, 26, 58, CAST(N'2018-10-03T04:02:21.090' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (32, 24, 58, CAST(N'2018-10-30T05:12:26.620' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (33, 28, 58, CAST(N'2018-10-30T05:12:46.827' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (34, 28, 58, CAST(N'2018-10-30T05:12:54.883' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (35, 27, 58, CAST(N'2018-11-03T05:28:47.787' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (36, 27, 58, CAST(N'2018-11-03T05:28:59.147' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (37, 27, 58, CAST(N'2018-11-22T12:36:06.510' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (38, 27, 58, CAST(N'2018-11-22T12:36:20.970' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (39, 27, 58, CAST(N'2018-11-22T12:40:46.353' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (40, 29, 58, CAST(N'2018-11-22T12:41:19.477' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (41, 28, 58, CAST(N'2018-11-22T14:41:16.053' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (42, 28, 60, CAST(N'2018-12-14T18:40:28.903' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (43, 24, 60, CAST(N'2019-01-31T15:21:27.720' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (44, 24, 60, CAST(N'2019-01-31T15:22:01.830' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (45, 28, 60, CAST(N'2019-01-31T15:22:18.303' AS DateTime))
INSERT [dbo].[QRHistory] ([ID], [QRid], [AttendesID], [CommentON]) VALUES (46, 28, 60, CAST(N'2019-01-31T15:22:29.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[QRHistory] OFF
SET IDENTITY_INSERT [dbo].[SocialForum] ON 

INSERT [dbo].[SocialForum] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [PostTypeid], [ApprovedON], [ApprovedBY], [Status], [TotalLikes], [AttendesID], [DeleteRequest], [CreatedDate]) VALUES (58, 3, N'071ae6d6-5a34-4aab-a57d-eb919066194c.png', CAST(N'2018-10-31T04:40:34.510' AS DateTime), NULL, N'picture', 1, NULL, NULL, 1, NULL, 60, 1, NULL)
INSERT [dbo].[SocialForum] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [PostTypeid], [ApprovedON], [ApprovedBY], [Status], [TotalLikes], [AttendesID], [DeleteRequest], [CreatedDate]) VALUES (65, 3, NULL, CAST(N'2019-01-30T16:03:33.327' AS DateTime), NULL, N'http://www.google.com', 3, NULL, NULL, 1, NULL, 60, 0, NULL)
INSERT [dbo].[SocialForum] ([ID], [EventID], [URL], [UploadON], [UploadBY], [Description], [PostTypeid], [ApprovedON], [ApprovedBY], [Status], [TotalLikes], [AttendesID], [DeleteRequest], [CreatedDate]) VALUES (76, 3, NULL, CAST(N'2019-03-19T16:54:19.783' AS DateTime), NULL, N'hello world
', 2, NULL, NULL, 1, NULL, 60, 0, NULL)
SET IDENTITY_INSERT [dbo].[SocialForum] OFF
SET IDENTITY_INSERT [dbo].[Speakers ] ON 

INSERT [dbo].[Speakers ] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (9, N'dsfsdfd', N'24cdbe53-8c19-4215-af7f-3b7193df9601.png', N'https://www.hersheys.com/en_us/home.html', 0, N'dfsfsd', 2)
INSERT [dbo].[Speakers ] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (18, N'dfsd', N'6a60910c-07d7-407e-aef9-d0c3f6d39cb4.png', N'https://www.hersheys.com/en_us/home.html', 0, N'waqar', 1)
INSERT [dbo].[Speakers ] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (19, N'Ahmed', N'2a6f5599-fec5-4960-9246-bf2324e16447.png', NULL, 0, N'Sameerr', 1)
INSERT [dbo].[Speakers ] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (20, N'<b><i><u>Speaker 4</u></i></b>', N'12f00a9a-15bb-4d50-98b2-c003f7792fbd.png', N'https://www.hersheys.com/en_us/home.html', 0, N'Speaker 4', 1)
SET IDENTITY_INSERT [dbo].[Speakers ] OFF
SET IDENTITY_INSERT [dbo].[SpeakersEvents] ON 

INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (5, 18, 3)
INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (6, 19, 3)
INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (7, 20, 1)
INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (8, 20, 3)
INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (9, 20, 7)
INSERT [dbo].[SpeakersEvents] ([ID], [SpeakerID], [EventID]) VALUES (10, 9, 2)
SET IDENTITY_INSERT [dbo].[SpeakersEvents] OFF
SET IDENTITY_INSERT [dbo].[Sponsors] ON 

INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (1, N'Golf at the Four Seasons Costa Rica', N'0dbce8c6-91ab-42da-a309-8865878568ca.png', N'http://localhost:56877/Events/Create/4', 1, N'Sponser 11', 1)
INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (2, N'hello', N'5289ffc3-60d5-4675-a1d1-b730acb74020.png', N'http://localhost:56877/sponsors/Create', 1, N'Waqar', 1)
INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (3, N'<h1><b>CROSSMARK’s unique model of growth drivers connects and leverages cross-functional disciplines to </b></h1>', N'd9fd6e84-e258-4958-98c0-6a21b653dbc9.png', N'https://www.hersheys.com/en_us/home.html', 0, N'<h2 style="text-align: center;"><b>Crossmark</b></h2>', 2)
INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (4, N'The foundation for Jack Link''s began in the 1880s when jack''s great-grandfather, Chris, came to America from the old country and settled in the wilderness of northern Wisconsin. He didn''t bring much with him, but he did bring his family''s sausage recipes. Soon his sausages and smoked meats became legend among the pioneer families.', N'979436b9-8874-4deb-aa73-f8e66e2abc1a.png', NULL, 0, N'Jack Links', 1)
INSERT [dbo].[Sponsors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (5, N'Simple Ingredients. Delicious Taste. Our commitment to Simple starts at the source. Hershey uses simple ingredients to create the Hershey’s Milk Chocolate you love.', N'208cff1c-9954-4fa1-8641-cc054782c1bf.png', NULL, 0, N'Hershey', 1)
SET IDENTITY_INSERT [dbo].[Sponsors] OFF
SET IDENTITY_INSERT [dbo].[SponsorsEvents] ON 

INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (15, 2, 2)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (17, 4, 1)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (18, 5, 1)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (19, 3, 1)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (20, 2, 1)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (21, 1, 3)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (22, 2, 3)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (23, 3, 3)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (24, 4, 3)
INSERT [dbo].[SponsorsEvents] ([ID], [SponsorID], [EventID]) VALUES (25, 5, 3)
SET IDENTITY_INSERT [dbo].[SponsorsEvents] OFF
SET IDENTITY_INSERT [dbo].[Theme] ON 

INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (18, 2, N'', NULL, NULL, N'#000000', N'#000000', N'#000000', N'#000000', NULL)
INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (23, 1, N'7f098cd2-4b18-4518-9f1c-ed58f80c2e18.png', N'', N'', N'#ed1c1c', N'#000000', N'#000000', N'#000000', NULL)
INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (26, 3, N'bde252bc-abd1-46b3-bccb-0f5e9c8be9bd.png', N'', N'', N'#ee1313', N'#8b1c1c', N'#dc2121', N'#8b1212', NULL)
INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (27, 4, N'0719f640-ffc2-4da1-84df-5bf84b141dd6.png', NULL, NULL, N'#31a3dd', N'#ffffff', N'#ec0c0c', N'#342020', NULL)
INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (28, 5, NULL, NULL, NULL, N'#31a3dd', N'#ffffff', N'#000000', N'#000000', NULL)
INSERT [dbo].[Theme] ([ID], [EventID], [SplashScreemURL], [AppBackgroundURL], [ButtonURL], [ButtonBackgroundColor], [ButtonForegroundColor], [LabelForegroundColor], [HeadingForegroundColor], [Message]) VALUES (29, 8, NULL, NULL, NULL, N'#31a3dd', N'#ffffff', N'#000000', N'#000000', NULL)
SET IDENTITY_INSERT [dbo].[Theme] OFF
SET IDENTITY_INSERT [dbo].[UserPackageType] ON 

INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (1, N'Golden', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (2, N'silver', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (1002, N'ww', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (1003, N'ww', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (1004, N'dasdsad', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
INSERT [dbo].[UserPackageType] ([ID], [Name], [iconimage]) VALUES (1005, N'dasdsad', N'd5993fc3-bd91-4e8d-a40c-a81565eb8cf3.png')
SET IDENTITY_INSERT [dbo].[UserPackageType] OFF
SET IDENTITY_INSERT [dbo].[UserSession] ON 

INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (1612, N'f561a740964d4a1591f5bb5b38ec6ef3', N'Web', 14, NULL, CAST(N'2018-10-25T09:12:39.520' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (1702, N'47d3d8e3adfb44b2aec68f33be935743', N'Web', 14, NULL, CAST(N'2018-11-03T04:59:11.497' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (1703, N'524f1ca8818948668633dfb629b12d4e', N'Web', 14, NULL, CAST(N'2018-11-03T05:07:37.403' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (4302, N'8be7056ae44248e9b8ba39b499b7efc3', N'Web', 14, NULL, CAST(N'2019-01-21T13:58:18.070' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (4339, N'55c4f40af9af4c0d9aa47dcd48f62f86', N'Web', 14, NULL, CAST(N'2019-01-30T18:54:13.047' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (4340, N'2b6f1673ac314cbab66e1e2ba22c071e', N'Web', 14, NULL, CAST(N'2019-01-30T18:54:13.047' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (4341, N'f6bde4ef8f184ae091daf5265bfb8d3e', N'Web', 14, NULL, CAST(N'2019-01-30T18:54:46.760' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (4354, N'11951ad3b4574532968ab62e38d04700', N'Web', 14, NULL, CAST(N'2019-01-31T13:40:17.163' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6402, N'61791e3eceb343bd90211882c4b4036f', N'Web', 15, NULL, CAST(N'2019-02-20T17:49:27.623' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6403, N'8120d2e5b3ca48ccbe0387cacaf0ed57', N'Web', 14, NULL, CAST(N'2019-02-20T17:51:54.380' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6404, N'6b513fc2367449eab021cd8dd9a8dec7', N'Web', 16, NULL, CAST(N'2019-02-20T17:52:21.337' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6405, N'746f5e356c1e49739a4071aa7b400453', N'Web', 15, NULL, CAST(N'2019-02-20T17:53:23.617' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6406, N'7179891993d342999f88a7fa9e63ac03', N'Web', 15, NULL, CAST(N'2019-02-20T18:24:32.857' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6407, N'ef524c2530d44e8d83df43f6832df52f', N'Web', 14, NULL, CAST(N'2019-02-20T19:06:14.940' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6408, N'4c190eddaee54188b8074eb7993b3944', N'Web', 15, NULL, CAST(N'2019-02-20T19:09:58.300' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6409, N'76f6ed0482814c1ca87c14d662f1f898', N'Web', 14, NULL, CAST(N'2019-02-20T19:58:53.487' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6410, N'a99be7ab437c4b32bcce0975cfc65f2b', N'Web', 15, NULL, CAST(N'2019-02-23T01:07:08.887' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6411, N'34798cf8dafb4692bc43e27f5ff127b1', N'Web', 14, NULL, CAST(N'2019-02-23T01:20:10.047' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6412, N'df5db89afdaf42bb9644923d5473399b', N'Web', 14, NULL, CAST(N'2019-02-23T01:30:05.253' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6413, N'a996c6687b55439eb37eea1de29cd129', N'Web', 15, NULL, CAST(N'2019-02-23T01:30:26.203' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6414, N'd083101ac90041a0aa2d83ef57bbf0c9', N'Web', 15, NULL, CAST(N'2019-02-23T01:32:37.320' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (6415, N'5bd778dac128472c960003e6bd1a6457', N'Web', 16, NULL, CAST(N'2019-02-23T01:33:47.467' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7422, N'692c0c95f74645c09b1908b4049457f2', N'Web', 14, NULL, CAST(N'2019-03-07T12:23:10.920' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7423, N'a561506255084a3c83389cce626ddf5f', N'Web', 14, NULL, CAST(N'2019-03-07T16:11:28.073' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7437, N'219567109fcc43f794bad947f0d8da55', N'Web', 15, NULL, CAST(N'2019-03-12T17:49:50.837' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7438, N'bfb740b0a16040a6902e9e6f9f1efbbd', N'Web', 15, NULL, CAST(N'2019-03-12T18:12:00.393' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7439, N'84df81673af340b58ba212ec2b68cc5a', N'Web', 15, NULL, CAST(N'2019-03-12T18:20:56.817' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7440, N'f825e431dc0c4eedab7560fbacead78c', N'Web', 14, NULL, CAST(N'2019-03-12T18:21:43.920' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7441, N'70a763da0fb743a2977a7483552ea101', N'Web', 14, NULL, CAST(N'2019-03-12T18:22:00.127' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7442, N'3b6e4960abe945599b69c8a7858124fb', N'Web', 14, NULL, CAST(N'2019-03-12T18:22:27.293' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7443, N'dc8758da1bfa4a82be12afca160ca75a', N'Web', 14, NULL, CAST(N'2019-03-12T18:25:42.293' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7444, N'a4538840a4c144ebab54f423b0f917e3', N'Web', 15, NULL, CAST(N'2019-03-12T18:33:49.137' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7445, N'2e3363cd3cc34e519b0767b448eaceaf', N'Web', 15, NULL, CAST(N'2019-03-12T18:34:16.250' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7446, N'e914dd9e2efc42d38f2cf32260cf6cf3', N'Web', 14, NULL, CAST(N'2019-03-15T19:38:20.900' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7447, N'0eabb4adb95f4097b94d175e034ec2be', N'Web', 14, NULL, CAST(N'2019-03-18T12:46:15.843' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7451, N'5d1cdddcbd0a42518b08e7913bb6f3fc', N'Web', 14, NULL, CAST(N'2019-03-18T21:31:29.707' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7474, N'5bab6ff3b9c84a8695ac2fa91179febb', N'Web', 14, NULL, CAST(N'2019-03-19T21:08:27.590' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7529, N'ef42c6cbbf2949f0bf82d30445f9c4d2', N'Web', 14, NULL, CAST(N'2019-04-02T14:28:55.500' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7563, N'5b3777b3c391432eaf3ed4ea00ddcae9', N'Android', NULL, 60, CAST(N'2019-04-03T15:41:53.673' AS DateTime), 0, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7564, N'e9fef0056b9341048699cdadc30ef8a9', N'Android', NULL, 60, CAST(N'2019-04-03T15:42:48.093' AS DateTime), 0, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7565, N'96cd7ee892fd4f78be333b68387ae739', N'Android', NULL, 60, CAST(N'2019-04-03T15:44:34.283' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7566, N'26dd933d4c5049fdb9e2746644095b08', N'Android', NULL, 60, CAST(N'2019-04-03T15:44:58.890' AS DateTime), 1, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7567, N'9800f96209424dbe8f2c450f8bdb06a7', N'Android', NULL, 60, CAST(N'2019-04-03T15:50:36.843' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7568, N'ecc2907dfadb48b5a49aae15c51ddcf3', N'Android', NULL, 60, CAST(N'2019-04-03T16:19:37.107' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7569, N'ad2659445c654f3f956d2627449be638', N'Android', NULL, 60, CAST(N'2019-04-03T16:27:42.067' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7570, N'3c9d645b91f745f19c6650d763b5ecc4', N'Android', NULL, 60, CAST(N'2019-04-03T16:37:00.317' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7571, N'82e442acaa94445596a74bdcdde4c2f1', N'Android', NULL, 60, CAST(N'2019-04-03T16:56:35.513' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7572, N'cfa364ccb85f4c34a75b0233b553dccc', N'Android', NULL, 60, CAST(N'2019-04-03T17:03:51.960' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7573, N'6b9ee4b18eac49a3a9ae26aa0309d3b0', N'Android', NULL, 60, CAST(N'2019-04-03T17:09:09.787' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7574, N'c8701b53ec764f378ea628100ea73c7a', N'Android', NULL, 60, CAST(N'2019-04-03T17:18:26.670' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7575, N'fdc38744100340a491f7d5f21964dbf0', N'Android', NULL, 60, CAST(N'2019-04-03T17:25:49.973' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7576, N'258c5dfc4a9844168a8e15d4a8cc495e', N'Android', NULL, 60, CAST(N'2019-04-03T17:28:39.957' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7577, N'c27141276db642a3a54abc6661d69775', N'Android', NULL, 60, CAST(N'2019-04-03T17:32:35.293' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7578, N'23a3572fe28047ffa3f2fd39630d0560', N'Android', NULL, 60, CAST(N'2019-04-03T18:07:54.037' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7579, N'4f155788c9364108929245ff2f6c0094', N'Android', NULL, 60, CAST(N'2019-04-03T18:15:21.290' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7580, N'99b9c2f9cc444c5d96bc938a795a7782', N'Android', NULL, 60, CAST(N'2019-04-03T18:16:33.073' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7581, N'aa7170858e3d4122ad1ab243b85ec41f', N'Android', NULL, 60, CAST(N'2019-04-04T13:10:44.527' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7582, N'73fa2b24d532421f960a805636ea6d18', N'Android', NULL, 60, CAST(N'2019-04-04T13:25:15.790' AS DateTime), 0, N'cNX13F2JtDQ:APA91bEH3N_IVnXFRJEUmdRhRxADg0Y_zDZK11z7lfMu2oACYNEY3jPStEWKKOx30p_GpK9RUZ13oEjKJ2UNU-wkHfd5CUrElIX3S5QZlhtmFZeXhlbDvREReMbQOZjDeyheZAfDbKf7')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7583, N'6daa82705f1b4de5b1b2b357d26c2edd', N'Android', NULL, 60, CAST(N'2019-04-04T13:37:36.873' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7584, N'd5ee58c95e444c1ba0d1b065ed536de9', N'Android', NULL, 60, CAST(N'2019-04-04T13:47:24.630' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7585, N'94fbeba710a040b18c259c63a4230631', N'Android', NULL, 60, CAST(N'2019-04-04T14:06:15.267' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7586, N'361a392a90fb400680e21d0a8bd8d3ff', N'Android', NULL, 60, CAST(N'2019-04-04T14:11:03.200' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7587, N'ae9ea8a1f28545698ea0cd65dd7c3dab', N'Android', NULL, 60, CAST(N'2019-04-04T14:14:14.707' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7588, N'9b35944a956e4d73a107b60b1d533c17', N'Android', NULL, 60, CAST(N'2019-04-04T14:14:56.213' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7589, N'7e4827310cf5432fbe942b31fbd98e55', N'Android', NULL, 60, CAST(N'2019-04-04T14:21:01.497' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7590, N'9a8ae318649c402586c918eaa9e8e996', N'Android', NULL, 60, CAST(N'2019-04-04T14:25:18.657' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7591, N'4f311622b7cb4d838df8405e73ce6976', N'Android', NULL, 60, CAST(N'2019-04-04T16:18:14.497' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7592, N'99f45d85ffb64080b10c056895946c8d', N'Android', NULL, 60, CAST(N'2019-04-04T16:22:51.783' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7593, N'6ca3f62449f5453b937b42ad24e8bb83', N'Android', NULL, 60, CAST(N'2019-04-04T16:39:10.440' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7594, N'b6a64c81a7e747e7bff7481e5cc7b38b', N'Android', NULL, 60, CAST(N'2019-04-04T16:44:29.683' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7595, N'7f9046a313734b299beb7b094a1e7a39', N'Android', NULL, 60, CAST(N'2019-04-04T17:06:04.583' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7596, N'6b42ed21cc564051b03520eb2a2d2e84', N'Android', NULL, 60, CAST(N'2019-04-04T17:14:35.237' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7597, N'dc274f40e03542b29d8b4c5d76d1aee6', N'Android', NULL, 60, CAST(N'2019-04-04T17:25:28.433' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7598, N'1f11a76ddaf542e380ddda1ec7d215cc', N'Android', NULL, 60, CAST(N'2019-04-04T17:29:36.797' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7599, N'9edd28032f5a41158efd444e48cd2397', N'Android', NULL, 60, CAST(N'2019-04-04T17:41:22.700' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7600, N'e8b725a8aee447559e97d66866a62a39', N'Android', NULL, 60, CAST(N'2019-04-05T15:19:47.447' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7601, N'7c5510ef9da94fd0a793e31cb455da10', N'Android', NULL, 60, CAST(N'2019-04-05T15:35:40.373' AS DateTime), 0, N'eFMmHiXGS8M:APA91bGBT5WfQnEkE2C5DxSPerq9-cAbL0iAG89BGuW5R_kBDjuO2p49ZAw421xuC9fXtjUlEn4IuofzeGQOVsqTiiOpdQ2b28-5i0M0lGHW74jZf-pMwJ6UiatuiANNTdCLfL5puQxc')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7602, N'8ce84fe9a90d43eabb36c2232fd70b0b', N'Android', NULL, 60, CAST(N'2019-04-05T15:46:01.797' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7603, N'8aff2f357fc04a148c3fc7fcd0e2c8d3', N'Android', NULL, 60, CAST(N'2019-04-05T15:50:59.817' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7604, N'db9a4a2140d4484aa5b4be013d3584c3', N'Android', NULL, 60, CAST(N'2019-04-05T15:59:23.897' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7605, N'ea902f77ba5f40d1b40f2734a6ebed47', N'Android', NULL, 60, CAST(N'2019-04-05T16:07:08.067' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7606, N'97564fb39e3a4fd3b90b9af4a35f84bb', N'Android', NULL, 60, CAST(N'2019-04-05T16:18:27.717' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7607, N'02532254ed38462a922ac73d3e786ea8', N'Android', NULL, 60, CAST(N'2019-04-05T16:23:18.763' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7608, N'7bdbcc7cf2e94a2f941080767154aa45', N'Android', NULL, 60, CAST(N'2019-04-05T16:27:11.337' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7609, N'b3ea1b4a643f43f09707647daec05c23', N'Android', NULL, 60, CAST(N'2019-04-05T16:33:09.307' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7610, N'0511b8a7404e4190a2e0b68045ef6524', N'Android', NULL, 60, CAST(N'2019-04-05T16:36:33.677' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7611, N'd68577d94d214159b7ef8366f6fb0e4c', N'Android', NULL, 60, CAST(N'2019-04-05T16:44:06.910' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7612, N'83b66a29ce284d959e12d8aba305cb86', N'Android', NULL, 60, CAST(N'2019-04-05T17:00:48.773' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7613, N'5db54dbde2c24e14a670296685bbe688', N'Android', NULL, 60, CAST(N'2019-04-05T17:26:54.727' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7614, N'3de4f7ba230c44d18612d225c73adc21', N'Android', NULL, 60, CAST(N'2019-04-05T17:38:15.270' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7615, N'2b4f52596efe4b308b08312ed82e9db6', N'Android', NULL, 60, CAST(N'2019-04-05T17:51:28.977' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7616, N'6773843653b94d45a025250e53cef04d', N'Android', NULL, 60, CAST(N'2019-04-05T17:58:32.347' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7617, N'5524276e496447beaba698b621b23cb2', N'Android', NULL, 60, CAST(N'2019-04-05T18:09:35.780' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7618, N'ade2978b9d3843bd90320e1a38624dc9', N'Android', NULL, 60, CAST(N'2019-04-05T18:22:11.637' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7619, N'268ef21775624dfd9c0642a8355a54d8', N'Android', NULL, 60, CAST(N'2019-04-05T18:31:55.540' AS DateTime), 0, N'eyq4nL_VfWM:APA91bHKtephE8WWTtDIjQG-kpUKYsOFy5_Ua_u2L0qt_s0C3sonjPySeaTk-JH3_LuTYtcBVUM7Zj6qz8gpuvIISylmKciJaHuok_cxIA5OFq3zQL-0Gbw-96skvY9mjj71XEeMCI3o')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7620, N'ae2c30f8bd4144c2af6f0ed5911ff6d0', N'Android', NULL, 60, CAST(N'2019-04-05T18:39:43.770' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7621, N'015081bd380546ec9bf98756277af1f4', N'Android', NULL, 60, CAST(N'2019-04-05T18:47:00.840' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7622, N'af4db5dc72f8482698ee51a485d34782', N'Android', NULL, 60, CAST(N'2019-04-05T18:52:48.150' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7623, N'334713e77419426b97feec307bb1e525', N'Android', NULL, 60, CAST(N'2019-04-05T19:04:03.047' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7624, N'4b4f5cf2199346f2af412e8f9a02e769', N'Android', NULL, 60, CAST(N'2019-04-05T19:11:59.243' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7625, N'9ca14dfd908544f0bf6ea4df22191267', N'Android', NULL, 60, CAST(N'2019-04-05T19:41:52.083' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7626, N'2875bc887c2e4898a028b0c7fe345b9d', N'Android', NULL, 60, CAST(N'2019-04-05T20:22:24.160' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (7627, N'caa01acc2f164058a808336b90905664', N'Android', NULL, 60, CAST(N'2019-04-08T14:56:38.693' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8627, N'a0bee6cff7814c028659ed2c62d5e1f4', N'Web', 14, NULL, CAST(N'2019-04-08T15:38:31.163' AS DateTime), 1, NULL)
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8628, N'92d1159acf274798b9c48def4c30ccad', N'Android', NULL, 60, CAST(N'2019-04-08T15:45:26.457' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8629, N'3a1ea1e6e9c646acade7c8aea76c1fa9', N'Android', NULL, 60, CAST(N'2019-04-08T15:49:28.177' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8630, N'2575f19c5e584e0daac4d2ba508fb7b7', N'Android', NULL, 60, CAST(N'2019-04-08T15:59:56.513' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8631, N'e1418c0996fc4fdbb1734bd1f7717df7', N'Android', NULL, 60, CAST(N'2019-04-08T16:04:31.780' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8632, N'eccc15304de24372b63ad16a73bd6afd', N'Android', NULL, 60, CAST(N'2019-04-08T16:09:03.380' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8633, N'59c561658c5642478143fb15765f0098', N'Android', NULL, 60, CAST(N'2019-04-08T16:12:11.260' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8634, N'80eaa08eae1248c6bfa6ccce03eacda7', N'Android', NULL, 60, CAST(N'2019-04-08T16:31:48.710' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8635, N'4cfb02312b274f1a8d1f35b9a844d1c0', N'Android', NULL, 60, CAST(N'2019-04-08T16:50:53.670' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8636, N'da7c4dc8a5cd42f8807ca93c007477a2', N'Android', NULL, 60, CAST(N'2019-04-08T16:52:44.110' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8637, N'816a544ccc3b415f86a68f8672a07aee', N'Android', NULL, 60, CAST(N'2019-04-08T17:02:31.650' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8638, N'65caf4bf40ea48dd9773adcff49b1189', N'Android', NULL, 60, CAST(N'2019-04-08T17:03:09.647' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8639, N'2783d01071104de5931a4af97c558395', N'Android', NULL, 60, CAST(N'2019-04-08T17:07:56.003' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8640, N'c31d3077c50b4dd59d027cfa55890faf', N'Android', NULL, 60, CAST(N'2019-04-10T14:26:09.173' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8641, N'b89db6d382284d7d8a0a1ba5b27b5308', N'Android', NULL, 60, CAST(N'2019-04-10T14:29:48.547' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8642, N'509c908373984ef9b87e4e30d221d93e', N'Android', NULL, 60, CAST(N'2019-04-10T14:41:12.797' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8643, N'0c89e47c269745e0877435a774ff4a82', N'Android', NULL, 60, CAST(N'2019-04-10T14:48:50.280' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8644, N'b5d915509fdd44c59c3f74e6007adfd5', N'Android', NULL, 60, CAST(N'2019-04-10T14:54:13.697' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8645, N'6a0adb610479445ea99eff9e36c5a706', N'Android', NULL, 60, CAST(N'2019-04-10T15:19:14.273' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8646, N'd71e59c4470549a2918c3e0d04512c9a', N'Android', NULL, 60, CAST(N'2019-04-10T15:29:37.230' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8647, N'9fb20d9f68984d458ea670f08551f725', N'Android', NULL, 60, CAST(N'2019-04-10T15:36:29.570' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8648, N'07a814d24edf47469603607b095ba8d7', N'Android', NULL, 60, CAST(N'2019-04-12T15:35:58.973' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8649, N'b1f79d4d777b4336b557c5c1707d4078', N'Android', NULL, 60, CAST(N'2019-04-12T15:38:18.840' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8650, N'31d9449673634eff9606243fbe027bb3', N'Android', NULL, 60, CAST(N'2019-04-12T15:58:04.387' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8651, N'd0c0224fbd2b43d08d6072428e760290', N'Android', NULL, 60, CAST(N'2019-04-12T16:04:42.710' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8652, N'8bdb6fb975524645a27ef2fd93954f5a', N'Android', NULL, 60, CAST(N'2019-04-12T16:26:21.150' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8653, N'6c3082f67a9b404186f1c916bde73012', N'Android', NULL, 60, CAST(N'2019-04-12T16:44:15.847' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8654, N'fd8c32f8ceda4c2898fe75b657b0ccca', N'Android', NULL, 60, CAST(N'2019-04-12T17:00:45.253' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8655, N'f1192ff256bd4275b9580fe5265370a8', N'Android', NULL, 60, CAST(N'2019-04-12T17:48:41.087' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8656, N'ac192d8730484a5bbdd4adb9af92eba6', N'Android', NULL, 60, CAST(N'2019-04-12T18:07:26.797' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8657, N'a3603f5de9a947f3a71d91d158b4b88e', N'Android', NULL, 60, CAST(N'2019-04-12T18:15:01.177' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8658, N'5997ec881414412aaafda1ae7ee88c6b', N'Android', NULL, 60, CAST(N'2019-04-12T18:18:24.100' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8659, N'f3b0de0fa27d4d5bab0317b7b98a1f61', N'Android', NULL, 60, CAST(N'2019-04-12T18:26:56.437' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8660, N'618a734d1d9e432882727ee4fb7cdd11', N'Android', NULL, 60, CAST(N'2019-04-12T18:30:07.297' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8661, N'848edd17ae75423ebd208dd5c87605cd', N'Android', NULL, 60, CAST(N'2019-04-12T18:40:05.247' AS DateTime), 0, N'eCOpqABUUdo:APA91bETYn8gN9GROYqnDNM4fxVBTbHWaljPNlnXycniP9BgizuQnhfAIucJM7ZiwpYOGyTCp5B_ZW9_j_OpJlxOy-8wavQbtEYio2JT2et9GUC-fV6KLQHYbLFwKUFVyKJUYar3cvFF')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8662, N'4619a201f09f4c2098f2fb746e6c6173', N'Android', NULL, 60, CAST(N'2019-04-12T19:51:10.467' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8663, N'b1b21378659643e1ad5260f109bc7be1', N'Android', NULL, 60, CAST(N'2019-04-12T19:56:01.907' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8664, N'cef11098f04c4ddf9e0a26ab775b0ebf', N'Android', NULL, 60, CAST(N'2019-04-12T19:59:02.097' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8665, N'acb84692e2c54a5cb6bdbe20f6a27c1a', N'Android', NULL, 60, CAST(N'2019-04-15T16:35:07.057' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8666, N'953fd53e61cc44828843c046978e15c0', N'Android', NULL, 60, CAST(N'2019-04-15T16:49:36.307' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8667, N'bb3a01a91659480cb87768a8b78b8188', N'Android', NULL, 60, CAST(N'2019-04-15T16:57:18.813' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8668, N'13bf047b84544d649186427ee62e7ba6', N'Android', NULL, 60, CAST(N'2019-04-15T17:12:19.130' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8669, N'69d1d7b0ca36457c9a21f2ac42761c61', N'Android', NULL, 60, CAST(N'2019-04-15T17:17:37.220' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8670, N'1df68ba9a1824ac0b6e3e5acea91ea2b', N'Android', NULL, 60, CAST(N'2019-04-15T17:40:20.787' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8671, N'73b03d1dcaac43f4b88b704d53f2b456', N'Android', NULL, 60, CAST(N'2019-04-15T18:36:48.290' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8672, N'067e1ebba3164a5eb728ca6465f89ff7', N'Android', NULL, 60, CAST(N'2019-04-15T18:46:52.617' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8673, N'dcf6b235fbaf49998755db035c2cb924', N'Android', NULL, 60, CAST(N'2019-04-15T18:52:32.217' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8674, N'83745e57c8d94ad186a63eefac5b62a2', N'Android', NULL, 60, CAST(N'2019-04-15T18:56:37.050' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8675, N'332c27375e934a24ad632bf894feab0a', N'Android', NULL, 60, CAST(N'2019-04-15T19:04:22.987' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8676, N'1f747e5a933b490788e01140a4ac67cb', N'Android', NULL, 60, CAST(N'2019-04-15T19:09:40.007' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8677, N'9fe6edc579e64e2faeec9375d27c17f6', N'Android', NULL, 60, CAST(N'2019-04-15T19:15:19.933' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8678, N'f39e76f13646417ba620256f483c2daf', N'Android', NULL, 60, CAST(N'2019-04-15T19:20:50.167' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8679, N'2c220665f87941a7acdc3dbed76d84ca', N'Android', NULL, 60, CAST(N'2019-04-15T19:26:34.363' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8680, N'd2a891485825421485867f89030eff3b', N'Android', NULL, 60, CAST(N'2019-04-15T19:30:56.563' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8681, N'd8e25e2b712f4588a7630719e9b3495c', N'Android', NULL, 60, CAST(N'2019-04-15T19:38:40.423' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8682, N'c56c99931426446db5fbf2a6f7ed7c29', N'Android', NULL, 60, CAST(N'2019-04-15T19:44:15.183' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8683, N'bf52cf0fec6845fd884087f1b3fd7ed0', N'Android', NULL, 60, CAST(N'2019-04-15T19:50:33.427' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8684, N'f6ba52aee7664fbd88b590fef377cd8c', N'Android', NULL, 60, CAST(N'2019-04-15T19:56:36.550' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8685, N'c304cbd559ea442fb3e5afc0e0666158', N'Android', NULL, 60, CAST(N'2019-04-15T20:04:40.393' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8686, N'dfc5f27f78c44c9ea3c2a195880514c8', N'Android', NULL, 60, CAST(N'2019-04-15T20:13:04.183' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8687, N'6420ab9999744d9c98f63b4eaecf4b19', N'Android', NULL, 60, CAST(N'2019-04-15T20:24:17.470' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8688, N'4444211c38dd40eb9bf4c219e5719fab', N'Android', NULL, 60, CAST(N'2019-04-15T20:25:33.253' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8689, N'd41c5fdfbfb743208c88173ca64341f4', N'Android', NULL, 60, CAST(N'2019-04-15T20:35:27.627' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8690, N'6c599ca86c254358b16aa6ba844b406c', N'Android', NULL, 60, CAST(N'2019-04-15T20:45:09.430' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8691, N'b9149497fef24b1a913d8562f702da96', N'Android', NULL, 60, CAST(N'2019-04-15T20:50:59.567' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8692, N'3ab45babf04440e58cf8eb540ca515e2', N'Android', NULL, 60, CAST(N'2019-04-15T21:01:18.943' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8693, N'5a984b9784444e4cad75a741051f3139', N'Android', NULL, 60, CAST(N'2019-04-15T21:06:36.020' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8694, N'8d26da5bda124127accfd2f5ac2a3fd7', N'Android', NULL, 60, CAST(N'2019-04-15T21:14:11.957' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8695, N'd9e57b9c1ca34d2fb6c17a21211634dd', N'Android', NULL, 60, CAST(N'2019-04-15T21:17:51.247' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8696, N'0b8d92773d894a2d8a2711a053435e12', N'Android', NULL, 60, CAST(N'2019-04-15T21:23:14.830' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8697, N'4885edafbeaa4ba3a7101712640bf681', N'Android', NULL, 60, CAST(N'2019-04-16T13:42:38.027' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8698, N'0499b87a9dc744f38eb7385d446366f1', N'Android', NULL, 60, CAST(N'2019-04-16T13:48:19.647' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8699, N'f8c82a3b044c4511bcc25648827bd904', N'Android', NULL, 60, CAST(N'2019-04-16T14:01:22.763' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8700, N'7811ddb5c19348fa97667a9b8b2a2c65', N'Android', NULL, 60, CAST(N'2019-04-16T14:06:14.357' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8701, N'6654e78698c14e818827a32c76c65491', N'Android', NULL, 60, CAST(N'2019-04-16T15:01:57.557' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8702, N'f1767ecf95774672ad4c9607b46c9be8', N'Android', NULL, 60, CAST(N'2019-04-16T15:07:15.140' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8703, N'b670a8e15503495c84eb3f1c0fc78715', N'Android', NULL, 60, CAST(N'2019-04-16T15:11:06.723' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8704, N'e3fa3dceb41447f7b762c5515b90b85c', N'Android', NULL, 60, CAST(N'2019-04-16T16:18:54.667' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8705, N'dac1e8c812cf42cb9066badb4a7d1d16', N'Android', NULL, 60, CAST(N'2019-04-16T16:22:22.377' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8706, N'caf971eedb874ecdb09a1b7136f1802f', N'Android', NULL, 60, CAST(N'2019-04-16T17:05:30.570' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8707, N'54617d587e2f40c18601c56ecdd4c12c', N'Android', NULL, 60, CAST(N'2019-04-16T18:17:13.840' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8708, N'8aa685071c2a40928a583de6eb1eb6d0', N'Android', NULL, 60, CAST(N'2019-04-16T18:42:54.800' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8709, N'9909c25fb8664774a043e1dc01009572', N'Android', NULL, 60, CAST(N'2019-04-16T18:44:08.217' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8710, N'67a38d0c077441dcb919a6c31f418d93', N'Android', NULL, 60, CAST(N'2019-04-16T18:49:47.797' AS DateTime), 0, N'fgsEAgHLQjI:APA91bEZ0gHj2RrbcgG6j-xm_-cKi_VX3aH95RTX6AJkLH46O2p8EL1BfBi2_ATxsg3H1IG_qaCAZlq465G8SRUvFse19gQPcgYGv7LInM8p1o2LuksCWCc5bI78kxDaxtcGOLAYgZf_')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8711, N'3270c93356454f66ba0cd8f4b331b7ab', N'Android', NULL, 60, CAST(N'2019-04-16T18:52:41.217' AS DateTime), 0, N'fgsEAgHLQjI:APA91bEZ0gHj2RrbcgG6j-xm_-cKi_VX3aH95RTX6AJkLH46O2p8EL1BfBi2_ATxsg3H1IG_qaCAZlq465G8SRUvFse19gQPcgYGv7LInM8p1o2LuksCWCc5bI78kxDaxtcGOLAYgZf_')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8712, N'e582f3dceb4340418ec9d2d74e9da850', N'Android', NULL, 60, CAST(N'2019-04-16T18:57:52.560' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8713, N'39a4bf26d2574f7c90ccb2fe025c582c', N'Android', NULL, 60, CAST(N'2019-04-16T19:13:59.070' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8714, N'56dc0189b22f411d97893fdd6123a5c4', N'Android', NULL, 60, CAST(N'2019-04-16T19:14:45.017' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8715, N'9300bce06d4f469c8fb4bed56723234a', N'Android', NULL, 60, CAST(N'2019-04-16T19:18:43.703' AS DateTime), 0, N'fgsEAgHLQjI:APA91bEZ0gHj2RrbcgG6j-xm_-cKi_VX3aH95RTX6AJkLH46O2p8EL1BfBi2_ATxsg3H1IG_qaCAZlq465G8SRUvFse19gQPcgYGv7LInM8p1o2LuksCWCc5bI78kxDaxtcGOLAYgZf_')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8716, N'296a924f1775455dae37599e18e362df', N'Android', NULL, 60, CAST(N'2019-04-16T19:20:17.697' AS DateTime), 0, N'fgsEAgHLQjI:APA91bEZ0gHj2RrbcgG6j-xm_-cKi_VX3aH95RTX6AJkLH46O2p8EL1BfBi2_ATxsg3H1IG_qaCAZlq465G8SRUvFse19gQPcgYGv7LInM8p1o2LuksCWCc5bI78kxDaxtcGOLAYgZf_')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8717, N'e5bcc3e14f074f2ab8524ba1d3be6fc7', N'Android', NULL, 60, CAST(N'2019-04-16T19:29:53.773' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8718, N'acb9b6dc9d1a466bac7e55496203ef12', N'Android', NULL, 60, CAST(N'2019-04-16T19:32:29.523' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8719, N'2003360e97f44f30a8ec6313c3edaaf3', N'Android', NULL, 60, CAST(N'2019-04-16T19:57:45.860' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8720, N'65863548fb484e2bb312bccbbaddd3f2', N'Android', NULL, 60, CAST(N'2019-04-17T13:39:54.977' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8721, N'5bcac0f68783480898a5a493b778d226', N'Android', NULL, 60, CAST(N'2019-04-17T13:46:27.670' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8722, N'8af1ea9adf684b929fe83c9c3c0350c7', N'Android', NULL, 60, CAST(N'2019-04-17T13:53:48.773' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8723, N'acab52f2b8c349978ab780e5cf5e8e98', N'Android', NULL, 60, CAST(N'2019-04-17T14:02:15.410' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8724, N'e945c5a040624040bf04dafa344d05d9', N'Android', NULL, 60, CAST(N'2019-04-17T14:10:07.557' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8725, N'622b191f82214302a0baa9e6bd6d54f9', N'Android', NULL, 60, CAST(N'2019-04-17T14:16:04.817' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8726, N'574a6101a50e4213927f129d4554da8a', N'Android', NULL, 60, CAST(N'2019-04-17T14:18:43.867' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8727, N'cf9e8a20367542f2b3aa5de922432b8f', N'Android', NULL, 60, CAST(N'2019-04-17T14:26:48.763' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8728, N'c45313ebbb6b4c6d90acf615f57c07c1', N'Android', NULL, 60, CAST(N'2019-04-17T14:28:07.950' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8729, N'72906228b11345ce8ca2dcf84a283c20', N'Android', NULL, 60, CAST(N'2019-04-17T14:37:55.707' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8730, N'54c68be37e1a45bcb0b09508132acd39', N'Android', NULL, 60, CAST(N'2019-04-17T14:49:53.227' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8731, N'a59b4c020d564600a5f8731ca8b47ff6', N'Android', NULL, 60, CAST(N'2019-04-17T15:49:37.933' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8732, N'fee286b241384314aa799e4108fd1337', N'Android', NULL, 60, CAST(N'2019-04-17T16:01:32.767' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8733, N'e0490fefbe634cefbed4834721786309', N'Android', NULL, 60, CAST(N'2019-04-17T16:03:04.117' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8734, N'09f8ee80a7f84e3cacf39c315aef9e15', N'Android', NULL, 60, CAST(N'2019-04-17T16:11:45.370' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8735, N'522af291feef42e58aa090f1ba543b35', N'Android', NULL, 60, CAST(N'2019-04-17T16:23:29.907' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8736, N'c057fda147394a838b15b97806ecdfaf', N'Android', NULL, 60, CAST(N'2019-04-17T16:24:57.410' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8737, N'7b1a35b54b8c46cca40d9281db1a1f1a', N'Android', NULL, 60, CAST(N'2019-04-17T16:26:11.647' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8738, N'b910fbf603fc4b8abe462c0093ebb1c1', N'Android', NULL, 60, CAST(N'2019-04-17T16:53:13.300' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8739, N'72c35aab56334f0986749ba5be1ea574', N'Android', NULL, 60, CAST(N'2019-04-17T16:59:39.887' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8740, N'19d43950493e4903b64aca958ac37631', N'Android', NULL, 60, CAST(N'2019-04-17T17:08:43.700' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8741, N'38103d061af5419fab5b48770de0879d', N'Android', NULL, 60, CAST(N'2019-04-17T17:15:03.490' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8742, N'e8d462c14c274647afe938d850d66f17', N'Android', NULL, 60, CAST(N'2019-04-17T17:21:10.617' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8743, N'c9d06342fe79419dad828c37555caefd', N'Android', NULL, 60, CAST(N'2019-04-17T17:22:46.437' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8744, N'8bb36f39557847e1b0504264b0a1238c', N'Android', NULL, 60, CAST(N'2019-04-17T17:24:19.997' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8745, N'cdf5561caaee4b8aa8d10d0c7e9866ec', N'Android', NULL, 60, CAST(N'2019-04-17T17:25:15.143' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8746, N'4b8f0511b1c640e4a8b87d88a45ac0f2', N'Android', NULL, 60, CAST(N'2019-04-17T17:29:14.967' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8747, N'5ab9203a64a74ef2a0feba813ab23258', N'Android', NULL, 60, CAST(N'2019-04-17T17:30:06.153' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8748, N'7f6272239f6e43d2a023d6ccb345ab91', N'Android', NULL, 60, CAST(N'2019-04-17T17:30:28.303' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8749, N'6ccd7f3c046746e5a5e204c5b7389b71', N'Android', NULL, 60, CAST(N'2019-04-17T17:35:20.250' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8750, N'acaef768dc7043cc9d98b646df1e2dcc', N'Android', NULL, 60, CAST(N'2019-04-17T17:36:16.077' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8751, N'2c25dc06d32a47f8b49c25a5c4cb7f19', N'Android', NULL, 60, CAST(N'2019-04-17T17:39:09.027' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8752, N'fdd7eab3a5754322bb9ec5c8e79404b5', N'Android', NULL, 60, CAST(N'2019-04-17T17:53:04.870' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8753, N'81f9a9d21d7b451e973f1ce8305fccb1', N'Android', NULL, 60, CAST(N'2019-04-17T18:52:12.320' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8754, N'b468c071c8774e32b56afdffe3048e89', N'Android', NULL, 60, CAST(N'2019-04-17T18:55:10.597' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8755, N'79d8efd5d3f442e8819356a0f83ab104', N'Android', NULL, 60, CAST(N'2019-04-17T19:15:47.680' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8756, N'fcf4ee5da9724f02b7246e07c6a653ba', N'Android', NULL, 60, CAST(N'2019-04-17T19:15:52.403' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8757, N'cafd44d3d7d34e769846e7581e16b702', N'Android', NULL, 60, CAST(N'2019-04-17T19:20:12.390' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8758, N'2b6f9d156558486a93288150e7cb2464', N'Android', NULL, 60, CAST(N'2019-04-17T19:35:41.690' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8759, N'279040ad5a674463bb93bf1df1c5c63a', N'Android', NULL, 60, CAST(N'2019-04-17T19:39:00.223' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8760, N'b9d9a349d9684dceb8001744fcaef2e4', N'Android', NULL, 60, CAST(N'2019-04-17T19:48:46.670' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8761, N'f3ee597a134f4358b4a3a7b09db03c5b', N'Android', NULL, 60, CAST(N'2019-04-17T19:53:42.487' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8762, N'bdebdf44505440078fcb6b25460075b1', N'Android', NULL, 60, CAST(N'2019-04-17T20:25:18.917' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8763, N'89194632db98467f8ff6b4ff57403fb8', N'Android', NULL, 60, CAST(N'2019-04-17T20:28:35.150' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8764, N'8fe9142cacd34c3b84602d23e19bdc88', N'Android', NULL, 60, CAST(N'2019-04-17T20:46:18.143' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8765, N'74a3075b56904746b0eabab4ee3875e9', N'Android', NULL, 60, CAST(N'2019-04-17T21:02:06.110' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8766, N'00097e147b9947ae95be15c5e07d8880', N'Android', NULL, 60, CAST(N'2019-04-17T21:12:02.423' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8767, N'3f0414c2fe974f59b7e16d18d02c0f06', N'Android', NULL, 60, CAST(N'2019-04-17T21:17:21.243' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8768, N'49369165ac8243198d39f77f1b07e0e0', N'Android', NULL, 60, CAST(N'2019-04-17T21:19:46.580' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8769, N'7b2660bcfc174323a8f9843d61bf67c5', N'Android', NULL, 60, CAST(N'2019-04-18T13:34:07.840' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8770, N'995d2e51f4b5450785ae7219b604c5b1', N'Android', NULL, 60, CAST(N'2019-04-18T13:39:56.640' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8771, N'b4721085aa214ad2b49d714419d8ff21', N'Android', NULL, 60, CAST(N'2019-04-18T15:14:15.553' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8772, N'acd983634abf46bb9f1c1e018c5bc248', N'Android', NULL, 60, CAST(N'2019-04-18T15:43:54.017' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8773, N'03614084a9a74269ae1190e4b4f0a1ca', N'Android', NULL, 60, CAST(N'2019-04-18T16:08:02.167' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8774, N'3dd6290d75904f77ab8d29a3c3a7a8a0', N'Android', NULL, 60, CAST(N'2019-04-18T16:12:30.953' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8775, N'31e3058aa55f4fc596933ee8cfe33213', N'Android', NULL, 60, CAST(N'2019-04-18T16:22:38.677' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8776, N'a477972fed8d4b8b9aedf3e18d158117', N'Android', NULL, 60, CAST(N'2019-04-18T16:29:58.517' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8777, N'4cb52f57253842bfa6c04bacc41f72d1', N'Android', NULL, 60, CAST(N'2019-04-18T16:56:27.420' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8778, N'502892575f3a479eb18d8b83c3471414', N'Android', NULL, 60, CAST(N'2019-04-18T17:03:13.463' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8779, N'd715a104937e4638893d32602b0dd0a5', N'Android', NULL, 60, CAST(N'2019-04-18T17:14:20.097' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8780, N'fbfa3f09e4714595b57fb30b533da1d8', N'Android', NULL, 60, CAST(N'2019-04-18T17:21:31.203' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8781, N'c99cd90141b74807bb05a6eaa4f86a4c', N'Android', NULL, 60, CAST(N'2019-04-18T17:25:13.887' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8782, N'56df6e4cbcf04e61a8863e6f76f8b0bf', N'Android', NULL, 60, CAST(N'2019-04-18T17:33:56.170' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8783, N'f76f372743a64ff590cbb06add26908f', N'Android', NULL, 60, CAST(N'2019-04-18T17:41:27.580' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8784, N'833b6f02c77849aa8215fa62184cbc84', N'Android', NULL, 60, CAST(N'2019-04-18T17:53:32.320' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8785, N'f07efbc8aee04b5089c365010189d83f', N'Android', NULL, 60, CAST(N'2019-04-18T17:58:19.800' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8786, N'83ff1953815f481a999e7a94359732be', N'Android', NULL, 60, CAST(N'2019-04-18T18:05:31.407' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8787, N'4c6b7b0367384cc1bfa7216145cc112b', N'Android', NULL, 60, CAST(N'2019-04-18T18:11:46.240' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8788, N'4b57311a69294a628e948dbe131c4e8b', N'Android', NULL, 60, CAST(N'2019-04-18T18:21:45.320' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8789, N'31d9029117884cc5b3f8e9529fd9e47d', N'Android', NULL, 60, CAST(N'2019-04-18T18:26:32.623' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8790, N'7d6d2c5c21924230b3c243837ec307ab', N'Android', NULL, 60, CAST(N'2019-04-18T18:37:24.583' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8791, N'fb7c63e47ca34edea43f0e88eab502b8', N'Android', NULL, 60, CAST(N'2019-04-18T18:46:50.693' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8792, N'b0d7d153ad3f47cbada21a9a0fd7a34e', N'Android', NULL, 60, CAST(N'2019-04-19T13:13:33.330' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8793, N'45b98e9986e34672ae25b648c9f07cf0', N'Android', NULL, 60, CAST(N'2019-04-19T15:08:51.700' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8794, N'63230176983c415f92771c4a1029b0f6', N'Android', NULL, 60, CAST(N'2019-04-19T15:16:44.443' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8795, N'142076d58d6b4326bcfc7f702f724261', N'Android', NULL, 60, CAST(N'2019-04-19T15:19:20.963' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8796, N'c6ff9a35ac144dc5940732fe39a7d8e2', N'Android', NULL, 60, CAST(N'2019-04-19T15:22:24.270' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8797, N'd834fd195b16400d85e5dc0edbc69a11', N'Android', NULL, 60, CAST(N'2019-04-19T15:29:06.627' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8798, N'adb69061990140c5bcd0b3dccfe69121', N'Android', NULL, 60, CAST(N'2019-04-19T15:33:24.117' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8799, N'f116c49ca69e4d549440ba3b52431e13', N'Android', NULL, 60, CAST(N'2019-04-19T15:41:14.907' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8800, N'70122a6ba3b34e87b784f33b80387033', N'Android', NULL, 60, CAST(N'2019-04-19T15:47:34.737' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8801, N'07cf6665454b4b6cb42e6c60546d2b20', N'Android', NULL, 60, CAST(N'2019-04-19T15:51:02.890' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8802, N'27aa3ca061314264a92bbb06437de5ec', N'Android', NULL, 60, CAST(N'2019-04-19T15:57:04.593' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8803, N'f31fcd2712dc4186bbb63c14dd4246ab', N'Android', NULL, 60, CAST(N'2019-04-19T16:35:58.500' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8804, N'11718813a624498da53b5771e50453bb', N'Android', NULL, 60, CAST(N'2019-04-19T16:35:58.500' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8805, N'31d5d3df07d940fdba91ceaf64a7fe31', N'Android', NULL, 60, CAST(N'2019-04-19T16:35:58.510' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8806, N'4e04afdcd6d34601a6b2397e8204550c', N'Android', NULL, 60, CAST(N'2019-04-19T16:35:58.547' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (8807, N'edab2e69ab484e4a98144ac84e244e16', N'Android', NULL, 60, CAST(N'2019-04-19T16:35:58.790' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9800, N'63f9ba337d03401880414c56eb99949e', N'Android', NULL, 60, CAST(N'2019-04-19T16:46:26.537' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9801, N'44a1d01888ec4970b2e3d03390bf365c', N'Android', NULL, 60, CAST(N'2019-04-19T17:06:48.673' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9802, N'bb8bdce30ae64a65920c2354709fc441', N'Android', NULL, 60, CAST(N'2019-04-19T17:06:49.197' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9803, N'71fc9830f8254e3caeb2f44ff65d2f5f', N'Android', NULL, 60, CAST(N'2019-04-19T17:06:49.727' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9804, N'6b461cbac3d743dc926f58f45dac1082', N'Android', NULL, 60, CAST(N'2019-04-19T17:12:38.027' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9805, N'818149089e704e7abf1e0e7fd79ad7fe', N'Android', NULL, 60, CAST(N'2019-04-19T17:41:37.600' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9806, N'0c38017fcf21458f88e8b9ca93450683', N'Android', NULL, 60, CAST(N'2019-04-19T17:47:08.193' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9807, N'fd8b9c439f10450bb9f2db3782ca4887', N'Android', NULL, 60, CAST(N'2019-04-19T17:50:21.803' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9808, N'a20a6734a7644153aeb27c37f1199c0f', N'Android', NULL, 60, CAST(N'2019-04-19T17:53:58.347' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9809, N'0ade4b2792e44e8aaac73174668586da', N'Android', NULL, 60, CAST(N'2019-04-19T18:01:20.170' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9810, N'4bc4515d5df14084b11f84e37931b514', N'Android', NULL, 60, CAST(N'2019-04-19T18:06:50.627' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9811, N'cac50a3741914b4e80b8a0d68a19f4c8', N'Android', NULL, 60, CAST(N'2019-04-19T18:10:53.270' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9812, N'5212fb3f8c7e467c9f7a4a165b09fe27', N'Android', NULL, 60, CAST(N'2019-04-19T18:18:05.787' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9813, N'446f5f38392d4ac99874a9902f796a61', N'Android', NULL, 60, CAST(N'2019-04-19T18:51:20.483' AS DateTime), 0, N'eCOpqABUUdo:APA91bEJgv67c913wmvcFljNKVug2H9tT9Yc9v3mV8iiRk9qNC2ugF_VL39W-Pv_1i43jRLvtfetaVOHoMcZ8uk5RWC5_SGOdCbYGwWq7khUnB2Hs6wrmbFde9yyi_pgzFIy4iRYKipm')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9814, N'93b6a01b433746a8b68b39d52fc3b03a', N'Android', NULL, 60, CAST(N'2019-04-19T19:02:16.157' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
GO
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9815, N'a300b474548c49be82449c90fad44c91', N'Android', NULL, 60, CAST(N'2019-04-19T19:10:41.460' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9816, N'4d5f91316ddd4d809ddd8eaa3e91a6ac', N'Android', NULL, 60, CAST(N'2019-04-19T19:27:02.350' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9817, N'7ff32053019b48d38d9a2cef812d409b', N'Android', NULL, 60, CAST(N'2019-04-19T19:41:23.790' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9818, N'a2deeffed28e4e9194327e1323944418', N'Android', NULL, 60, CAST(N'2019-04-19T19:54:46.897' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9819, N'3258142d9911475d8b05dfa21aae60a5', N'Android', NULL, 60, CAST(N'2019-04-19T20:03:51.643' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9820, N'8d5cb1ae8a084307939d1db3eb6f6662', N'Android', NULL, 60, CAST(N'2019-04-19T20:08:00.657' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9821, N'0a7ee696f7c042179cb898179d17e54c', N'Android', NULL, 60, CAST(N'2019-04-19T20:11:04.600' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9822, N'dce24c47534c4326bce8e5ba981042ec', N'Android', NULL, 60, CAST(N'2019-04-19T20:16:00.717' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9823, N'56a70276c2f74cd68dd7163c88552e8a', N'Android', NULL, 60, CAST(N'2019-04-19T20:16:00.727' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9824, N'1d269ce5e16740218618c3ad25d80944', N'Android', NULL, 60, CAST(N'2019-04-19T20:16:22.467' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9825, N'0a0fb62f8b6448d2b1cc5049fdd428b4', N'Android', NULL, 60, CAST(N'2019-04-19T20:19:39.157' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9826, N'4dd8f20530454c9c975a79ac48c89073', N'Android', NULL, 60, CAST(N'2019-04-19T20:28:37.273' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9827, N'1352cf56e9e44b0c81df1ad900db94a2', N'Android', NULL, 60, CAST(N'2019-04-19T20:29:00.397' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9828, N'bbed018ad5804b6ebc3d25cad831faa7', N'Android', NULL, 60, CAST(N'2019-04-19T20:31:52.780' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9829, N'a9c3a107e23446d4b5853206aec44521', N'Android', NULL, 60, CAST(N'2019-04-19T20:35:11.337' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9830, N'fdff9f6bfaf34f1697b0098ead78c3e0', N'Android', NULL, 60, CAST(N'2019-04-19T20:48:31.860' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9831, N'94ad6984225247a5a1b2a953a72b225f', N'Android', NULL, 60, CAST(N'2019-04-19T20:52:19.417' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9832, N'086bf0c332494ec68a72c295e65c429e', N'Android', NULL, 60, CAST(N'2019-04-19T21:15:41.243' AS DateTime), 0, N'eCOpqABUUdo:APA91bGhHZtsWAU9WtVSKVRrC0BuJ7oncdAOwCOYTtaOcL1q_kgUN6rbouY78-zi8k_UrjdwkO2yU5GBDJZDreXcboOu9_iQOp5f-OwYcaOiWzKulxjVpI8iuyP6lYu4gXIblWLp7mMd')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9833, N'ea3af435147c4fdaa604fddc323d9d72', N'Android', NULL, 58, CAST(N'2019-05-06T15:49:16.490' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9834, N'86556ef4a78d495a9424e6b87e9553ac', N'Android', NULL, 58, CAST(N'2019-05-06T15:50:17.280' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9835, N'2ce6bbc5c59e469aa7d45f16aa36d781', N'Android', NULL, 58, CAST(N'2019-05-06T15:58:28.843' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9836, N'd2778f74ae3d4c7799358be821999625', N'Android', NULL, 58, CAST(N'2019-05-06T15:58:34.777' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9837, N'7af6baa037a44996809af4e39acf62a1', N'Android', NULL, 58, CAST(N'2019-05-06T16:03:32.130' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9838, N'406f9ee746424670ae28fded59881750', N'Android', NULL, 58, CAST(N'2019-05-06T16:09:27.433' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9839, N'7f90f6a4c5084101b342518652ba91a6', N'Android', NULL, 58, CAST(N'2019-05-06T16:09:57.373' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9840, N'93106dd1fa2d4a30b85e1222a209b98b', N'Android', NULL, 58, CAST(N'2019-05-06T16:10:17.267' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9841, N'11f8c9f4f44d44d890e78c255bb90a43', N'Android', NULL, 58, CAST(N'2019-05-06T16:17:01.183' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9842, N'b8196c67e76a42cc957ec487d76bcd0e', N'Android', NULL, 58, CAST(N'2019-05-06T17:03:08.587' AS DateTime), 1, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9843, N'b32279169f1846e5933b44fe6d0886ab', N'Android', NULL, 58, CAST(N'2019-05-06T17:08:59.863' AS DateTime), 0, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9844, N'4b6add1195834a9e8b69d100496a5eca', N'Android', NULL, 58, CAST(N'2019-05-06T17:10:06.553' AS DateTime), 0, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9845, N'b8ec0c96e5d64726bc4c4a1f522f7dcc', N'Android', NULL, 58, CAST(N'2019-05-06T17:11:17.123' AS DateTime), 0, N'efBiTOXFJaQ:APA91bEDKASkTAKCt9tMr5ntAKTwJ5xjFuu124bHPsjrgIYzotl4_Bg5eloj6MtOydOJ5VWvZ9U2V5_jCugI5h0-lUnS4E7GZmdkv9gxLga97Y2Lc01eYLXunuqfbNLvx_v6231atdx9')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9846, N'4c57a0f66ed045ecbfb0883fb2286e2a', N'Android', NULL, 58, CAST(N'2019-05-06T17:16:23.377' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9847, N'c28a089e1bf14084a7010a8f2e556388', N'Android', NULL, 58, CAST(N'2019-05-06T17:20:33.943' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9848, N'4c095891058645e6918be65a580a5447', N'Android', NULL, 58, CAST(N'2019-05-06T17:26:09.803' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9849, N'b56862418a424f10a4e749e4b67600ec', N'Android', NULL, 58, CAST(N'2019-05-06T17:36:39.630' AS DateTime), 0, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9850, N'2ae7c740801448f59cf16daa0cd7b6e7', N'Android', NULL, 58, CAST(N'2019-05-06T17:43:04.340' AS DateTime), 0, N'e2IpvovuiCQ:APA91bHZF-uugMVJ-OoNlZ-xcK8Rr-z-_19emM6Riz0LjrawZaDnFs0_be_x9KnwOp6-6Uf-_zaogx03upkQMNc88EVYvzBwbBJQFzlbo6EIGd9-n4Dm4vOtme4lIS1_WT4T7sFbL6VK')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9851, N'e569843ecc594f86bbb9da751e9c7bc7', N'Android', NULL, 58, CAST(N'2019-05-06T18:10:34.400' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9852, N'5494c39ec9e54215b39103c8750f18bf', N'Android', NULL, 60, CAST(N'2019-05-06T18:19:24.643' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9853, N'e521cbc2deb24ff2adb695003da8b2da', N'Android', NULL, 58, CAST(N'2019-05-06T18:20:28.550' AS DateTime), 0, N'fdC1XiSLxG8:APA91bEpcrGr6dq9H-7cBNUm_Lvn4BXOCGHfv6-vEkLlDWoMHXV06-OgrBvVMpD_TqjFEMnx1fqRDYILvex-K3DZ0sEnLVHFUkNLqRs2myrChZ_-GqRwwax-dXkTI0WK4438l23UjDli')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9854, N'49a0257c695845149a4a8984fc01b721', N'Android', NULL, 60, CAST(N'2019-05-06T18:22:59.307' AS DateTime), 0, N'eApaINY-gjo:APA91bHAY1AlKcgZRQ9xsyAFUMydB5gXCMQOZZuBe8Kqlt7NeqQMildDqN-fjthYuq7Z7hVJRrOYvTv6z4fNiFOx_ZsUH74BON9qyDOD0d74Z74ZEs0aSBn30TpX6gwHIYaim86pq6mN')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9855, N'7fa11ec41756411c8e1220f39cc89e64', N'Android', NULL, 58, CAST(N'2019-05-06T18:25:24.753' AS DateTime), 0, N'fdC1XiSLxG8:APA91bEpcrGr6dq9H-7cBNUm_Lvn4BXOCGHfv6-vEkLlDWoMHXV06-OgrBvVMpD_TqjFEMnx1fqRDYILvex-K3DZ0sEnLVHFUkNLqRs2myrChZ_-GqRwwax-dXkTI0WK4438l23UjDli')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9856, N'85fa2ef2c40e4bdd98b37e6a4991ea46', N'Android', NULL, 60, CAST(N'2019-05-06T18:30:05.160' AS DateTime), 0, N'eApaINY-gjo:APA91bHAY1AlKcgZRQ9xsyAFUMydB5gXCMQOZZuBe8Kqlt7NeqQMildDqN-fjthYuq7Z7hVJRrOYvTv6z4fNiFOx_ZsUH74BON9qyDOD0d74Z74ZEs0aSBn30TpX6gwHIYaim86pq6mN')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9857, N'873a07cf08ac4ff39d32f874b24ac060', N'Android', NULL, 60, CAST(N'2019-05-06T18:34:42.547' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9858, N'f314f7ba4de244a5aa1d105875441466', N'Android', NULL, 58, CAST(N'2019-05-06T18:35:13.223' AS DateTime), 0, N'fdC1XiSLxG8:APA91bEpcrGr6dq9H-7cBNUm_Lvn4BXOCGHfv6-vEkLlDWoMHXV06-OgrBvVMpD_TqjFEMnx1fqRDYILvex-K3DZ0sEnLVHFUkNLqRs2myrChZ_-GqRwwax-dXkTI0WK4438l23UjDli')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9859, N'84045e56b9d64efb8f5a5fd6cc70e48c', N'Android', NULL, 58, CAST(N'2019-05-06T18:38:57.950' AS DateTime), 1, N'fdC1XiSLxG8:APA91bEpcrGr6dq9H-7cBNUm_Lvn4BXOCGHfv6-vEkLlDWoMHXV06-OgrBvVMpD_TqjFEMnx1fqRDYILvex-K3DZ0sEnLVHFUkNLqRs2myrChZ_-GqRwwax-dXkTI0WK4438l23UjDli')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9860, N'4492ede9b1404014bc5d4ecb5a930953', N'Android', NULL, 58, CAST(N'2019-05-06T18:40:26.760' AS DateTime), 1, N'fdC1XiSLxG8:APA91bEpcrGr6dq9H-7cBNUm_Lvn4BXOCGHfv6-vEkLlDWoMHXV06-OgrBvVMpD_TqjFEMnx1fqRDYILvex-K3DZ0sEnLVHFUkNLqRs2myrChZ_-GqRwwax-dXkTI0WK4438l23UjDli')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9861, N'd7937b2f09214186a9929b53cf4a6e0b', N'Android', NULL, 60, CAST(N'2019-05-06T18:49:12.567' AS DateTime), 0, N'dOBsUwQW41c:APA91bGtuWu6o9kg43Ms4KYYfniav1mLah_b4EAhIvcqjhAVTzpZ788GX22E05pLuzsOowi6pT9dj_nFHEUyIkj04_2DqnCs0lCVDwqNIScdxyVywU3L0daCcxZP7o7xYUghll-pZDBU')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9862, N'f6582735a1a546248ddbfc2a6f83d823', N'Android', NULL, 58, CAST(N'2019-05-06T19:25:02.267' AS DateTime), 1, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9863, N'c963a16ed8c748cc8e6719a904ccf411', N'Android', NULL, 58, CAST(N'2019-05-06T19:32:51.080' AS DateTime), 0, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9864, N'9b3d4c9a39224b4a964be2dfc30fd1e8', N'Android', NULL, 58, CAST(N'2019-05-06T19:40:23.713' AS DateTime), 0, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9865, N'7d94a744661f48c989a6d64f642ceab2', N'Android', NULL, 58, CAST(N'2019-05-06T19:50:14.800' AS DateTime), 1, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9866, N'8f93f21568bb42f9a7624b21fb0f393c', N'Android', NULL, 58, CAST(N'2019-05-06T20:08:31.870' AS DateTime), 0, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9867, N'7e65d75b26d5496a93c5bfd8a16c9a34', N'Android', NULL, 58, CAST(N'2019-05-07T10:28:10.160' AS DateTime), 0, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9868, N'8734ce757ad14b7791e82332609d5a73', N'Android', NULL, 58, CAST(N'2019-05-07T10:28:10.010' AS DateTime), 0, N'eiiqNqE6_-8:APA91bHgDRae0_UStBKQnOplcGKxOaRlLjQZD1qoJvS9zqPM0Ji3ZwE4MlaLVhxzlLEeSV45uL1NBEeIN5_RDjV-EBArUg7OqGeJOfn2OZZz5FKbMJcr9DjEfxHuCqx2iGu7-oxHBVQ-')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9869, N'17699707c23e4610972c66099a68cf58', N'Android', NULL, 58, CAST(N'2019-05-07T10:32:58.157' AS DateTime), 1, N'')
INSERT [dbo].[UserSession] ([Id], [AuthToken], [Platform], [UserID], [AttendesID], [CreateDate], [IsActive], [DeviceToken]) VALUES (9870, N'bd8029d73696458db986fa4bd4fd652f', N'Android', NULL, 58, CAST(N'2019-05-07T10:41:19.697' AS DateTime), 0, N'dHd3q5PujMM:APA91bG4Odzph7EhoSNBJg5rYTu2G9Ij6PYFs2TzW8TOaSAa3TW3YUfzRJn3V4pQxeST6IbXUdZjxs8-o0XMQyXbpkOI1O7lt2xkIugtfaF-VY86Nhg_ouT94lFtxbLWndnRiXGc5rrO')
SET IDENTITY_INSERT [dbo].[UserSession] OFF
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (1, N'Vendor Description', N'e08b1b30-d8f7-410a-87a7-08f1e5a0ba62.png', N'https://www.hersheys.com/en_us/home.html', 0, N'Vendor 1', 2)
INSERT [dbo].[Vendors] ([ID], [Description], [Thumbnail], [DocURL], [Status], [Name], [Packagetype]) VALUES (2, N'Vendor 2', N'8c21fd8a-e918-4576-b218-64aa0697b602.png', N'https://www.hersheys.com/en_us/home.html', 0, N'Vendor 2', 1)
SET IDENTITY_INSERT [dbo].[Vendors] OFF
SET IDENTITY_INSERT [dbo].[VendorsEvents] ON 

INSERT [dbo].[VendorsEvents] ([ID], [VendorsID], [EventID]) VALUES (1, 1, 3)
INSERT [dbo].[VendorsEvents] ([ID], [VendorsID], [EventID]) VALUES (2, 2, 1)
INSERT [dbo].[VendorsEvents] ([ID], [VendorsID], [EventID]) VALUES (3, 2, 3)
INSERT [dbo].[VendorsEvents] ([ID], [VendorsID], [EventID]) VALUES (4, 2, 7)
SET IDENTITY_INSERT [dbo].[VendorsEvents] OFF
ALTER TABLE [dbo].[ForumSocialComments] ADD  DEFAULT ('0') FOR [ApprovedBY]
GO
ALTER TABLE [dbo].[QRCode] ADD  CONSTRAINT [DF__QRCode__Generate__2F10007B]  DEFAULT ('0') FOR [GeneratedBY]
GO
ALTER TABLE [dbo].[SocialForum] ADD  CONSTRAINT [DF__SocialFor__Appro__35BCFE0A]  DEFAULT ('0') FOR [ApprovedBY]
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD  CONSTRAINT [FK__Activites__Activ__4222D4EF] FOREIGN KEY([ActivityTypeid])
REFERENCES [dbo].[ActivityTPYES] ([ID])
GO
ALTER TABLE [dbo].[Activites] CHECK CONSTRAINT [FK__Activites__Activ__4222D4EF]
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD  CONSTRAINT [FK__Activites__Activ__4316F928] FOREIGN KEY([ActivityTypeid])
REFERENCES [dbo].[ActivityTPYES] ([ID])
GO
ALTER TABLE [dbo].[Activites] CHECK CONSTRAINT [FK__Activites__Activ__4316F928]
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD  CONSTRAINT [FK__Activites__Event__440B1D61] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Activites] CHECK CONSTRAINT [FK__Activites__Event__440B1D61]
GO
ALTER TABLE [dbo].[Activites]  WITH CHECK ADD  CONSTRAINT [FK__Activites__Event__44FF419A] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Activites] CHECK CONSTRAINT [FK__Activites__Event__44FF419A]
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD  CONSTRAINT [FK__AttendesE__Atten__45F365D3] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents] CHECK CONSTRAINT [FK__AttendesE__Atten__45F365D3]
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD  CONSTRAINT [FK__AttendesE__Atten__46E78A0C] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents] CHECK CONSTRAINT [FK__AttendesE__Atten__46E78A0C]
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD  CONSTRAINT [FK__AttendesE__Event__47DBAE45] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents] CHECK CONSTRAINT [FK__AttendesE__Event__47DBAE45]
GO
ALTER TABLE [dbo].[AttendesEvents]  WITH CHECK ADD  CONSTRAINT [FK__AttendesE__Event__48CFD27E] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[AttendesEvents] CHECK CONSTRAINT [FK__AttendesE__Event__48CFD27E]
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD  CONSTRAINT [FK__BookMark__Activi__49C3F6B7] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[BookMark] CHECK CONSTRAINT [FK__BookMark__Activi__49C3F6B7]
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD  CONSTRAINT [FK__BookMark__Activi__4AB81AF0] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[BookMark] CHECK CONSTRAINT [FK__BookMark__Activi__4AB81AF0]
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD  CONSTRAINT [FK__BookMark__Attend__4BAC3F29] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[BookMark] CHECK CONSTRAINT [FK__BookMark__Attend__4BAC3F29]
GO
ALTER TABLE [dbo].[BookMark]  WITH CHECK ADD  CONSTRAINT [FK__BookMark__Attend__4CA06362] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[BookMark] CHECK CONSTRAINT [FK__BookMark__Attend__4CA06362]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__ManagerUs__4D94879B] FOREIGN KEY([ManagerUserId])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__ManagerUs__4D94879B]
GO
ALTER TABLE [dbo].[Exhibitors]  WITH CHECK ADD FOREIGN KEY([Packagetype])
REFERENCES [dbo].[UserPackageType] ([ID])
GO
ALTER TABLE [dbo].[ExhibitorsEvents]  WITH CHECK ADD  CONSTRAINT [FK_EventExhibitors] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[ExhibitorsEvents] CHECK CONSTRAINT [FK_EventExhibitors]
GO
ALTER TABLE [dbo].[ExhibitorsEvents]  WITH CHECK ADD  CONSTRAINT [FK_Exhibitors] FOREIGN KEY([ExhibitorsID])
REFERENCES [dbo].[Exhibitors] ([ID])
GO
ALTER TABLE [dbo].[ExhibitorsEvents] CHECK CONSTRAINT [FK_Exhibitors]
GO
ALTER TABLE [dbo].[FloorMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorMapp__Event__4E88ABD4] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorMapping] CHECK CONSTRAINT [FK__FloorMapp__Event__4E88ABD4]
GO
ALTER TABLE [dbo].[FloorMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorMapp__Event__4F7CD00D] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorMapping] CHECK CONSTRAINT [FK__FloorMapp__Event__4F7CD00D]
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorRegi__Event__5070F446] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping] CHECK CONSTRAINT [FK__FloorRegi__Event__5070F446]
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorRegi__Event__5165187F] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping] CHECK CONSTRAINT [FK__FloorRegi__Event__5165187F]
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorRegio__FMid__5EBF139D] FOREIGN KEY([FMid])
REFERENCES [dbo].[FloorMapping] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping] CHECK CONSTRAINT [FK__FloorRegio__FMid__5EBF139D]
GO
ALTER TABLE [dbo].[FloorRegionMapping]  WITH CHECK ADD  CONSTRAINT [FK__FloorRegio__FMid__5FB337D6] FOREIGN KEY([FMid])
REFERENCES [dbo].[FloorMapping] ([ID])
GO
ALTER TABLE [dbo].[FloorRegionMapping] CHECK CONSTRAINT [FK__FloorRegio__FMid__5FB337D6]
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD  CONSTRAINT [FK__ForumSoci__Atten__5441852A] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments] CHECK CONSTRAINT [FK__ForumSoci__Atten__5441852A]
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD  CONSTRAINT [FK__ForumSoci__Atten__5535A963] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments] CHECK CONSTRAINT [FK__ForumSoci__Atten__5535A963]
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD  CONSTRAINT [FK__ForumSoci__PostI__5629CD9C] FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments] CHECK CONSTRAINT [FK__ForumSoci__PostI__5629CD9C]
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD  CONSTRAINT [FK__ForumSoci__PostI__571DF1D5] FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[ForumSocialComments] CHECK CONSTRAINT [FK__ForumSoci__PostI__571DF1D5]
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([ReplyerID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[ForumSocialComments]  WITH CHECK ADD FOREIGN KEY([ReplyerID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__Atten__503BEA1C] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificat__Atten__503BEA1C]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__Event__4F47C5E3] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificat__Event__4F47C5E3]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK__Photos__EventID__619B8048] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK__Photos__EventID__619B8048]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK__Photos__EventID__628FA481] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK__Photos__EventID__628FA481]
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD  CONSTRAINT [FK__PostUserL__Atten__6383C8BA] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike] CHECK CONSTRAINT [FK__PostUserL__Atten__6383C8BA]
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD  CONSTRAINT [FK__PostUserL__Atten__6477ECF3] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike] CHECK CONSTRAINT [FK__PostUserL__Atten__6477ECF3]
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD  CONSTRAINT [FK__PostUserL__PostI__656C112C] FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike] CHECK CONSTRAINT [FK__PostUserL__PostI__656C112C]
GO
ALTER TABLE [dbo].[PostUserLike]  WITH CHECK ADD  CONSTRAINT [FK__PostUserL__PostI__66603565] FOREIGN KEY([PostID])
REFERENCES [dbo].[SocialForum] ([ID])
GO
ALTER TABLE [dbo].[PostUserLike] CHECK CONSTRAINT [FK__PostUserL__PostI__66603565]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD  CONSTRAINT [FK__QRCode__Ativitit__6754599E] FOREIGN KEY([AtivitityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[QRCode] CHECK CONSTRAINT [FK__QRCode__Ativitit__6754599E]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD  CONSTRAINT [FK__QRCode__Ativitit__68487DD7] FOREIGN KEY([AtivitityID])
REFERENCES [dbo].[Activites] ([ID])
GO
ALTER TABLE [dbo].[QRCode] CHECK CONSTRAINT [FK__QRCode__Ativitit__68487DD7]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD  CONSTRAINT [FK__QRCode__EventID__693CA210] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[QRCode] CHECK CONSTRAINT [FK__QRCode__EventID__693CA210]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD  CONSTRAINT [FK__QRCode__EventID__6A30C649] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[QRCode] CHECK CONSTRAINT [FK__QRCode__EventID__6A30C649]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([ID])
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD  CONSTRAINT [FK__QRHistory__Atten__6B24EA82] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[QRHistory] CHECK CONSTRAINT [FK__QRHistory__Atten__6B24EA82]
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD  CONSTRAINT [FK__QRHistory__Atten__6C190EBB] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[QRHistory] CHECK CONSTRAINT [FK__QRHistory__Atten__6C190EBB]
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD  CONSTRAINT [FK__QRHistory__QRid__6D0D32F4] FOREIGN KEY([QRid])
REFERENCES [dbo].[QRCode] ([ID])
GO
ALTER TABLE [dbo].[QRHistory] CHECK CONSTRAINT [FK__QRHistory__QRid__6D0D32F4]
GO
ALTER TABLE [dbo].[QRHistory]  WITH CHECK ADD  CONSTRAINT [FK__QRHistory__QRid__6E01572D] FOREIGN KEY([QRid])
REFERENCES [dbo].[QRCode] ([ID])
GO
ALTER TABLE [dbo].[QRHistory] CHECK CONSTRAINT [FK__QRHistory__QRid__6E01572D]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__Atten__6EF57B66] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__Atten__6EF57B66]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__Atten__6FE99F9F] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__Atten__6FE99F9F]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__Event__70DDC3D8] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__Event__70DDC3D8]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__Event__71D1E811] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__Event__71D1E811]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__PostT__72C60C4A] FOREIGN KEY([PostTypeid])
REFERENCES [dbo].[PostType] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__PostT__72C60C4A]
GO
ALTER TABLE [dbo].[SocialForum]  WITH CHECK ADD  CONSTRAINT [FK__SocialFor__PostT__73BA3083] FOREIGN KEY([PostTypeid])
REFERENCES [dbo].[PostType] ([ID])
GO
ALTER TABLE [dbo].[SocialForum] CHECK CONSTRAINT [FK__SocialFor__PostT__73BA3083]
GO
ALTER TABLE [dbo].[Speakers ]  WITH CHECK ADD FOREIGN KEY([Packagetype])
REFERENCES [dbo].[UserPackageType] ([ID])
GO
ALTER TABLE [dbo].[SpeakersEvents]  WITH CHECK ADD  CONSTRAINT [FK_EventIDD] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SpeakersEvents] CHECK CONSTRAINT [FK_EventIDD]
GO
ALTER TABLE [dbo].[SpeakersEvents]  WITH CHECK ADD  CONSTRAINT [FK_SpeakerID] FOREIGN KEY([SpeakerID])
REFERENCES [dbo].[Speakers ] ([ID])
GO
ALTER TABLE [dbo].[SpeakersEvents] CHECK CONSTRAINT [FK_SpeakerID]
GO
ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD FOREIGN KEY([Packagetype])
REFERENCES [dbo].[UserPackageType] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD  CONSTRAINT [FK__SponsorsE__Event__74AE54BC] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents] CHECK CONSTRAINT [FK__SponsorsE__Event__74AE54BC]
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD  CONSTRAINT [FK__SponsorsE__Event__75A278F5] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents] CHECK CONSTRAINT [FK__SponsorsE__Event__75A278F5]
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD  CONSTRAINT [FK__SponsorsE__Spons__76969D2E] FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents] CHECK CONSTRAINT [FK__SponsorsE__Spons__76969D2E]
GO
ALTER TABLE [dbo].[SponsorsEvents]  WITH CHECK ADD  CONSTRAINT [FK__SponsorsE__Spons__778AC167] FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([ID])
GO
ALTER TABLE [dbo].[SponsorsEvents] CHECK CONSTRAINT [FK__SponsorsE__Spons__778AC167]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK__Theme__EventID__787EE5A0] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK__Theme__EventID__787EE5A0]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK__Theme__EventID__797309D9] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK__Theme__EventID__797309D9]
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD  CONSTRAINT [FK__UserSessi__Atten__7E37BEF6] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[UserSession] CHECK CONSTRAINT [FK__UserSessi__Atten__7E37BEF6]
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD  CONSTRAINT [FK__UserSessi__Atten__7F2BE32F] FOREIGN KEY([AttendesID])
REFERENCES [dbo].[Attendes] ([ID])
GO
ALTER TABLE [dbo].[UserSession] CHECK CONSTRAINT [FK__UserSessi__Atten__7F2BE32F]
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[UserSession]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD FOREIGN KEY([Packagetype])
REFERENCES [dbo].[UserPackageType] ([ID])
GO
ALTER TABLE [dbo].[VendorsEvents]  WITH CHECK ADD  CONSTRAINT [FK_EventVendor] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[VendorsEvents] CHECK CONSTRAINT [FK_EventVendor]
GO
ALTER TABLE [dbo].[VendorsEvents]  WITH CHECK ADD  CONSTRAINT [FK_Vendors] FOREIGN KEY([VendorsID])
REFERENCES [dbo].[Vendors] ([ID])
GO
ALTER TABLE [dbo].[VendorsEvents] CHECK CONSTRAINT [FK_Vendors]
GO
USE [master]
GO
ALTER DATABASE [Event_Management2] SET  READ_WRITE 
GO
