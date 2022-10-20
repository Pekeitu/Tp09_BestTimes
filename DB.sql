USE [master]
GO
/****** Object:  Database [TP9]    Script Date: 20/10/2022 12:02:54 ******/
CREATE DATABASE [TP9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP9.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP9_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP9] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP9] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP9] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP9] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP9] SET RECOVERY FULL 
GO
ALTER DATABASE [TP9] SET  MULTI_USER 
GO
ALTER DATABASE [TP9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP9] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP9] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP9', N'ON'
GO
ALTER DATABASE [TP9] SET QUERY_STORE = OFF
GO
USE [TP9]
GO
/****** Object:  User [alumno]    Script Date: 20/10/2022 12:02:54 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Torque] [float] NOT NULL,
	[HP] [float] NOT NULL,
	[Peso] [float] NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[Año] [date] NOT NULL,
	[Foto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Coches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductores]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [varchar](3) NOT NULL,
	[Foto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Conductores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosTrack]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosTrack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTrack] [int] NOT NULL,
	[Foto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FotosPaises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id] [varchar](3) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Code] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Longitud] [float] NOT NULL,
	[IdPais] [varchar](3) NOT NULL,
	[FechaInauguracion] [date] NOT NULL,
	[ImgLayout] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vueltas]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vueltas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTrack] [int] NOT NULL,
	[IdConductor] [int] NOT NULL,
	[Tiempo] [time](7) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdAuto] [int] NOT NULL,
 CONSTRAINT [PK_Vueltas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FotosTrack] ON 

INSERT [dbo].[FotosTrack] ([Id], [IdTrack], [Foto]) VALUES (1, 4, N'https://cdn.gpblog.com/news/2022/08/25/v2_large_e3abc848d25e2b3426158fea8ae769c2fd7c6950.jpg')
SET IDENTITY_INSERT [dbo].[FotosTrack] OFF
GO
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ABW', N'Aruba', N'AW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AFG', N'Afghanistan', N'AF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AGO', N'Angola', N'AO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AIA', N'Anguilla', N'AI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ALA', N'Åland', N'AX')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ALB', N'Albania', N'AL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AND', N'Andorra', N'AD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ARE', N'United Arab Emirates', N'AE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ARG', N'Argentina', N'AR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ARM', N'Armenia', N'AM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ASM', N'American Samoa', N'AS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ATA', N'Antarctica', N'AQ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ATF', N'French Southern Territories', N'TF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ATG', N'Antigua and Barbuda', N'AG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AUS', N'Australia', N'AU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AUT', N'Austria', N'AT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'AZE', N'Azerbaijan', N'AZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BDI', N'Burundi', N'BI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BEL', N'Belgium', N'BE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BEN', N'Benin', N'BJ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BES', N'Bonaire', N'BQ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BFA', N'Burkina Faso', N'BF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BGD', N'Bangladesh', N'BD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BGR', N'Bulgaria', N'BG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BHR', N'Bahrain', N'BH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BHS', N'Bahamas', N'BS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BIH', N'Bosnia and Herzegovina', N'BA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BLM', N'Saint Barthélemy', N'BL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BLR', N'Belarus', N'BY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BLZ', N'Belize', N'BZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BMU', N'Bermuda', N'BM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BOL', N'Bolivia', N'BO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BRA', N'Brazil', N'BR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BRB', N'Barbados', N'BB')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BRN', N'Brunei', N'BN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BTN', N'Bhutan', N'BT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BVT', N'Bouvet Island', N'BV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'BWA', N'Botswana', N'BW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CAF', N'Central African Republic', N'CF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CAN', N'Canada', N'CA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CCK', N'Cocos [Keeling] Islands', N'CC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CHE', N'Switzerland', N'CH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CHL', N'Chile', N'CL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CHN', N'China', N'CN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CIV', N'Ivory Coast', N'CI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CMR', N'Cameroon', N'CM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'COD', N'Democratic Republic of the Congo', N'CD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'COG', N'Republic of the Congo', N'CG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'COK', N'Cook Islands', N'CK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'COL', N'Colombia', N'CO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'COM', N'Comoros', N'KM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CPV', N'Cape Verde', N'CV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CRI', N'Costa Rica', N'CR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CUB', N'Cuba', N'CU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CUW', N'Curacao', N'CW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CXR', N'Christmas Island', N'CX')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CYM', N'Cayman Islands', N'KY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CYP', N'Cyprus', N'CY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'CZE', N'Czech Republic', N'CZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DEU', N'Germany', N'DE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DJI', N'Djibouti', N'DJ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DMA', N'Dominica', N'DM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DNK', N'Denmark', N'DK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DOM', N'Dominican Republic', N'DO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'DZA', N'Algeria', N'DZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ECU', N'Ecuador', N'EC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'EGY', N'Egypt', N'EG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ERI', N'Eritrea', N'ER')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ESH', N'Western Sahara', N'EH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ESP', N'Spain', N'ES')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'EST', N'Estonia', N'EE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ETH', N'Ethiopia', N'ET')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FIN', N'Finland', N'FI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FJI', N'Fiji', N'FJ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FLK', N'Falkland Islands', N'FK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FRA', N'France', N'FR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FRO', N'Faroe Islands', N'FO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'FSM', N'Micronesia', N'FM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GAB', N'Gabon', N'GA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GBR', N'United Kingdom', N'GB')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GEO', N'Georgia', N'GE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GGY', N'Guernsey', N'GG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GHA', N'Ghana', N'GH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GIB', N'Gibraltar', N'GI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GIN', N'Guinea', N'GN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GLP', N'Guadeloupe', N'GP')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GMB', N'Gambia', N'GM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GNB', N'Guinea-Bissau', N'GW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GNQ', N'Equatorial Guinea', N'GQ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GRC', N'Greece', N'GR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GRD', N'Grenada', N'GD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GRL', N'Greenland', N'GL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GTM', N'Guatemala', N'GT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GUF', N'French Guiana', N'GF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GUM', N'Guam', N'GU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'GUY', N'Guyana', N'GY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HKG', N'Hong Kong', N'HK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HMD', N'Heard Island and McDonald Islands', N'HM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HND', N'Honduras', N'HN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HRV', N'Croatia', N'HR')
GO
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HTI', N'Haiti', N'HT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'HUN', N'Hungary', N'HU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IDN', N'Indonesia', N'ID')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IMN', N'Isle of Man', N'IM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IND', N'India', N'IN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IOT', N'British Indian Ocean Territory', N'IO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IRL', N'Ireland', N'IE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IRN', N'Iran', N'IR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'IRQ', N'Iraq', N'IQ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ISL', N'Iceland', N'IS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ISR', N'Israel', N'IL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ITA', N'Italy', N'IT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'JAM', N'Jamaica', N'JM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'JEY', N'Jersey', N'JE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'JOR', N'Jordan', N'JO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'JPN', N'Japan', N'JP')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KAZ', N'Kazakhstan', N'KZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KEN', N'Kenya', N'KE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KGZ', N'Kyrgyzstan', N'KG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KHM', N'Cambodia', N'KH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KIR', N'Kiribati', N'KI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KNA', N'Saint Kitts and Nevis', N'KN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KOR', N'South Korea', N'KR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'KWT', N'Kuwait', N'KW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LAO', N'Laos', N'LA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LBN', N'Lebanon', N'LB')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LBR', N'Liberia', N'LR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LBY', N'Libya', N'LY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LCA', N'Saint Lucia', N'LC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LIE', N'Liechtenstein', N'LI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LKA', N'Sri Lanka', N'LK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LSO', N'Lesotho', N'LS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LTU', N'Lithuania', N'LT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LUX', N'Luxembourg', N'LU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'LVA', N'Latvia', N'LV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MAC', N'Macao', N'MO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MAF', N'Saint Martin', N'MF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MAR', N'Morocco', N'MA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MCO', N'Monaco', N'MC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MDA', N'Moldova', N'MD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MDG', N'Madagascar', N'MG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MDV', N'Maldives', N'MV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MEX', N'Mexico', N'MX')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MHL', N'Marshall Islands', N'MH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MKD', N'Macedonia', N'MK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MLI', N'Mali', N'ML')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MLT', N'Malta', N'MT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MMR', N'Myanmar [Burma]', N'MM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MNE', N'Montenegro', N'ME')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MNG', N'Mongolia', N'MN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MNP', N'Northern Mariana Islands', N'MP')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MOZ', N'Mozambique', N'MZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MRT', N'Mauritania', N'MR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MSR', N'Montserrat', N'MS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MTQ', N'Martinique', N'MQ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MUS', N'Mauritius', N'MU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MWI', N'Malawi', N'MW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MYS', N'Malaysia', N'MY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'MYT', N'Mayotte', N'YT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NAM', N'Namibia', N'NA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NCL', N'New Caledonia', N'NC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NER', N'Niger', N'NE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NFK', N'Norfolk Island', N'NF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NGA', N'Nigeria', N'NG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NIC', N'Nicaragua', N'NI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NIU', N'Niue', N'NU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NLD', N'Netherlands', N'NL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NOR', N'Norway', N'NO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NPL', N'Nepal', N'NP')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NRU', N'Nauru', N'NR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'NZL', N'New Zealand', N'NZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'OMN', N'Oman', N'OM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PAK', N'Pakistan', N'PK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PAN', N'Panama', N'PA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PCN', N'Pitcairn Islands', N'PN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PER', N'Peru', N'PE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PHL', N'Philippines', N'PH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PLW', N'Palau', N'PW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PNG', N'Papua New Guinea', N'PG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'POL', N'Poland', N'PL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PRI', N'Puerto Rico', N'PR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PRK', N'North Korea', N'KP')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PRT', N'Portugal', N'PT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PRY', N'Paraguay', N'PY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PSE', N'Palestine', N'PS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'PYF', N'French Polynesia', N'PF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'QAT', N'Qatar', N'QA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'REU', N'Réunion', N'RE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ROU', N'Romania', N'RO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'RUS', N'Russia', N'RU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'RWA', N'Rwanda', N'RW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SAU', N'Saudi Arabia', N'SA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SDN', N'Sudan', N'SD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SEN', N'Senegal', N'SN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SGP', N'Singapore', N'SG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SGS', N'South Georgia and the South Sandwich Islands', N'GS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SHN', N'Saint Helena', N'SH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SJM', N'Svalbard and Jan Mayen', N'SJ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SLB', N'Solomon Islands', N'SB')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SLE', N'Sierra Leone', N'SL')
GO
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SLV', N'El Salvador', N'SV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SMR', N'San Marino', N'SM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SOM', N'Somalia', N'SO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SPM', N'Saint Pierre and Miquelon', N'PM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SRB', N'Serbia', N'RS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SSD', N'South Sudan', N'SS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'STP', N'São Tomé and Príncipe', N'ST')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SUR', N'Suriname', N'SR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SVK', N'Slovakia', N'SK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SVN', N'Slovenia', N'SI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SWE', N'Sweden', N'SE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SWZ', N'Swaziland', N'SZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SXM', N'Sint Maarten', N'SX')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SYC', N'Seychelles', N'SC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'SYR', N'Syria', N'SY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TCA', N'Turks and Caicos Islands', N'TC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TCD', N'Chad', N'TD')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TGO', N'Togo', N'TG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'THA', N'Thailand', N'TH')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TJK', N'Tajikistan', N'TJ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TKL', N'Tokelau', N'TK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TKM', N'Turkmenistan', N'TM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TLS', N'East Timor', N'TL')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TON', N'Tonga', N'TO')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TTO', N'Trinidad and Tobago', N'TT')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TUN', N'Tunisia', N'TN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TUR', N'Turkey', N'TR')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TUV', N'Tuvalu', N'TV')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TWN', N'Taiwan', N'TW')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'TZA', N'Tanzania', N'TZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'UGA', N'Uganda', N'UG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'UKR', N'Ukraine', N'UA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'UMI', N'U.S. Minor Outlying Islands', N'UM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'URY', N'Uruguay', N'UY')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'USA', N'United States', N'US')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'UZB', N'Uzbekistan', N'UZ')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VAT', N'Vatican City', N'VA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VCT', N'Saint Vincent and the Grenadines', N'VC')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VEN', N'Venezuela', N'VE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VGB', N'British Virgin Islands', N'VG')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VIR', N'U.S. Virgin Islands', N'VI')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VNM', N'Vietnam', N'VN')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'VUT', N'Vanuatu', N'VU')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'WLF', N'Wallis and Futuna', N'WF')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'WSM', N'Samoa', N'WS')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'XKX', N'Kosovo', N'XK')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'YEM', N'Yemen', N'YE')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ZAF', N'South Africa', N'ZA')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ZMB', N'Zambia', N'ZM')
INSERT [dbo].[Paises] ([Id], [Nombre], [Code]) VALUES (N'ZWE', N'Zimbabwe', N'ZW')
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

INSERT [dbo].[Tracks] ([Id], [Nombre], [Longitud], [IdPais], [FechaInauguracion], [ImgLayout]) VALUES (4, N'Spa', 2, N'ASM', CAST(N'2022-10-04' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/5/50/Spa-Francorchamps-2007-v2.png')
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
ALTER TABLE [dbo].[Conductores]  WITH CHECK ADD  CONSTRAINT [FK_Conductores_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([Id])
GO
ALTER TABLE [dbo].[Conductores] CHECK CONSTRAINT [FK_Conductores_Paises]
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([Id])
GO
ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [FK_Tracks_Paises]
GO
ALTER TABLE [dbo].[Vueltas]  WITH CHECK ADD  CONSTRAINT [FK_Vueltas_Autos] FOREIGN KEY([IdAuto])
REFERENCES [dbo].[Autos] ([Id])
GO
ALTER TABLE [dbo].[Vueltas] CHECK CONSTRAINT [FK_Vueltas_Autos]
GO
ALTER TABLE [dbo].[Vueltas]  WITH CHECK ADD  CONSTRAINT [FK_Vueltas_Conductores] FOREIGN KEY([IdConductor])
REFERENCES [dbo].[Conductores] ([Id])
GO
ALTER TABLE [dbo].[Vueltas] CHECK CONSTRAINT [FK_Vueltas_Conductores]
GO
ALTER TABLE [dbo].[Vueltas]  WITH CHECK ADD  CONSTRAINT [FK_Vueltas_Tracks] FOREIGN KEY([IdTrack])
REFERENCES [dbo].[Tracks] ([Id])
GO
ALTER TABLE [dbo].[Vueltas] CHECK CONSTRAINT [FK_Vueltas_Tracks]
GO
/****** Object:  StoredProcedure [dbo].[AgregarConductor]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarConductor]
	@Nombre varchar(50),
	@IdPais int,
	@Foto varchar(100)
AS
BEGIN
	INSERT INTO Conductores(Nombre, IdPais, Foto) VALUES(@Nombre, @IdPais, @Foto)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarTrack]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarTrack]
	@Nombre varchar(50),
	@Longitud float,
	@IdPais int,
	@FechaInauguracion date,
	@IdFotos int,
	@ImgLayout varchar(100)
AS
BEGIN
	INSERT INTO Tracks(Nombre, Longitud, IdPais, FechaInauguracion, IdFotos, ImgLayout) VALUES(@Nombre, @Longitud, @IdPais, @FechaInauguracion, @IdFotos, @ImgLayout)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarVuelta]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarVuelta]
	@IdTrack int,
	@IdConductor int,
	@Tiempo time(7),
	@Fecha date,
	@IdAuto int
AS
BEGIN
	INSERT INTO Vueltas(IdTrack, IdConductor, Tiempo, Fecha, IdAuto) VALUES(@IdTrack, @IdConductor, @Tiempo, @Fecha, @IdAuto)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarConductorxId]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarConductorxId]
	@id int
AS
BEGIN
	SELECT * FROM Conductores
	WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarFotosTrackxId]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarFotosTrackxId]
	@id int
AS
BEGIN
	SELECT Foto FROM FotosTrack
	WHERE IdTrack  = @id
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPaisxId]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPaisxId]
	@id varchar(3)
AS
BEGIN
	SELECT * FROM Paises
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarTrack]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarTrack]
	@id int
AS
BEGIN
	SELECT * FROM Tracks
	WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ListarConductores]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarConductores]
AS
BEGIN
	SELECT * FROM Conductores
END
GO
/****** Object:  StoredProcedure [dbo].[ListarTracks]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarTracks]
AS
BEGIN
	SELECT * FROM Tracks
END
GO
/****** Object:  StoredProcedure [dbo].[ListarVueltasxTrack]    Script Date: 20/10/2022 12:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarVueltasxTrack]
	@id int
AS
BEGIN
	SELECT * FROM Vueltas
	WHERE IdTrack = @id
END
GO
USE [master]
GO
ALTER DATABASE [TP9] SET  READ_WRITE 
GO
