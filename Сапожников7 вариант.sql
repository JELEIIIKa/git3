USE [master]
GO
/****** Object:  Database [Горького]    Script Date: 12.05.2023 15:07:20 ******/
CREATE DATABASE [Горького]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Горького', FILENAME = N'D:\Личная папка\Горького.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Горького_log', FILENAME = N'D:\Личная папка\Горького_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Горького] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Горького].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Горького] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Горького] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Горького] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Горького] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Горького] SET ARITHABORT OFF 
GO
ALTER DATABASE [Горького] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Горького] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Горького] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Горького] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Горького] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Горького] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Горького] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Горького] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Горького] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Горького] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Горького] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Горького] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Горького] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Горького] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Горького] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Горького] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Горького] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Горького] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Горького] SET  MULTI_USER 
GO
ALTER DATABASE [Горького] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Горького] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Горького] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Горького] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Горького] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Горького] SET QUERY_STORE = OFF
GO
USE [Горького]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Код_клиента] [int] NULL,
	[Дата_создания] [date] NULL,
	[Время_заказа] [time](7) NULL,
	[Статус] [nvarchar](50) NULL,
	[Дата_закрытия] [date] NULL,
	[Время_проката] [nvarchar](20) NULL,
	[Код_заказа] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Код клиента] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Дата рождения] [date] NULL,
	[Адрес] [nvarchar](255) NULL,
	[e-mail] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[Код_роли] [int] NULL,
	[Наименование] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код сотрудника] [int] NULL,
	[Роль] [nvarchar](255) NULL,
	[Фамилия] [nvarchar](255) NULL,
	[Имя] [nvarchar](255) NULL,
	[Отчесво] [nvarchar](255) NULL,
	[Логин ] [nvarchar](255) NULL,
	[Пароль] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[Код услуги] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Шифр] [nvarchar](50) NOT NULL,
	[Стоимость] [money] NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Чек]    Script Date: 12.05.2023 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Чек](
	[ID] [float] NULL,
	[Код_заказа] [float] NULL,
	[Код_услуги] [float] NULL,
	[Код_клиента] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Горького] SET  READ_WRITE 
GO
