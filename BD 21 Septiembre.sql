USE [master]
GO
/****** Object:  Database [SuperMercado]    Script Date: 21/9/2022 21:32:36 ******/
CREATE DATABASE [SuperMercado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperMercado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LOCALSERVER\MSSQL\DATA\SuperMercado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperMercado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LOCALSERVER\MSSQL\DATA\SuperMercado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SuperMercado] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [SuperMercado] SET  ENABLE_BROKER 
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
EXEC sys.sp_db_vardecimal_storage_format N'SuperMercado', N'ON'
GO
ALTER DATABASE [SuperMercado] SET QUERY_STORE = OFF
GO
USE [SuperMercado]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SuperMercado]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 21/9/2022 21:32:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/9/2022 21:32:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Componente]    Script Date: 21/9/2022 21:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Componente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[esFamilia] [tinyint] NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Digitos]    Script Date: 21/9/2022 21:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digitos](
	[Tabla] [nvarchar](50) NULL,
	[DVV] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentezcoComponente]    Script Date: 21/9/2022 21:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentezcoComponente](
	[idComponentePadre] [int] NULL,
	[idComponenteHijo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 21/9/2022 21:32:37 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/9/2022 21:32:37 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioComponente]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioComponente](
	[idUsuario] [int] NULL,
	[idComponente] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (1, N'Se ha loggeado el usuario LordJuly', CAST(N'2022-09-18T02:12:54.037' AS DateTime), N'LordJuly', -441)
INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (2, N'Se ha loggeado el usuario LordJuly', CAST(N'2022-09-18T02:15:25.187' AS DateTime), N'LordJuly', 634673)
INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (1001, N'Se ha loggeado el usuario Fede1812', CAST(N'2022-09-21T10:53:24.967' AS DateTime), N'Fede1812', 655220)
INSERT [dbo].[Bitacora] ([IdBitacora], [Descripcion], [Fecha], [Usuario], [DVH]) VALUES (1003, N'Se ha loggeado el usuario Fede1812', CAST(N'2022-09-21T21:32:03.917' AS DateTime), N'Fede1812', -366947)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Carnes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Frutas')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Verduras')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Lacteos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Cereales')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Componente] ON 

INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (1, N'Crear Productos', 0, 399400)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (2, N'Crear Categorias', 0, 858057)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (3, N'Modificar Usuario', 0, 173077)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (4, N'Verificar Bitacora', 0, 193968)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (5, N'Verificar Digitos', 0, -341995)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (6, N'Gestion de Usuarios', 1, 556564)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (7, N'Gestion de Seguridad', 1, 365970)
INSERT [dbo].[Componente] ([Id], [Nombre], [esFamilia], [DVH]) VALUES (8, N'Gestion de Productos', 1, 126490)
SET IDENTITY_INSERT [dbo].[Componente] OFF
INSERT [dbo].[Digitos] ([Tabla], [DVV]) VALUES (N'Bitacora', 1289452)
INSERT [dbo].[Digitos] ([Tabla], [DVV]) VALUES (N'Componente', 2331531)
INSERT [dbo].[ParentezcoComponente] ([idComponentePadre], [idComponenteHijo]) VALUES (7, 4)
INSERT [dbo].[ParentezcoComponente] ([idComponentePadre], [idComponenteHijo]) VALUES (7, 5)
INSERT [dbo].[ParentezcoComponente] ([idComponentePadre], [idComponenteHijo]) VALUES (6, 3)
INSERT [dbo].[ParentezcoComponente] ([idComponentePadre], [idComponenteHijo]) VALUES (8, 1)
INSERT [dbo].[ParentezcoComponente] ([idComponentePadre], [idComponenteHijo]) VALUES (8, 2)
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (1, N'Ojo de bife', N'Un buen cacho de 500 gr', N'https://kobebeef.com.ar/media/catalog/product/cache/2/image/670x446/9df78eab33525d08d6e5fb8d27136e95/o/j/ojo_de_bife_1.jpg', 1, 1700)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (2, N'Asado', N'El corte tradicional argentino', N'https://www.laespanola.com.ec/images/thumbs/0003985_asado-de-tira-corte-arg-x-700gr-800gr_500.jpeg', 1, 1300)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (3, N'Manzana', N'La fruta saludable mas conocida', N'https://elegifruta.com.ar/onepage/wp-content/uploads/2017/07/manzana_roja.jpg', 2, 200)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [ImgURL], [IdCategoria], [Precio]) VALUES (4, N'Naranja', N'El mejor citrico', N'https://img.freepik.com/fotos-premium/fruta-naranja-hojas-pared-blanca_253984-3354.jpg?w=2000', 2, 150)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Contraseña]) VALUES (1, N'Julian', N'Perez Demonty', N'LordJuly', N'8c11b08a9c40a00dd6bf98ade257f3188e12d84d6e86c7ae20b9a0bae0d1d0d1')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Contraseña]) VALUES (2, N'Fede', N'Arango', N'Fede1812', N'40789e367033909e1bfc96575774769d52102643fb4a16f1d75ca974103d9f7a')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (2, 6)
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (2, 7)
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (2, 8)
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (1, 6)
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (1, 7)
INSERT [dbo].[UsuarioComponente] ([idUsuario], [idComponente]) VALUES (1, 8)
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_Precio]  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[ParentezcoComponente]  WITH CHECK ADD  CONSTRAINT [FK_ParentezcoComponente_Componente] FOREIGN KEY([idComponentePadre])
REFERENCES [dbo].[Componente] ([Id])
GO
ALTER TABLE [dbo].[ParentezcoComponente] CHECK CONSTRAINT [FK_ParentezcoComponente_Componente]
GO
ALTER TABLE [dbo].[ParentezcoComponente]  WITH CHECK ADD  CONSTRAINT [FK_ParentezcoComponente_Componente1] FOREIGN KEY([idComponenteHijo])
REFERENCES [dbo].[Componente] ([Id])
GO
ALTER TABLE [dbo].[ParentezcoComponente] CHECK CONSTRAINT [FK_ParentezcoComponente_Componente1]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[UsuarioComponente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioComponente_Componente] FOREIGN KEY([idComponente])
REFERENCES [dbo].[Componente] ([Id])
GO
ALTER TABLE [dbo].[UsuarioComponente] CHECK CONSTRAINT [FK_UsuarioComponente_Componente]
GO
ALTER TABLE [dbo].[UsuarioComponente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioComponente_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioComponente] CHECK CONSTRAINT [FK_UsuarioComponente_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[GetCategorias]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetCategorias]
as begin
Select * from Categoria
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductos]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProductos]
as begin
Select * from Producto
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductosPorCategoria]    Script Date: 21/9/2022 21:32:37 ******/
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
/****** Object:  StoredProcedure [dbo].[GrabarBitacora]    Script Date: 21/9/2022 21:32:37 ******/
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
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 21/9/2022 21:32:37 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerBitacora]    Script Date: 21/9/2022 21:32:37 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerComponentesPorFamilia]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerComponentesPorFamilia]
	@idPadre int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT componente.Id, componente.Nombre, componente.esFamilia from dbo.Componente as componente, dbo.ParentezcoComponente as CompParentezco
	where componente.Id = CompParentezco.idComponenteHijo and CompParentezco.idComponentePadre = @idPadre
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDigitosVerificadoresVerticales]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDigitosVerificadoresVerticales]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Digitos
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPermisosRaizUsuario]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerPermisosRaizUsuario]
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT componente.Id, componente.Nombre, componente.esFamilia from dbo.Componente as componente, dbo.UsuarioComponente as userComp
	where componente.Id = userComp.idComponente and userComp.idUsuario = @idusuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTablaBitacora]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerTablaBitacora]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Bitacora
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTablaComponente]    Script Date: 21/9/2022 21:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerTablaComponente] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Componente
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 21/9/2022 21:32:37 ******/
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
/****** Object:  StoredProcedure [dbo].[VerificarExistenciaUsuario]    Script Date: 21/9/2022 21:32:37 ******/
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
