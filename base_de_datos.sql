USE [master]
GO
/****** Object:  Database [libros_app]    Script Date: 29/6/25 2:08:05 ******/
CREATE DATABASE [libros_app]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libros_app', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\libros_app.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libros_app_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\libros_app_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [libros_app] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libros_app].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libros_app] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libros_app] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libros_app] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libros_app] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libros_app] SET ARITHABORT OFF 
GO
ALTER DATABASE [libros_app] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [libros_app] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libros_app] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libros_app] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libros_app] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libros_app] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libros_app] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libros_app] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libros_app] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libros_app] SET  ENABLE_BROKER 
GO
ALTER DATABASE [libros_app] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libros_app] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libros_app] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libros_app] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libros_app] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libros_app] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libros_app] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libros_app] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [libros_app] SET  MULTI_USER 
GO
ALTER DATABASE [libros_app] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libros_app] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libros_app] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libros_app] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libros_app] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libros_app] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [libros_app] SET QUERY_STORE = ON
GO
ALTER DATABASE [libros_app] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [libros_app]
GO
/****** Object:  Table [dbo].[libros]    Script Date: 29/6/25 2:08:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[libros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[autor] [nvarchar](255) NOT NULL,
	[imagen] [nvarchar](255) NOT NULL,
	[resumen] [nvarchar](1000) NULL,
	[etiquetas] [nvarchar](255) NULL,
	[disponible] [bit] NULL,
	[vistas] [int] NULL,
	[veces_prestado] [int] NULL,
	[id_usuario] [int] NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[duracion_prestamo_dias] [int] NULL,
	[pdf] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 29/6/25 2:08:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_prestamo] [date] NULL,
	[fecha_devolucion] [date] NULL,
	[estado] [nvarchar](50) NULL,
	[duracion_dias] [int] NULL,
	[devuelto] [bit] NULL,
	[libro_id] [int] NULL,
	[usuario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 29/6/25 2:08:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[correo] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[avatar] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[libros] ON 

INSERT [dbo].[libros] ([id], [titulo], [autor], [imagen], [resumen], [etiquetas], [disponible], [vistas], [veces_prestado], [id_usuario], [slug], [duracion_prestamo_dias], [pdf]) VALUES (18, N'El principito', N'Antoine de Saint exupéry', N'/static/uploads/El-Principito.webp', N'El Principito narra la historia de un piloto que, mientras intenta reparar su avión averiado en medio del desierto del Sahara, se topa con un pequeño príncipe proveniente del asteroide B 612. Él le pide insistentemente que le dibuje un cordero y que nunca olvida una pregunta.', N'', 1, 0, 0, 1, N'el-principito', 21, N'/static/uploads/pdf/el-principito.pdf')
SET IDENTITY_INSERT [dbo].[libros] OFF
GO
SET IDENTITY_INSERT [dbo].[prestamos] ON 

INSERT [dbo].[prestamos] ([id], [fecha_prestamo], [fecha_devolucion], [estado], [duracion_dias], [devuelto], [libro_id], [usuario_id]) VALUES (15, CAST(N'2025-06-27' AS Date), CAST(N'2025-07-18' AS Date), N'activo', 21, 0, 18, 2)
INSERT [dbo].[prestamos] ([id], [fecha_prestamo], [fecha_devolucion], [estado], [duracion_dias], [devuelto], [libro_id], [usuario_id]) VALUES (16, CAST(N'2025-06-27' AS Date), CAST(N'2025-07-18' AS Date), N'activo', 21, 0, 18, 3)
SET IDENTITY_INSERT [dbo].[prestamos] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nombre], [correo], [password], [avatar]) VALUES (1, N'MrCh', N'mrchochito1@gmail.com', N'$2a$10$4C.881RQlJbHQV6F44memOhx.Y5MfNOBpnkJpAvJjCpAxRhxL1lXu', N'/static/img/avatar.png')
INSERT [dbo].[usuarios] ([id], [nombre], [correo], [password], [avatar]) VALUES (2, N'MrChochi', N'mrchochito2@gmail.com', N'$2a$10$tH7H6vcPrgQlK5AaP9SqnueSm2okRA.IzisLPk04pL90FbgBiFYyC', N'/static/img/avatar.png')
INSERT [dbo].[usuarios] ([id], [nombre], [correo], [password], [avatar]) VALUES (3, N'Erick', N'mrchochito3@gmail.com', N'$2a$10$v6/y/P4mtYXw7hNQoMw/v.ekQlf2f4A15SyWdzwFpolu1n/Ykcg56', N'/static/img/avatar.png')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_libros_slug]    Script Date: 29/6/25 2:08:06 ******/
ALTER TABLE [dbo].[libros] ADD  CONSTRAINT [UQ_libros_slug] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__2A586E0B7AAE6C8D]    Script Date: 29/6/25 2:08:06 ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[libros] ADD  DEFAULT ((1)) FOR [disponible]
GO
ALTER TABLE [dbo].[libros] ADD  DEFAULT ((0)) FOR [vistas]
GO
ALTER TABLE [dbo].[libros] ADD  DEFAULT ((0)) FOR [veces_prestado]
GO
ALTER TABLE [dbo].[libros] ADD  DEFAULT ('') FOR [slug]
GO
ALTER TABLE [dbo].[prestamos] ADD  DEFAULT ('activo') FOR [estado]
GO
ALTER TABLE [dbo].[prestamos] ADD  DEFAULT ((0)) FOR [devuelto]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_avatar]  DEFAULT ('/static/img/avatar.png') FOR [avatar]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_prestamos_libros] FOREIGN KEY([libro_id])
REFERENCES [dbo].[libros] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_prestamos_libros]
GO
USE [master]
GO
ALTER DATABASE [libros_app] SET  READ_WRITE 
GO
