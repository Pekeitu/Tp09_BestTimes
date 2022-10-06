USE [master]
GO
/****** Object:  Database [TP8]    Script Date: 6/10/2022 10:23:09 ******/
CREATE DATABASE [TP8]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP8', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP8.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP8_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP8_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP8] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP8].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP8] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP8] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP8] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP8] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP8] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP8] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP8] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP8] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP8] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP8] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP8] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP8] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP8] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP8] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP8] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP8] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP8] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP8] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP8] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP8] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP8] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP8] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP8] SET RECOVERY FULL 
GO
ALTER DATABASE [TP8] SET  MULTI_USER 
GO
ALTER DATABASE [TP8] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP8] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP8] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP8] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP8] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP8', N'ON'
GO
ALTER DATABASE [TP8] SET QUERY_STORE = OFF
GO
USE [TP8]
GO
/****** Object:  User [alumno]    Script Date: 6/10/2022 10:23:10 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  Table [dbo].[Conductores]    Script Date: 6/10/2022 10:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Foto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Conductores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosTrack]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  Table [dbo].[Paises]    Script Date: 6/10/2022 10:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Bandera] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 6/10/2022 10:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Longitud] [float] NOT NULL,
	[IdPais] [int] NOT NULL,
	[FechaInauguracion] [date] NOT NULL,
	[IdFotos] [int] NOT NULL,
	[ImgLayout] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vueltas]    Script Date: 6/10/2022 10:23:10 ******/
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
ALTER TABLE [dbo].[Conductores]  WITH CHECK ADD  CONSTRAINT [FK_Conductores_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([Id])
GO
ALTER TABLE [dbo].[Conductores] CHECK CONSTRAINT [FK_Conductores_Paises]
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_FotosPaises] FOREIGN KEY([IdFotos])
REFERENCES [dbo].[FotosTrack] ([Id])
GO
ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [FK_Tracks_FotosPaises]
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
/****** Object:  StoredProcedure [dbo].[AgregarConductor]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarTrack]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarVuelta]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarConductoresxId]    Script Date: 6/10/2022 10:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarConductoresxId]
	@id int
AS
BEGIN
	SELECT * FROM Conductores
	WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarFotosTrackxId]    Script Date: 6/10/2022 10:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarFotosTrackxId]
	@id int
AS
BEGIN
	SELECT * FROM FotosTrack
	WHERE IdTrack  = @id
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarTrack]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarConductores]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTracks]    Script Date: 6/10/2022 10:23:10 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarVueltasxTrack]    Script Date: 6/10/2022 10:23:10 ******/
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
ALTER DATABASE [TP8] SET  READ_WRITE 
GO
