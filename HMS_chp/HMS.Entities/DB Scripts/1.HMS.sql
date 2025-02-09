USE [master]
GO
/****** Object:  Database [HMS]    Script Date: 08/23/2015 23:03:33 ******/
CREATE DATABASE [HMS] ON  PRIMARY 
( NAME = N'HMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HMS.mdf' , SIZE = 14592KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HMS_1.LDF' , SIZE = 32448KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HMS] SET ARITHABORT OFF
GO
ALTER DATABASE [HMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [HMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HMS] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [HMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HMS] SET  READ_WRITE
GO
ALTER DATABASE [HMS] SET RECOVERY FULL
GO
ALTER DATABASE [HMS] SET  MULTI_USER
GO
ALTER DATABASE [HMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HMS] SET DB_CHAINING OFF
GO
USE [HMS]
GO
/****** Object:  Table [dbo].[Rightss]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rightss](
	[RightsId] [int] NOT NULL,
	[RightsName] [varchar](200) NOT NULL,
	[IsActive] [nchar](10) NULL,
 CONSTRAINT [PK_Rightss] PRIMARY KEY CLUSTERED 
(
	[RightsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecentSearches]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentSearches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionKey] [nvarchar](max) NULL,
	[From] [nvarchar](max) NULL,
	[Duration] [int] NOT NULL,
	[PepolePerRoom] [int] NOT NULL,
	[HotelClass] [int] NOT NULL,
	[SetDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.RecentSearches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionTypes]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[SetDate] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.QuestionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[SetDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Subscribes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeoplePerRooms]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeoplePerRooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomCapacity] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SetDate] [datetime] NOT NULL,
	[SetBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PeoplePerRooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageType]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageType](
	[Id] [int] NOT NULL,
	[Name] [varchar](max) NULL,
 CONSTRAINT [PK_PageType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Experiences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Year] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Narratives] [varchar](max) NOT NULL,
	[IsShow] [bit] NULL,
	[IsActive] [bit] NULL,
	[Setdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Experience] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventsType]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventsType](
	[EventsTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EventsTypeName] [varchar](100) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EventsType] PRIMARY KEY CLUSTERED 
(
	[EventsTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [varchar](500) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Source] [varchar](150) NOT NULL,
	[PublishDate] [datetime] NOT NULL,
	[Img] [int] NULL,
	[IsArchive] [bit] NOT NULL,
	[LastUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Star] [nvarchar](max) NOT NULL,
	[DistanceFromHaram] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SetDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Hotels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Durations]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Durations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalDuration] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SetDate] [datetime] NOT NULL,
	[SetBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Durations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyType]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrencyType](
	[CurrencyTypeId] [int] NOT NULL,
	[CurrencyName] [varchar](100) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvertiseTypes]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertiseTypes](
	[AdvertiseTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AdvertiseTypes] PRIMARY KEY CLUSTERED 
(
	[AdvertiseTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[binaryObjectTypes]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[binaryObjectTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjectTypeSource] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_dbo.binaryObjectTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[binaryObjects]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[binaryObjects](
	[Id] [varchar](100) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[RefObjectTypeId] [int] NOT NULL,
	[RefObjectKey] [int] NOT NULL,
	[BinaryObjectTypeName] [varchar](100) NULL,
	[ObjectCaption] [nvarchar](max) NULL,
	[Object] [varbinary](max) NULL,
	[ObjectPath] [nvarchar](max) NULL,
	[Extension] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdatedTime] [datetime] NULL,
	[FileName] [nvarchar](1024) NULL,
	[ContentType] [nvarchar](1024) NULL,
	[ObjectDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.binaryObjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ObjectTypeId] ON [dbo].[binaryObjects] 
(
	[RefObjectTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelDetails]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[WifiInRooms] [bit] NULL,
	[WifiInLobby] [bit] NULL,
	[SatelliteTV] [bit] NULL,
	[Restaurant] [bit] NULL,
	[LaundryService] [bit] NULL,
	[SafeDepositBox] [bit] NULL,
	[WheelchairAccess] [bit] NULL,
	[AC] [bit] NULL,
	[RoomService] [bit] NULL,
	[Lift] [bit] NULL,
	[NonSmokingRooms] [bit] NULL,
	[Kitchenette] [bit] NULL,
	[MiniBarFridge] [bit] NULL,
 CONSTRAINT [PK_dbo.HotelDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HotelId] ON [dbo].[HotelDetails] 
(
	[HotelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserAccountsId] [varchar](10) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserDescription] [nvarchar](max) NULL,
	[SetDate] [datetime] NOT NULL,
	[SetBy] [nvarchar](max) NULL,
	[EmailId] [varchar](20) NULL,
	[CountryId] [int] NULL,
	[PhoneNo] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserAccountsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleRightss]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleRightss](
	[RoleRightsId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[RightId] [int] NULL,
	[SetBy] [varchar](10) NULL,
	[IsActive] [nchar](10) NOT NULL,
 CONSTRAINT [PK_RoleRights] PRIMARY KEY CLUSTERED 
(
	[RoleRightsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionAnswers]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionAnswers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Question] [varchar](max) NOT NULL,
	[Answer] [varchar](max) NULL,
	[ScoloarId] [varchar](10) NULL,
	[TypeId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[EmailId] [varchar](150) NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[AnswerDate] [datetime] NULL,
	[SetDate] [datetime] NULL,
	[EntryDate] [datetime] NULL,
	[IsSelfInitiative] [bit] NOT NULL,
	[IsFrequentAsk] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.QuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ScoloarId] ON [dbo].[QuestionAnswers] 
(
	[ScoloarId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[QuestionAnswers] 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[EventsId] [int] IDENTITY(1,1) NOT NULL,
	[EventsTitle] [varchar](50) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[EventsTypeId] [int] NULL,
	[EventsDate] [datetime] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Time] [varchar](50) NOT NULL,
	[Venue] [varchar](50) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
	[OrgWebsite] [varchar](150) NULL,
	[OrgPhone] [varchar](150) NULL,
	[OrgEmail] [varchar](150) NULL,
	[OrgContactAddress] [varchar](150) NULL,
	[Documents] [varchar](100) NULL,
	[Logo] [varchar](100) NULL,
	[YourName] [varchar](20) NOT NULL,
	[YourOrganisation] [varchar](20) NOT NULL,
	[YourPhone] [varchar](20) NOT NULL,
	[YourEmail] [varchar](150) NOT NULL,
	[SetBy] [varchar](10) NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Events] PRIMARY KEY CLUSTERED 
(
	[EventsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Logo] ON [dbo].[Events] 
(
	[Logo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageSources]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PackageSources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LogoId] [varchar](100) NOT NULL,
	[SetBy] [nvarchar](max) NOT NULL,
	[SetDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.PackageSources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_LogoId] ON [dbo].[PackageSources] 
(
	[LogoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientIdentityId] [varchar](10) NULL,
	[ClientName] [varchar](500) NOT NULL,
	[Address] [varchar](max) NULL,
	[Amount] [money] NULL,
	[Setdate] [datetime] NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
	[SetBy] [varchar](10) NOT NULL,
	[ContactNumber] [varchar](20) NULL,
	[EmailAddress] [varchar](15) NULL,
	[Img] [varchar](50) NULL,
	[CurrencyType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_ClientInfo] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvertisePositions]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvertisePositions](
	[AdvertisePositionsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TargetId] [varchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[PageId] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[CurrencyType] [int] NULL,
	[SetBy] [varchar](10) NOT NULL,
	[SetDate] [datetime] NOT NULL,
	[IsDefault] [bit] NULL,
	[LastUpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.AdvertisePositions] PRIMARY KEY CLUSTERED 
(
	[AdvertisePositionsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Advertises]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertises](
	[AdvertiseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[AdvertiseTypeId] [int] NOT NULL,
	[Extension] [nvarchar](max) NULL,
	[AdvertiseContent] [nvarchar](max) NULL,
	[AdvertisePositionsId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ClientId] [int] NULL,
	[IsDefault] [bit] NOT NULL,
	[SetBy] [nvarchar](max) NOT NULL,
	[SetDate] [datetime] NOT NULL,
	[Img] [int] NULL,
	[LastUpdatedTime] [datetime] NULL,
	[PriorityLevel] [int] NULL,
 CONSTRAINT [PK_dbo.Advertises] PRIMARY KEY CLUSTERED 
(
	[AdvertiseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PositionId] ON [dbo].[Advertises] 
(
	[AdvertisePositionsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Type] ON [dbo].[Advertises] 
(
	[AdvertiseTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](8000) NOT NULL,
	[PackageSourceId] [int] NOT NULL,
	[Details] [varchar](max) NOT NULL,
	[Duration] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[PriceType] [varchar](50) NOT NULL,
	[StartFrom] [varchar](150) NOT NULL,
	[SetBy] [nvarchar](max) NOT NULL,
	[SetDate] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Packages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_PackageSourceId] ON [dbo].[Packages] 
(
	[PackageSourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageDetails]    Script Date: 08/23/2015 23:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PackageId] [int] NOT NULL,
	[Details] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PackageDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PackageId] ON [dbo].[PackageDetails] 
(
	[PackageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_dbo.binaryObjects_dbo.binaryObjectTypes_ObjectTypeId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[binaryObjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.binaryObjects_dbo.binaryObjectTypes_ObjectTypeId] FOREIGN KEY([RefObjectTypeId])
REFERENCES [dbo].[binaryObjectTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[binaryObjects] CHECK CONSTRAINT [FK_dbo.binaryObjects_dbo.binaryObjectTypes_ObjectTypeId]
GO
/****** Object:  ForeignKey [FK_dbo.HotelDetails_dbo.Hotels_HotelId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[HotelDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HotelDetails_dbo.Hotels_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotels] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelDetails] CHECK CONSTRAINT [FK_dbo.HotelDetails_dbo.Hotels_HotelId]
GO
/****** Object:  ForeignKey [FK_UserAccounts_Country]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Country]
GO
/****** Object:  ForeignKey [FK_UserAccounts_Roles]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Roles]
GO
/****** Object:  ForeignKey [FK_RoleRightss_Rightss]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[RoleRightss]  WITH CHECK ADD  CONSTRAINT [FK_RoleRightss_Rightss] FOREIGN KEY([RightId])
REFERENCES [dbo].[Rightss] ([RightsId])
GO
ALTER TABLE [dbo].[RoleRightss] CHECK CONSTRAINT [FK_RoleRightss_Rightss]
GO
/****** Object:  ForeignKey [FK_RoleRightss_Roles]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[RoleRightss]  WITH CHECK ADD  CONSTRAINT [FK_RoleRightss_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RoleRightss] CHECK CONSTRAINT [FK_RoleRightss_Roles]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionAnswers_dbo.QuestionTypes_TypeId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[QuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionAnswers_dbo.QuestionTypes_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[QuestionTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionAnswers] CHECK CONSTRAINT [FK_dbo.QuestionAnswers_dbo.QuestionTypes_TypeId]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionAnswers_dbo.UserAccounts_ScoloarId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[QuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionAnswers_dbo.UserAccounts_ScoloarId] FOREIGN KEY([ScoloarId])
REFERENCES [dbo].[UserAccounts] ([UserAccountsId])
GO
ALTER TABLE [dbo].[QuestionAnswers] CHECK CONSTRAINT [FK_dbo.QuestionAnswers_dbo.UserAccounts_ScoloarId]
GO
/****** Object:  ForeignKey [FK_Events_EventsType]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventsType] FOREIGN KEY([EventsTypeId])
REFERENCES [dbo].[EventsType] ([EventsTypeId])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventsType]
GO
/****** Object:  ForeignKey [FK_Events_UserAccounts]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_UserAccounts] FOREIGN KEY([SetBy])
REFERENCES [dbo].[UserAccounts] ([UserAccountsId])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_UserAccounts]
GO
/****** Object:  ForeignKey [FK_dbo.PackageSources_dbo.binaryObjects_LogoId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[PackageSources]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PackageSources_dbo.binaryObjects_LogoId] FOREIGN KEY([LogoId])
REFERENCES [dbo].[binaryObjects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageSources] CHECK CONSTRAINT [FK_dbo.PackageSources_dbo.binaryObjects_LogoId]
GO
/****** Object:  ForeignKey [FK_ClientInfo_Country]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[ClientInfo]  WITH CHECK ADD  CONSTRAINT [FK_ClientInfo_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[ClientInfo] CHECK CONSTRAINT [FK_ClientInfo_Country]
GO
/****** Object:  ForeignKey [FK_ClientInfo_CurrencyType]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[ClientInfo]  WITH CHECK ADD  CONSTRAINT [FK_ClientInfo_CurrencyType] FOREIGN KEY([CurrencyType])
REFERENCES [dbo].[CurrencyType] ([CurrencyTypeId])
GO
ALTER TABLE [dbo].[ClientInfo] CHECK CONSTRAINT [FK_ClientInfo_CurrencyType]
GO
/****** Object:  ForeignKey [FK_ClientInfo_UserAccounts]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[ClientInfo]  WITH CHECK ADD  CONSTRAINT [FK_ClientInfo_UserAccounts] FOREIGN KEY([SetBy])
REFERENCES [dbo].[UserAccounts] ([UserAccountsId])
GO
ALTER TABLE [dbo].[ClientInfo] CHECK CONSTRAINT [FK_ClientInfo_UserAccounts]
GO
/****** Object:  ForeignKey [FK_AdvertisePositions_CurrencyType]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[AdvertisePositions]  WITH CHECK ADD  CONSTRAINT [FK_AdvertisePositions_CurrencyType] FOREIGN KEY([CurrencyType])
REFERENCES [dbo].[CurrencyType] ([CurrencyTypeId])
GO
ALTER TABLE [dbo].[AdvertisePositions] CHECK CONSTRAINT [FK_AdvertisePositions_CurrencyType]
GO
/****** Object:  ForeignKey [FK_AdvertisePositions_PageType]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[AdvertisePositions]  WITH CHECK ADD  CONSTRAINT [FK_AdvertisePositions_PageType] FOREIGN KEY([PageId])
REFERENCES [dbo].[PageType] ([Id])
GO
ALTER TABLE [dbo].[AdvertisePositions] CHECK CONSTRAINT [FK_AdvertisePositions_PageType]
GO
/****** Object:  ForeignKey [FK_AdvertisePositions_UserAccounts]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[AdvertisePositions]  WITH CHECK ADD  CONSTRAINT [FK_AdvertisePositions_UserAccounts] FOREIGN KEY([SetBy])
REFERENCES [dbo].[UserAccounts] ([UserAccountsId])
GO
ALTER TABLE [dbo].[AdvertisePositions] CHECK CONSTRAINT [FK_AdvertisePositions_UserAccounts]
GO
/****** Object:  ForeignKey [FK_Advertises_AdvertisePositions]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Advertises]  WITH CHECK ADD  CONSTRAINT [FK_Advertises_AdvertisePositions] FOREIGN KEY([AdvertisePositionsId])
REFERENCES [dbo].[AdvertisePositions] ([AdvertisePositionsId])
GO
ALTER TABLE [dbo].[Advertises] CHECK CONSTRAINT [FK_Advertises_AdvertisePositions]
GO
/****** Object:  ForeignKey [FK_Advertises_AdvertiseTypes]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Advertises]  WITH CHECK ADD  CONSTRAINT [FK_Advertises_AdvertiseTypes] FOREIGN KEY([AdvertiseTypeId])
REFERENCES [dbo].[AdvertiseTypes] ([AdvertiseTypeId])
GO
ALTER TABLE [dbo].[Advertises] CHECK CONSTRAINT [FK_Advertises_AdvertiseTypes]
GO
/****** Object:  ForeignKey [FK_Advertises_ClientInfo]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Advertises]  WITH CHECK ADD  CONSTRAINT [FK_Advertises_ClientInfo] FOREIGN KEY([ClientId])
REFERENCES [dbo].[ClientInfo] ([ClientId])
GO
ALTER TABLE [dbo].[Advertises] CHECK CONSTRAINT [FK_Advertises_ClientInfo]
GO
/****** Object:  ForeignKey [FK_dbo.Packages_dbo.PackageSources_PackageSourceId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Packages_dbo.PackageSources_PackageSourceId] FOREIGN KEY([PackageSourceId])
REFERENCES [dbo].[PackageSources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_dbo.Packages_dbo.PackageSources_PackageSourceId]
GO
/****** Object:  ForeignKey [FK_dbo.PackageDetails_dbo.Packages_PackageId]    Script Date: 08/23/2015 23:03:34 ******/
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PackageDetails_dbo.Packages_PackageId] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Packages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_dbo.PackageDetails_dbo.Packages_PackageId]
GO
