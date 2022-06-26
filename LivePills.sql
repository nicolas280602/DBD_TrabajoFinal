USE [master]
GO
/****** Object:  Database [LivePills]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Carritos]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[CarritosProductos]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[DireccionesClientes]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[DireccionesFarmacias]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Farmacias]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Favoritos]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[LibroReclamaciones]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Ordenes]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[RegistrosTarjetas]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[Repartidores]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
/****** Object:  Table [dbo].[RepartidoresOrdenes]    Script Date: 23/06/2022 11:03:36 p. m. ******/
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
USE [master]
GO
ALTER DATABASE [LivePills] SET  READ_WRITE 
GO
