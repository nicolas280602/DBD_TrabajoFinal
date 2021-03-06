USE [master]
GO
/****** Object:  Database [LivePills]    Script Date: 01/07/2022 11:52:06 p. m. ******/
CREATE DATABASE [LivePills]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LivePills', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LivePills.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LivePills_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LivePills_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LivePills] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LivePills].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LivePills] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LivePills] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LivePills] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LivePills] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LivePills] SET ARITHABORT OFF 
GO
ALTER DATABASE [LivePills] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LivePills] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LivePills] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LivePills] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LivePills] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LivePills] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LivePills] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LivePills] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LivePills] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LivePills] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LivePills] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LivePills] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LivePills] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LivePills] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LivePills] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LivePills] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LivePills] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LivePills] SET RECOVERY FULL 
GO
ALTER DATABASE [LivePills] SET  MULTI_USER 
GO
ALTER DATABASE [LivePills] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LivePills] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LivePills] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LivePills] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LivePills] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LivePills] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LivePills', N'ON'
GO
ALTER DATABASE [LivePills] SET QUERY_STORE = OFF
GO
USE [LivePills]
GO
/****** Object:  UserDefinedFunction [dbo].[f_ordenes_por_anio]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_ordenes_por_anio] (@year int) returns int
AS 
BEGIN
	DECLARE @Total int
	SELECT  @Total = COUNT(IdOrden) 
	FROM Ordenes 
	WHERE YEAR(Fecha) = @year
	RETURN  @Total 
END;
GO
/****** Object:  Table [dbo].[Carritos]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carritos](
	[IdCarrito] [int] NOT NULL,
	[CantidadAlmacenada] [int] NOT NULL,
	[CostoParcial] [decimal](10, 2) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritosProductos]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritosProductos](
	[IdCarrito] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [CarritosProductos_pk] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](8) NOT NULL,
	[Registrado] [bit] NOT NULL,
	[NombreCompleto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionesClientes]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionesClientes](
	[IdDireccionesClientes] [int] NOT NULL,
	[Region] [varchar](20) NOT NULL,
	[Distrito] [varchar](20) NOT NULL,
	[Direccion] [varchar](20) NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccionesClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionesFarmacias]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionesFarmacias](
	[IdDireccionFarmacia] [int] NOT NULL,
	[Region] [varchar](20) NOT NULL,
	[Distrito] [varchar](20) NOT NULL,
	[Direccion] [text] NOT NULL,
	[IdFarmacia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccionFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmacias]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacias](
	[IdFarmacia] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[NombreFarmacia] [varchar](100) NOT NULL,
	[SitioWeb] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 01/07/2022 11:52:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[IdCliente] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [Favoritos_pk] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibroReclamaciones]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibroReclamaciones](
	[IdLibroReclamacion] [int] NOT NULL,
	[Reclamo] [text] NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLibroReclamacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[IdOrden] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Costo] [decimal](10, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesDetalles](
	[IdOrdenDetalle] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[CostoParcial] [decimal](10, 2) NOT NULL,
	[IdOrden] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrdenDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[Existencias] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](100) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[IdFarmacia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrosTarjetas]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrosTarjetas](
	[IdMetodosPago] [int] NOT NULL,
	[NumeroTarjeta] [bigint] NOT NULL,
	[CVV] [int] NOT NULL,
	[Tipo] [varchar](10) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMetodosPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repartidores]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repartidores](
	[IdRepartidor] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[NombreCompleto] [varchar](100) NOT NULL,
	[DNI] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRepartidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepartidoresOrdenes]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepartidoresOrdenes](
	[IdRepartidor] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
 CONSTRAINT [RepartidoresOrdenes_pk] PRIMARY KEY CLUSTERED 
(
	[IdRepartidor] ASC,
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (1, 111, CAST(13.55 AS Decimal(10, 2)), CAST(87.89 AS Decimal(10, 2)), 16)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (2, 269, CAST(41.68 AS Decimal(10, 2)), CAST(166.29 AS Decimal(10, 2)), 17)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (3, 160, CAST(42.98 AS Decimal(10, 2)), CAST(190.01 AS Decimal(10, 2)), 15)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (4, 259, CAST(1.68 AS Decimal(10, 2)), CAST(146.22 AS Decimal(10, 2)), 19)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (5, 171, CAST(19.52 AS Decimal(10, 2)), CAST(91.86 AS Decimal(10, 2)), 22)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (6, 39, CAST(34.82 AS Decimal(10, 2)), CAST(185.41 AS Decimal(10, 2)), 3)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (7, 146, CAST(56.36 AS Decimal(10, 2)), CAST(48.38 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (8, 113, CAST(28.81 AS Decimal(10, 2)), CAST(37.06 AS Decimal(10, 2)), 11)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (9, 139, CAST(37.19 AS Decimal(10, 2)), CAST(190.27 AS Decimal(10, 2)), 4)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (10, 240, CAST(33.32 AS Decimal(10, 2)), CAST(89.50 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (11, 20, CAST(23.59 AS Decimal(10, 2)), CAST(130.63 AS Decimal(10, 2)), 13)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (12, 217, CAST(46.15 AS Decimal(10, 2)), CAST(80.64 AS Decimal(10, 2)), 26)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (13, 193, CAST(22.98 AS Decimal(10, 2)), CAST(110.03 AS Decimal(10, 2)), 28)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (14, 77, CAST(22.22 AS Decimal(10, 2)), CAST(149.88 AS Decimal(10, 2)), 14)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (15, 226, CAST(30.84 AS Decimal(10, 2)), CAST(84.46 AS Decimal(10, 2)), 13)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (16, 213, CAST(6.23 AS Decimal(10, 2)), CAST(167.36 AS Decimal(10, 2)), 30)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (17, 239, CAST(16.69 AS Decimal(10, 2)), CAST(99.01 AS Decimal(10, 2)), 15)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (18, 14, CAST(15.40 AS Decimal(10, 2)), CAST(123.32 AS Decimal(10, 2)), 20)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (19, 299, CAST(1.77 AS Decimal(10, 2)), CAST(80.49 AS Decimal(10, 2)), 16)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (20, 279, CAST(47.79 AS Decimal(10, 2)), CAST(154.96 AS Decimal(10, 2)), 26)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (21, 178, CAST(53.27 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (22, 155, CAST(4.03 AS Decimal(10, 2)), CAST(159.34 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (23, 146, CAST(16.61 AS Decimal(10, 2)), CAST(132.26 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (24, 130, CAST(2.11 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (25, 280, CAST(26.69 AS Decimal(10, 2)), CAST(36.78 AS Decimal(10, 2)), 6)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (26, 116, CAST(56.94 AS Decimal(10, 2)), CAST(168.74 AS Decimal(10, 2)), 15)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (27, 105, CAST(24.39 AS Decimal(10, 2)), CAST(69.10 AS Decimal(10, 2)), 9)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (28, 216, CAST(41.33 AS Decimal(10, 2)), CAST(191.98 AS Decimal(10, 2)), 24)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (29, 228, CAST(11.73 AS Decimal(10, 2)), CAST(106.55 AS Decimal(10, 2)), 23)
INSERT [dbo].[Carritos] ([IdCarrito], [CantidadAlmacenada], [CostoParcial], [Monto], [IdCliente]) VALUES (30, 254, CAST(56.34 AS Decimal(10, 2)), CAST(85.82 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (1, 14)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (1, 15)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (2, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (2, 7)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (2, 11)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (4, 28)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (6, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (7, 26)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (8, 21)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (8, 28)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (9, 12)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (10, 14)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (10, 29)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (11, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (12, 12)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (13, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (13, 20)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (14, 20)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (14, 30)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (15, 12)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (19, 6)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (19, 17)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (19, 24)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (19, 29)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (22, 16)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (26, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (27, 1)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (27, 15)
INSERT [dbo].[CarritosProductos] ([IdCarrito], [IdProducto]) VALUES (27, 18)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (1, 91517628, N'wtoulamain0@goo.gl', N'sDzwVt90', 1, N'Wyndham Toulamain')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (2, 125237774, N'dbreache1@elpais.com', N'IGBr1RIx', 1, N'Domenic Breache')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (3, 385009019, N'acowlas2@technorati.com', N'1SU2tnJ', 0, N'Aloin Cowlas')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (4, 618663969, N'epauls3@vimeo.com', N'quxin', 1, N'Emmalee Pauls')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (5, 293740671, N'vspofford4@jimdo.com', N'ROHmmc', 1, N'Vonny Spofford')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (6, 718170669, N'gboler5@youtube.com', N'6hOdM', 0, N'Geneva Boler')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (7, 275632806, N'pcathersides6@ebay.co.uk', N'JwMEyHi', 1, N'Petey Cathersides')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (8, 510788256, N'cdaudray7@sphinn.com', N'Edn900t', 0, N'Corrinne Daudray')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (9, 203120470, N'tkenright8@cornell.edu', N'FRyFAs', 1, N'Tam Kenright')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (10, 279473494, N'lyegorshin9@telegraph.co.uk', N'bvSaXC', 0, N'Leif Yegorshin')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (11, 63136661, N'ngianoloa@bizjournals.com', N'XQ2u', 1, N'Nollie Gianolo')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (12, 320571986, N'msharpinb@wisc.edu', N'VJGWp1mf', 0, N'Margie Sharpin')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (13, 671291466, N'lfriedankc@reverbnation.com', N'LDMTRc', 0, N'Laraine Friedank')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (14, 715638950, N'bjinkinsond@hud.gov', N'z8g5er5', 1, N'Brana Jinkinson')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (15, 79364935, N'ecausnette@ebay.com', N'SZLxT40', 0, N'Eugenia Causnett')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (16, 451225647, N'bsibleyf@home.pl', N'5WcF', 0, N'Bran Sibley')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (17, 351119577, N'abrownsillg@sina.com.cn', N'OtMjGsD', 1, N'Alice Brownsill')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (18, 990488799, N'adochonh@livejournal.com', N'lxX3zD', 0, N'Amandie Dochon')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (19, 98338142, N'lfirpoi@about.me', N'tJxzP', 1, N'Lemuel Firpo')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (20, 777699378, N'vleveridgej@freewebs.com', N'OOHsfug', 1, N'Violante Leveridge')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (21, 207215098, N'dsterndalek@japanpost.jp', N'yeSh', 1, N'Dougy Sterndale')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (22, 53268816, N'cpaoluccil@arstechnica.com', N'SuTe', 1, N'Cully Paolucci')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (23, 960435305, N'hspurierm@mozilla.com', N'n4bg', 1, N'Hetti Spurier')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (24, 581995585, N'jpackingtonn@about.com', N'wtvLR', 1, N'Joelynn Packington')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (25, 566485491, N'fzinko@sogou.com', N'H3yJ', 1, N'Fidel Zink')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (26, 875315186, N'ftrimbeyp@ihg.com', N'pr89', 1, N'Frances Trimbey')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (27, 476716892, N'tryalq@spiegel.de', N'sbHZrV', 1, N'Theressa Ryal')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (28, 516535962, N'dcornockr@cocolog-nifty.com', N'vtgnTf0', 1, N'Darb Cornock')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (29, 537296702, N'ymulgrews@cam.ac.uk', N'magJDV7l', 1, N'Yuri Mulgrew')
INSERT [dbo].[Clientes] ([IdCliente], [Telefono], [Correo], [Contrasenia], [Registrado], [NombreCompleto]) VALUES (30, 87649351, N'zwellandt@mit.edu', N'lpSpkB4', 1, N'Zandra Welland')
GO
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (1, N'Toba Tek Singh', N'Brown', N'38 Maywood Park', 16)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (2, N'Châtellerault', N'John Wall', N'98386 Lerdahl Road', 18)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (3, N'Simpang', N'Cordelia', N'330 Vahlen Circle', 22)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (4, N'Tsaghkaber', N'Briar Crest', N'99 Pepper Wood Court', 19)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (5, N'Altay sumu', N'Rigney', N'7 Linden Street', 22)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (6, N'Stavropol’', N'1st', N'532 Elmside Drive', 19)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (7, N'Huangbei', N'Bluestem', N'48 Norway Maple Road', 19)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (8, N'Gaoping', N'Tony', N'922 Becker Plaza', 21)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (9, N'Melfort', N'Portage', N'8 Larry Park', 10)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (10, N'Algueirão', N'Kedzie', N'734 Dwight Way', 2)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (11, N'Santiago', N'Vermont', N'5950 Fisk Circle', 24)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (12, N'Malawag', N'Calypso', N'625 Sullivan Place', 4)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (13, N'Shazi', N'Dennis', N'104 Morrow Junction', 19)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (14, N'Arendal', N'Bonner', N'4 Linden Circle', 8)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (15, N'Martin', N'Eagan', N'5697 Florence Center', 14)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (16, N'Huzhuang', N'Armistice', N'16 Stuart Street', 26)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (17, N'Huai’an', N'Meadow Valley', N'7 Cordelia Circle', 3)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (18, N'Bang Len', N'Sunfield', N'75 International Way', 9)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (19, N'Malimaneek', N'Namekagon', N'23 Rutledge Park', 13)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (20, N'Duba-Yurt', N'Bunker Hill', N'82 Shopko Park', 4)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (21, N'Thompson', N'Judy', N'440 Carberry Point', 8)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (22, N'La Plata', N'Lakewood Gardens', N'6 Lillian Drive', 14)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (23, N'Nsanje', N'Mcguire', N'076 Thackeray Road', 16)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (24, N'Ryazan’', N'Knutson', N'64 Ronald Regan', 24)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (25, N'Ketrzyn', N'Union', N'9 Cherokee Place', 28)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (26, N'Chifeng', N'Annamark', N'771 School Plaza', 25)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (27, N'Sioux Falls', N'Fulton', N'03 Vermont Hill', 9)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (28, N'Banfora', N'Melrose', N'81 Transport Court', 14)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (29, N'Guaraciaba do Norte', N'Ohio', N'50 Menomonie J', 19)
INSERT [dbo].[DireccionesClientes] ([IdDireccionesClientes], [Region], [Distrito], [Direccion], [IdCliente]) VALUES (30, N'Anh Son', N'Meadow Vale', N'33 Thackeray Park', 11)
GO
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (1, N'Xiyang', N'Forest Dale', N'9 Wayridge Trail', 16)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (2, N'Ko Chan', N'Ridge Oak', N'595 Pleasure Place', 18)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (3, N'Johor Bahru', N'Banding', N'659 Larry Crossing', 18)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (4, N'Silae', N'Holy Cross', N'242 Scofield Drive', 13)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (5, N'Gierloz', N'Eggendart', N'8 Delaware Court', 29)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (6, N'Citeureup', N'Prairie Rose', N'8 Eagle Crest Alley', 2)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (7, N'Ust’-Abakan', N'Calypso', N'13391 Commercial Point', 20)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (8, N'Ladozhskaya', N'Toban', N'945 Golden Leaf Alley', 4)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (9, N'Atlanta', N'Sycamore', N'08754 Mandrake Way', 11)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (10, N'Lidingö', N'Commercial', N'21 Macpherson Junction', 15)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (11, N'Kilkenny', N'Heffernan', N'3 Portage Way', 19)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (12, N'Dankunku', N'Toban', N'956 Claremont Place', 7)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (13, N'Annan', N'Bayside', N'0294 Prairie Rose Junction', 14)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (14, N'Luxia', N'Mayfield', N'70519 Oxford Parkway', 14)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (15, N'Adstock', N'Thierer', N'1 Bartelt Park', 14)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (16, N'Igbor', N'Del Mar', N'6068 Express Crossing', 30)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (17, N'Dayuanhuizu', N'Dryden', N'81 Talmadge Trail', 7)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (18, N'Pantubig', N'Green Ridge', N'5954 Butterfield Plaza', 29)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (19, N'Kamal', N'Farwell', N'18454 High Crossing Road', 27)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (20, N'Daitou', N'Coolidge', N'844 Spenser Crossing', 20)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (21, N'Klapagading', N'Colorado', N'9 Sugar Lane', 14)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (22, N'Fenkeng', N'Bashford', N'2 Blaine Place', 6)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (23, N'Pishaj', N'Donald', N'56427 Barby Way', 29)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (24, N'Cordon', N'Golf View', N'3 Hazelcrest Park', 4)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (25, N'Krahës', N'Hagan', N'1159 John Wall Pass', 17)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (26, N'Lousado', N'Sherman', N'6607 Darwin Plaza', 5)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (27, N'Kamárai', N'Buell', N'4766 Northview Terrace', 12)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (28, N'Novi Zagreb', N'Havey', N'941 Roxbury Parkway', 21)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (29, N'Nariño', N'Swallow', N'5 Grover Trail', 16)
INSERT [dbo].[DireccionesFarmacias] ([IdDireccionFarmacia], [Region], [Distrito], [Direccion], [IdFarmacia]) VALUES (30, N'Qingdao', N'Melrose', N'318 Columbus Point', 3)
GO
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (1, 785201998, N'Church & Dwight Co., Inc.', N'japanpost.jp')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (2, 899759, N'Physicians Total Care, Inc.', N'bizjournals.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (3, 244317129, N'BluePoint Laboratories', N'redcross.org')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (4, 972317891, N'Rij Pharmaceutical Corporation', N'github.io')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (5, 974460106, N'Newton Laboratories, Inc.', N'diigo.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (6, 323907420, N'Ventura Corporation LTD', N'xing.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (7, 118259938, N'Nan Mei Pharmaceutical Co., Ltd.', N'cdc.gov')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (8, 656159439, N'Lundbeck LLC', N'army.mil')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (9, 886173166, N'Humco Holding Group, Inc.', N'topsy.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (10, 624445295, N'Physicians Total Care, Inc.', N'japanpost.jp')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (11, 731703111, N'KJI Industrial Co Ltd', N'linkedin.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (12, 789142157, N'Glenmark Generics Inc', N'zdnet.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (13, 342379920, N'Physicians Total Care, Inc.', N'vimeo.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (14, 634943267, N'Sandoz Inc', N'ameblo.jp')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (15, 730661526, N'AMAROS CO., LTD.', N'google.ca')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (16, 56162603, N'McKesson Contract Packaging', N'thetimes.co.uk')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (17, 8806826, N'Cardinal Health', N'slideshare.net')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (18, 701691652, N'Sandoz Inc', N'flickr.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (19, 466650019, N'Sun Pharmaceutical Industries Limited', N'hc360.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (20, 539915156, N'Eon Labs, Inc.', N'paginegialle.it')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (21, 469209542, N'Lake Erie Medical & Surgical Supply DBA Quality Care Products LLC', N'theglobeandmail.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (22, 995846542, N'Caraco Pharmaceutical Laboratories, Ltd.', N'prnewswire.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (23, 224530997, N'ALK-Abello, Inc.', N'marriott.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (24, 614940208, N'McKesson Packaging Services Business Unit of McKesson Corporation', N'china.com.cn')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (25, 469930837, N'Barr Laboratories Inc.', N'techcrunch.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (26, 600064986, N'Fischer Pharmaceuticals Ltd', N'angelfire.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (27, 815656310, N'Meijer Distribution Inc', N'ycombinator.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (28, 331431464, N'Fenwal, Inc.', N'so-net.ne.jp')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (29, 547165003, N'DAVA Pharmaceuticals, Inc.', N'bravesites.com')
INSERT [dbo].[Farmacias] ([IdFarmacia], [Telefono], [NombreFarmacia], [SitioWeb]) VALUES (30, 150536876, N'Chantecaille Beaute Inc', N'mapquest.com')
GO
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (1, 13)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (1, 22)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (2, 25)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (3, 21)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (4, 21)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (4, 26)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (5, 22)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (6, 10)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (7, 4)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (8, 8)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (9, 6)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (11, 28)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (12, 12)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (13, 11)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (13, 21)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (15, 13)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (15, 14)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (18, 27)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (18, 30)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (19, 11)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (21, 25)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (22, 6)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (24, 12)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (25, 30)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (27, 25)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (28, 8)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (29, 12)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (30, 14)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (30, 18)
INSERT [dbo].[Favoritos] ([IdCliente], [IdProducto]) VALUES (30, 27)
GO
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (1, N'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 15)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (2, N'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 21)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (3, N'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque', 28)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (4, N'sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 21)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (5, N'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus', 30)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (6, N'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 16)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (7, N'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 4)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (8, N'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec', 25)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (9, N'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 8)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (10, N'ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra', 7)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (11, N'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla', 30)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (12, N'sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', 1)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (13, N'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 10)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (14, N'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 25)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (15, N'turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 25)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (16, N'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 7)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (17, N'ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 9)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (18, N'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 27)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (19, N'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 23)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (20, N'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat', 10)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (21, N'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 14)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (22, N'neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', 21)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (23, N'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 24)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (24, N'nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus', 23)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (25, N'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo', 2)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (26, N'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci', 6)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (27, N'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat', 24)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (28, N'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa', 28)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (29, N'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus', 1)
INSERT [dbo].[LibroReclamaciones] ([IdLibroReclamacion], [Reclamo], [IdCliente]) VALUES (30, N'nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum', 6)
GO
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (1, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(115.02 AS Decimal(10, 2)), 0, 23)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (2, CAST(N'2021-06-25T00:00:00.000' AS DateTime), CAST(227.05 AS Decimal(10, 2)), 0, 2)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (3, CAST(N'2021-08-05T00:00:00.000' AS DateTime), CAST(106.84 AS Decimal(10, 2)), 1, 29)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (4, CAST(N'2021-12-29T00:00:00.000' AS DateTime), CAST(101.78 AS Decimal(10, 2)), 1, 21)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (5, CAST(N'2021-11-29T00:00:00.000' AS DateTime), CAST(218.91 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (6, CAST(N'2022-01-04T00:00:00.000' AS DateTime), CAST(181.21 AS Decimal(10, 2)), 0, 23)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (7, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(136.38 AS Decimal(10, 2)), 1, 26)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (8, CAST(N'2021-07-10T00:00:00.000' AS DateTime), CAST(184.67 AS Decimal(10, 2)), 1, 16)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (9, CAST(N'2022-06-13T00:00:00.000' AS DateTime), CAST(186.23 AS Decimal(10, 2)), 0, 28)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (10, CAST(N'2021-10-06T00:00:00.000' AS DateTime), CAST(182.51 AS Decimal(10, 2)), 0, 29)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (11, CAST(N'2021-09-30T00:00:00.000' AS DateTime), CAST(185.36 AS Decimal(10, 2)), 0, 20)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (12, CAST(N'2022-06-13T00:00:00.000' AS DateTime), CAST(108.54 AS Decimal(10, 2)), 1, 17)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (13, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(183.28 AS Decimal(10, 2)), 0, 14)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (14, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(151.49 AS Decimal(10, 2)), 0, 6)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (15, CAST(N'2021-12-02T00:00:00.000' AS DateTime), CAST(196.11 AS Decimal(10, 2)), 1, 25)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (16, CAST(N'2022-03-15T00:00:00.000' AS DateTime), CAST(255.37 AS Decimal(10, 2)), 0, 19)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (17, CAST(N'2021-11-27T00:00:00.000' AS DateTime), CAST(103.30 AS Decimal(10, 2)), 0, 3)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (18, CAST(N'2022-04-24T00:00:00.000' AS DateTime), CAST(177.45 AS Decimal(10, 2)), 0, 29)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (19, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(146.13 AS Decimal(10, 2)), 1, 17)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (20, CAST(N'2022-06-22T00:00:00.000' AS DateTime), CAST(274.91 AS Decimal(10, 2)), 0, 11)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (21, CAST(N'2021-10-09T00:00:00.000' AS DateTime), CAST(137.79 AS Decimal(10, 2)), 0, 25)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (22, CAST(N'2021-09-28T00:00:00.000' AS DateTime), CAST(113.29 AS Decimal(10, 2)), 0, 5)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (23, CAST(N'2021-12-10T00:00:00.000' AS DateTime), CAST(191.43 AS Decimal(10, 2)), 1, 11)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (24, CAST(N'2022-04-24T00:00:00.000' AS DateTime), CAST(214.36 AS Decimal(10, 2)), 0, 10)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (25, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(245.44 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (26, CAST(N'2022-04-09T00:00:00.000' AS DateTime), CAST(120.12 AS Decimal(10, 2)), 1, 5)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (27, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(130.28 AS Decimal(10, 2)), 0, 27)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (28, CAST(N'2022-06-11T00:00:00.000' AS DateTime), CAST(177.93 AS Decimal(10, 2)), 1, 26)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (29, CAST(N'2021-10-11T00:00:00.000' AS DateTime), CAST(122.99 AS Decimal(10, 2)), 0, 15)
INSERT [dbo].[Ordenes] ([IdOrden], [Fecha], [Costo], [Estado], [IdCliente]) VALUES (30, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(200.47 AS Decimal(10, 2)), 1, 2)
GO
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (1, 213, CAST(141.45 AS Decimal(10, 2)), 8, 8)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (2, 270, CAST(433.05 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (3, 279, CAST(291.48 AS Decimal(10, 2)), 6, 9)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (4, 222, CAST(126.55 AS Decimal(10, 2)), 29, 30)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (5, 137, CAST(364.27 AS Decimal(10, 2)), 5, 7)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (6, 138, CAST(495.82 AS Decimal(10, 2)), 9, 2)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (7, 206, CAST(281.69 AS Decimal(10, 2)), 15, 13)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (8, 228, CAST(112.86 AS Decimal(10, 2)), 7, 3)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (9, 177, CAST(219.76 AS Decimal(10, 2)), 18, 18)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (10, 108, CAST(150.38 AS Decimal(10, 2)), 30, 20)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (11, 127, CAST(262.08 AS Decimal(10, 2)), 28, 26)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (12, 143, CAST(478.63 AS Decimal(10, 2)), 9, 15)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (13, 349, CAST(403.93 AS Decimal(10, 2)), 18, 21)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (14, 215, CAST(419.67 AS Decimal(10, 2)), 26, 16)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (15, 129, CAST(471.45 AS Decimal(10, 2)), 9, 7)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (16, 210, CAST(328.65 AS Decimal(10, 2)), 19, 30)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (17, 287, CAST(167.54 AS Decimal(10, 2)), 21, 2)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (18, 136, CAST(108.16 AS Decimal(10, 2)), 16, 5)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (19, 116, CAST(426.41 AS Decimal(10, 2)), 5, 29)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (20, 222, CAST(466.17 AS Decimal(10, 2)), 8, 12)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (21, 146, CAST(445.01 AS Decimal(10, 2)), 24, 27)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (22, 166, CAST(444.51 AS Decimal(10, 2)), 29, 7)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (23, 250, CAST(420.98 AS Decimal(10, 2)), 15, 5)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (24, 339, CAST(186.52 AS Decimal(10, 2)), 27, 8)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (25, 217, CAST(256.56 AS Decimal(10, 2)), 16, 23)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (26, 350, CAST(165.52 AS Decimal(10, 2)), 17, 26)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (27, 324, CAST(126.80 AS Decimal(10, 2)), 19, 15)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (28, 275, CAST(247.45 AS Decimal(10, 2)), 19, 15)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (29, 331, CAST(366.35 AS Decimal(10, 2)), 23, 19)
INSERT [dbo].[OrdenesDetalles] ([IdOrdenDetalle], [Cantidad], [CostoParcial], [IdOrden], [IdProducto]) VALUES (30, 342, CAST(425.81 AS Decimal(10, 2)), 21, 23)
GO
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (1, 303, N'LIDOCAINE HYDROCHLORIDE ANHYDROUS', N'Generic', N'Lidocaine Hydrochloride', CAST(161.55 AS Decimal(10, 2)), 1)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (2, 306, N'atorvastatin calcium', N'Original', N'Atorvastatin Calcium', CAST(199.26 AS Decimal(10, 2)), 6)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (3, 311, N'Benzethonium chloride', N'Generic', N'Gold Bond Ultimate Hand Sanitizer Sheer Moisture', CAST(221.67 AS Decimal(10, 2)), 27)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (4, 285, N'YTTRIUM BROMIDE', N'Original', N'HAHNEMANN COLDS', CAST(229.42 AS Decimal(10, 2)), 1)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (5, 242, N'Triclosan', N'Generic', N'Hand Kleen Premium', CAST(270.45 AS Decimal(10, 2)), 30)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (6, 118, N'Ribavirin', N'Original', N'Ribavirin', CAST(287.74 AS Decimal(10, 2)), 2)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (7, 188, N'HELIOX', N'Original', N'HELIOX', CAST(156.69 AS Decimal(10, 2)), 23)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (8, 329, N'Aluminum Zirconium Tetrachlorohydrex GLY', N'Generic', N'Degree Clinical Protection Cool Rush', CAST(141.54 AS Decimal(10, 2)), 30)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (9, 155, N'Misoprostol', N'Generic', N'Misoprostol', CAST(198.08 AS Decimal(10, 2)), 9)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (10, 312, N'Ibuprofen', N'Original', N'Ibuprofen', CAST(15.20 AS Decimal(10, 2)), 4)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (11, 265, N'WITCH HAZEL', N'Original', N'Witch Hazel', CAST(289.29 AS Decimal(10, 2)), 18)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (12, 345, N'Risperidone', N'Original', N'Risperidone', CAST(214.02 AS Decimal(10, 2)), 12)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (13, 175, N'Aspergillus terreus', N'Generic', N'Aspergillus terreus', CAST(161.72 AS Decimal(10, 2)), 17)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (14, 181, N'Ondansetron Hydrochloride', N'Original', N'Ondansetron Hydrochloride', CAST(49.92 AS Decimal(10, 2)), 1)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (15, 302, N'Simvastatin', N'Original', N'Simvastatin', CAST(248.26 AS Decimal(10, 2)), 4)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (16, 161, N'ISOPROPYL ALCOHOL', N'Generic', N'MK Alcohol Prep Pads Large', CAST(204.41 AS Decimal(10, 2)), 1)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (17, 106, N'Alfalfa, Laminaria digitata, Symphytum officinale, Ascorbic acid, Melatonin', N'Original', N'EMF Protect and Balance', CAST(222.12 AS Decimal(10, 2)), 25)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (18, 292, N'Loratadine', N'Generic', N'Loratadine', CAST(58.20 AS Decimal(10, 2)), 28)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (19, 316, N'Avobenzone, Homosalate, Octisalate, and Oxybenzone', N'Original', N'Coppertone Sport AccuSpray', CAST(104.31 AS Decimal(10, 2)), 15)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (20, 157, N'Fexofenadine Hydrochloride', N'Generic', N'Fexofenadine Hydrochloride', CAST(196.25 AS Decimal(10, 2)), 13)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (21, 227, N'OCTINOXATE, OCTISALATE, OCTOCRYLENE, ENSULIZOLE, TITANIUM DIOXIDE, OXYBENZONE', N'Generic', N'Sephora Super Lisseur Rides SPF 15 Age Defy Moisture', CAST(67.95 AS Decimal(10, 2)), 15)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (22, 306, N'Entacapone', N'Original', N'Entacapone', CAST(122.25 AS Decimal(10, 2)), 20)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (23, 220, N'Bryonia , Ruta graveolens, Bellis perennis, Argentum metallicum,', N'Original', N'Tendon Rescue', CAST(40.49 AS Decimal(10, 2)), 8)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (24, 344, N'Mefloquine Hydrochloride', N'Generic', N'Mefloquine Hydrochloride', CAST(23.79 AS Decimal(10, 2)), 6)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (25, 303, N'Breatheze', N'Generic', N'Breatheze', CAST(215.30 AS Decimal(10, 2)), 9)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (26, 282, N'Acetaminophen', N'Original', N'Extra Strength Pain Relief', CAST(96.59 AS Decimal(10, 2)), 18)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (27, 295, N'Isosorbide Mononitrate', N'Original', N'Isosorbide Mononitrate', CAST(152.25 AS Decimal(10, 2)), 4)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (28, 306, N'Losartan Potassium', N'Original', N'Losartan Potassium', CAST(164.39 AS Decimal(10, 2)), 24)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (29, 321, N'Nicotine Polacrilex', N'Generic', N'Up and Up nicotine', CAST(250.17 AS Decimal(10, 2)), 4)
INSERT [dbo].[Productos] ([IdProducto], [Existencias], [Nombre], [Tipo], [Marca], [Precio], [IdFarmacia]) VALUES (30, 248, N'Pantoprazole Sodium', N'Original', N'Pantoprazole Sodium', CAST(76.55 AS Decimal(10, 2)), 7)
GO
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (1, 5048370101570281, 773, N'Debito', CAST(N'2021-11-09T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (2, 5048379495982309, 416, N'Debito', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (3, 4041374570117467, 421, N'Credito', CAST(N'2021-07-28T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (4, 5048379885134750, 346, N'Debito', CAST(N'2021-08-05T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (5, 5048375566541438, 723, N'Credito', CAST(N'2022-06-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (6, 4017953861649880, 615, N'Debito', CAST(N'2022-04-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (7, 4017956761936, 628, N'Debito', CAST(N'2022-02-09T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (8, 5108755894534915, 466, N'Credito', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (9, 4017953296833034, 404, N'Credito', CAST(N'2022-02-09T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (10, 4017955318464, 456, N'Debito', CAST(N'2022-05-04T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (11, 4041370777881236, 630, N'Credito', CAST(N'2021-08-28T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (12, 4041379131873, 702, N'Debito', CAST(N'2021-12-14T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (13, 5048374362491211, 984, N'Credito', CAST(N'2022-02-12T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (14, 5108752804698740, 515, N'Credito', CAST(N'2022-06-07T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (15, 5108753757362813, 376, N'Debito', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (16, 4017951975028, 578, N'Credito', CAST(N'2021-12-12T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (17, 4017952311097666, 433, N'Debito', CAST(N'2021-08-15T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (18, 4017956254209154, 362, N'Debito', CAST(N'2022-03-27T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (19, 5048374679769911, 818, N'Debito', CAST(N'2022-06-10T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (20, 4017951777986, 418, N'Debito', CAST(N'2022-01-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (21, 4041370915449482, 353, N'Credito', CAST(N'2021-11-13T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (22, 4017950420091, 368, N'Credito', CAST(N'2022-01-22T00:00:00.000' AS DateTime), 29)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (23, 4041371440013983, 322, N'Debito', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (24, 4017957926659651, 608, N'Debito', CAST(N'2021-07-26T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (25, 4017956360580, 441, N'Credito', CAST(N'2021-12-13T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (26, 5108752077971303, 758, N'Credito', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (27, 4017957062649, 350, N'Credito', CAST(N'2021-11-23T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (28, 4017950099358, 952, N'Debito', CAST(N'2022-05-27T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (29, 4017954359450294, 531, N'Debito', CAST(N'2022-01-14T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[RegistrosTarjetas] ([IdMetodosPago], [NumeroTarjeta], [CVV], [Tipo], [Fecha], [IdCliente]) VALUES (30, 4017952107498, 660, N'Credito', CAST(N'2021-12-13T00:00:00.000' AS DateTime), 12)
GO
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (1, 634579889, N'Sonia Foker', N'48951823')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (2, 769844937, N'Wally Doncaster', N'04069050')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (3, 892174432, N'Afton Fallow', N'65601765')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (4, 733596614, N'Coreen Jekyll', N'52755200')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (5, 543249824, N'Katlin Jorio', N'41163213')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (6, 490777600, N'Carmelina Insole', N'65360107')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (7, 337227003, N'Pearla Persicke', N'54868373')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (8, 55304708, N'Alejoa Labeuil', N'51655900')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (9, 589655432, N'Moselle Drivers', N'52085002')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (10, 585181625, N'Mersey Mickelwright', N'65841670')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (11, 284612422, N'Liane Bonallick', N'37808915')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (12, 615386143, N'Alvy Cadamy', N'00934137')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (13, 784008605, N'Janeta Tarborn', N'10544590')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (14, 353213471, N'Jedediah Read', N'43598004')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (15, 146794481, N'Jorgan Hearnah', N'07811053')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (16, 601979399, N'Natasha Billett', N'52533170')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (17, 844064644, N'Fey Scoles', N'67253462')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (18, 851553436, N'Heriberto Dykes', N'54977516')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (19, 84994285, N'Mikkel Costanza', N'42220003')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (20, 103610130, N'Ronna Render', N'54866280')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (21, 395669644, N'Zebedee Barringer', N'41163422')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (22, 841196381, N'Avery Dyball', N'00780327')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (23, 187656950, N'Marena Kilbey', N'60846517')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (24, 194426603, N'Melodee Heathorn', N'40040037')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (25, 446768956, N'Krystalle Eitter', N'63667957')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (26, 776838191, N'Obadias Morrice', N'32909727')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (27, 100343307, N'Ange Mattock', N'02681530')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (28, 148885185, N'Cassey Dawidsohn', N'02686697')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (29, 170751478, N'Timmie Fowlds', N'04096482')
INSERT [dbo].[Repartidores] ([IdRepartidor], [Telefono], [NombreCompleto], [DNI]) VALUES (30, 474490820, N'Ysabel Hofer', N'37000044')
GO
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (1, 18)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (1, 19)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (3, 30)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (8, 27)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (9, 15)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (9, 25)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (9, 28)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (10, 15)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (11, 1)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (11, 18)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (12, 10)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (12, 12)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (12, 26)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (12, 27)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (13, 8)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (13, 20)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (14, 16)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (16, 19)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (18, 13)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (19, 5)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (21, 3)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (21, 29)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (22, 28)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (23, 12)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (23, 17)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (24, 30)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (25, 22)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (26, 29)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (28, 20)
INSERT [dbo].[RepartidoresOrdenes] ([IdRepartidor], [IdOrden]) VALUES (29, 10)
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[CarritosProductos]  WITH CHECK ADD FOREIGN KEY([IdCarrito])
REFERENCES [dbo].[Carritos] ([IdCarrito])
GO
ALTER TABLE [dbo].[CarritosProductos]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DireccionesClientes]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[DireccionesFarmacias]  WITH CHECK ADD FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacias] ([IdFarmacia])
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[LibroReclamaciones]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Ordenes] ([IdOrden])
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacias] ([IdFarmacia])
GO
ALTER TABLE [dbo].[RegistrosTarjetas]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[RepartidoresOrdenes]  WITH CHECK ADD FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Ordenes] ([IdOrden])
GO
ALTER TABLE [dbo].[RepartidoresOrdenes]  WITH CHECK ADD FOREIGN KEY([IdRepartidor])
REFERENCES [dbo].[Repartidores] ([IdRepartidor])
GO
/****** Object:  StoredProcedure [dbo].[sp_Cantidad_by_Nombre]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cantidad_by_Nombre]  @nombre VARCHAR(50)
	AS
	BEGIN
		SELECT NombreCompleto , O.IdOrden, Cantidad
		FROM Ordenes 
				join Clientes C on C.IdCliente=Ordenes.IdCliente 
				join OrdenesDetalles O on O.IdOrden= Ordenes.IdOrden
		WHERE c.NombreCompleto=@nombre;
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_Direcciones_by_NombreFarmacia]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Direcciones_by_NombreFarmacia]  @nombre VARCHAR(50)
	AS
	BEGIN
		SELECT NombreFarmacia,Direccion,Region
		FROM DireccionesFarmacias
			join Farmacias f on f.IdFarmacia=DireccionesFarmacias.IdFarmacia
		WHERE f.NombreFarmacia=@nombre;
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_direcciones_farmacias_by_id]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_direcciones_farmacias_by_id] @idFarmacia INT
AS
BEGIN 
	SELECT Region
	FROM Farmacias f
		JOIN DireccionesFarmacias df ON df.IdFarmacia = f.IdFarmacia
	WHERE f.IdFarmacia = @idFarmacia
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EstadoProducto_by_Nombre]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EstadoProducto_by_Nombre] @NombreCompleto VARCHAR(50)
AS
    Begin
        SELECT Estado FROM Ordenes
        JOIN Clientes C on C.IdCliente = Ordenes.IdCliente
        where @NombreCompleto=NombreCompleto;
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_Fecha_by_Nombre]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Fecha_by_Nombre] @nombre VARCHAR(50)
AS
BEGIN
	SELECT Fecha 
	FROM Ordenes 
		join Clientes C on C.IdCliente=Ordenes.IdCliente
	WHERE c.NombreCompleto=@nombre;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Ingresos_by_Fecha]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Ingresos_by_Fecha]
@FechaMin datetime,
@FechaMax datetime
AS
BEGIN
	SELECT COUNT(O.Costo) AS NumOrdenes, SUM(O.Costo) AS CostoTotal, (SUM(O.Costo)/COUNT(O.Costo)) AS PromedioxOrden
	FROM Ordenes O
	WHERE O.Fecha > CAST(@FechaMin AS datetime) AND O.Fecha < CAST(@FechaMax AS datetime) AND O.Estado = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Nombreproductos_by_NombreFarmacia]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Nombreproductos_by_NombreFarmacia]  @nombre VARCHAR(50)
	AS
	BEGIN
		SELECT NombreFarmacia, Nombre
		FROM  Productos
			join Farmacias p on p.IdFarmacia= Productos.IdFarmacia
		WHERE p.NombreFarmacia=@nombre;
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_Precio_for_Precio1]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_Precio_for_Precio1]
@Cantidad INT
AS
BEGIN
	SELECT Nombre,Precio From Productos 
	Where @Cantidad<Precio;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Precio_for_Precio2]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_Precio_for_Precio2]
@Cantidad INT
AS
BEGIN
	SELECT Nombre,Precio From Productos 
	Where @Cantidad>Precio;
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Productos_for_Cantidad]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_Productos_for_Cantidad]
AS
BEGIN
	SELECT  Farmacias.NombreFarmacia as Farmacia, COUNT(Farmacias.IdFarmacia) AS NumProductos
	From Productos 
		JOIN Farmacias on Productos.IdFarmacia= Farmacias.IdFarmacia
	GROUP BY NombreFarmacia
	ORDER BY NumProductos DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reclamaciones_by_clientes]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_reclamaciones_by_clientes] @idCliente INT
           AS
           BEGIN
    SELECT Reclamo FROM LibroReclamaciones
    where IdCliente=@idCliente;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Reclamos_by_NombreClientes]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Reclamos_by_NombreClientes] @NombreCompleto VARCHAR(50)
           AS
           BEGIN
               SELECT Reclamo
               FROM LibroReclamaciones
               join Clientes C on C.IdCliente = LibroReclamaciones.IdCliente
               WHERE NombreCompleto=@NombreCompleto;
           end
GO
/****** Object:  StoredProcedure [dbo].[sp_TopNumClientes_by_Distrito]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TopNumClientes_by_Distrito]
AS
BEGIN
	SELECT DC.Distrito, COUNT(DC.Distrito) AS NumClientes
	FROM DireccionesClientes DC
	GROUP BY DC.Distrito
	ORDER BY NumClientes DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TopProductos_by_Fecha]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TopProductos_by_Fecha]
@FechaMin datetime,
@FechaMax datetime
AS
BEGIN
	SELECT SUM(OD.Cantidad) AS CantidadTotal, P.IdProducto, P.Nombre , F.NombreFarmacia
	FROM OrdenesDetalles OD
		JOIN Ordenes O ON O.IdOrden = OD.IdOrden
		JOIN Productos P ON P.IdProducto = OD.IdProducto
		JOIN Farmacias F ON F.IdFarmacia = P.IdFarmacia
	WHERE O.Fecha > CAST(@FechaMin AS datetime) AND O.Fecha < CAST(@FechaMax AS datetime)
	GROUP BY P.Nombre, F.NombreFarmacia, P.IdProducto
	ORDER BY CantidadTotal DESC
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TopRepartidores_by_Fecha]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TopRepartidores_by_Fecha]
@FechaMin datetime,
@FechaMax datetime
AS
BEGIN
	SELECT R.NombreCompleto, COUNT(R.NombreCompleto) AS NumEntregas, SUM(O.Costo) AS TotalFacturado
	FROM RepartidoresOrdenes RO
		JOIN Repartidores R ON R.IdRepartidor = RO.IdRepartidor
		JOIN Ordenes O ON O.IdOrden = RO.IdOrden
	WHERE O.Fecha > CAST(@FechaMin AS datetime) AND O.Fecha < CAST(@FechaMax AS datetime) AND O.Estado = 1
	GROUP BY R.NombreCompleto
	ORDER BY TotalFacturado DESC
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalReclamos_by_NombreCompleto]    Script Date: 01/07/2022 11:52:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TotalReclamos_by_NombreCompleto] @NombreCompleto VARCHAR(50)
   AS
    BEGIN
       SELECT COUNT(IdLibroReclamacion)
        FROM LibroReclamaciones
       JOIN Clientes C on C.IdCliente = LibroReclamaciones.IdCliente
        WHERE @NombreCompleto=NombreCompleto;
    END
GO
USE [master]
GO
ALTER DATABASE [LivePills] SET  READ_WRITE 
GO
