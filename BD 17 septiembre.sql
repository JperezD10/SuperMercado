USE [master]
GO
/****** Object:  Database [SuperMercado]    Script Date: 18/9/2022 02:29:42 ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacora] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [nvarchar](max) NOT NULL,
	[DVH] [int] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[ImgURL] [nvarchar](max) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[Usuario] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (1, N'Se ha loggeado el usuario LordJuly', CAST(N'2022-09-18T02:12:54.037' AS DateTime), N'LordJuly', 949961)
INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (2, N'Se ha loggeado el usuario LordJuly', CAST(N'2022-09-18T02:15:25.187' AS DateTime), N'LordJuly', 551511)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Carnes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Frutas')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Verduras')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Lacteos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Cereales')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (1, N'Ojo de bife', N'Un buen cacho de 500 gr', N'https://kobebeef.com.ar/media/catalog/product/cache/2/image/670x446/9df78eab33525d08d6e5fb8d27136e95/o/j/ojo_de_bife_1.jpg', 1, 1700)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (2, N'Asado', N'El corte tradicional argentino', N'https://www.laespanola.com.ec/images/thumbs/0003985_asado-de-tira-corte-arg-x-700gr-800gr_500.jpeg', 1, 1300)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (3, N'Manzana', N'La fruta saludable mas conocida', N'https://elegifruta.com.ar/onepage/wp-content/uploads/2017/07/manzana_roja.jpg', 2, 200)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (4, N'Naranja', N'El mejor citrico', N'https://img.freepik.com/fotos-premium/fruta-naranja-hojas-pared-blanca_253984-3354.jpg?w=2000', 2, 150)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Contraseña]) VALUES (1, N'Julian', N'Perez Demonty', N'LordJuly', N'8c11b08a9c40a00dd6bf98ade257f3188e12d84d6e86c7ae20b9a0bae0d1d0d1')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_Precio]  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
/****** Object:  StoredProcedure [dbo].[GetCategorias]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetCategorias]
as begin
Select * from Categoria
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductos]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProductos]
as begin
Select * from Producto
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductosPorCategoria]    Script Date: 18/9/2022 02:29:42 ******/
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
/****** Object:  StoredProcedure [dbo].[GrabarBitacora]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GrabarBitacora]
@Descricion nvarchar(1000), @Fecha datetime, @Usuario nvarchar(100), @DVH int
as begin
insert into Bitacora (Descripcion, Fecha, Usuario, DVH) values (@Descricion, @Fecha, @Usuario,@DVH)
end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Login]
@username nvarchar(100), @Password nvarchar(max)
as begin

select * from Usuario where Usuario = @username and @Password = @Password

end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerBitacora]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[ObtenerBitacora]
@FechaDesde datetime = null, @FechaHasta datetime = null
as begin
select * from Bitacora where ((Fecha > =  @FechaDesde) or (@FechaDesde is null)) and (Fecha <=  @FechaHasta or @FechaHasta is null) order by 1 desc
end

GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[RegistrarUsuario]
@Nombre nvarchar(100), @Apellido nvarchar(100),@username nvarchar(100),@Password nvarchar(max)
as begin
insert into Usuario (Nombre, Apellido, Usuario, Contraseña) values (@Nombre, @Apellido, @username, @Password)
end
GO
/****** Object:  StoredProcedure [dbo].[VerificarExistenciaUsuario]    Script Date: 18/9/2022 02:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[VerificarExistenciaUsuario]
@username nvarchar(100)
as begin
select * from Usuario where Usuario = @username
end
GO
USE [master]
GO
ALTER DATABASE [SuperMercado] SET  READ_WRITE 
GO
