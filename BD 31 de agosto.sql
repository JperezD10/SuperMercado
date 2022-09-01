USE [master]
GO
/****** Object:  Database [SuperMercado]    Script Date: 31/8/2022 22:43:19 ******/
CREATE DATABASE [SuperMercado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperMercado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SuperMercado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperMercado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SuperMercado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SuperMercado] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperMercado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperMercado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperMercado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperMercado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperMercado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperMercado] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperMercado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SuperMercado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperMercado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperMercado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperMercado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperMercado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperMercado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperMercado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperMercado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperMercado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SuperMercado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperMercado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperMercado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperMercado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperMercado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperMercado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SuperMercado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperMercado] SET RECOVERY FULL 
GO
ALTER DATABASE [SuperMercado] SET  MULTI_USER 
GO
ALTER DATABASE [SuperMercado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperMercado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SuperMercado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SuperMercado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SuperMercado] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SuperMercado] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SuperMercado', N'ON'
GO
ALTER DATABASE [SuperMercado] SET QUERY_STORE = OFF
GO
USE [SuperMercado]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 31/8/2022 22:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 31/8/2022 22:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[ImgURL] [nvarchar](max) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (1, N'Carnes')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (2, N'Frutas')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (3, N'Verduras')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (4, N'Lacteos')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (5, N'Cereales')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (1, N'Ojo de bife', N'Un buen cacho de 500 gr', N'https://kobebeef.com.ar/media/catalog/product/cache/2/image/670x446/9df78eab33525d08d6e5fb8d27136e95/o/j/ojo_de_bife_1.jpg', 1, 1700)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (2, N'Asado', N'El corte tradicional argentino', N'https://www.laespanola.com.ec/images/thumbs/0003985_asado-de-tira-corte-arg-x-700gr-800gr_500.jpeg', 1, 1300)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (3, N'Manzana', N'La fruta saludable mas conocida', N'https://elegifruta.com.ar/onepage/wp-content/uploads/2017/07/manzana_roja.jpg', 2, 200)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_Precio]  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
/****** Object:  StoredProcedure [dbo].[GetCategorias]    Script Date: 31/8/2022 22:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetCategorias]
as begin
Select * from Categoria
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductos]    Script Date: 31/8/2022 22:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProductos]
as begin
Select * from Producto
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductosPorCategoria]    Script Date: 31/8/2022 22:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProductosPorCategoria]
@idCategoria int
as begin
Select * from Producto where IdCategoria = @idCategoria
end
GO
USE [master]
GO
ALTER DATABASE [SuperMercado] SET  READ_WRITE 
GO
