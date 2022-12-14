USE [master]
GO
/****** Object:  Database [cjfgbcopichinchatest]  ******/
CREATE DATABASE [cjfgbcopichinchatest]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cjfgbcopichinchatest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ARITHABORT OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET RECOVERY FULL 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET  MULTI_USER 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cjfgbcopichinchatest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cjfgbcopichinchatest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cjfgbcopichinchatest', N'ON'
GO
ALTER DATABASE [cjfgbcopichinchatest] SET QUERY_STORE = OFF
GO
USE [cjfgbcopichinchatest]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 9/5/2022 2:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Estado] [bit] NOT NULL,
	[PersonaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 9/5/2022 2:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[CuentaId] [uniqueidentifier] NOT NULL,
	[NumeroCuenta] [nvarchar](15) NOT NULL,
	[TipoCuenta] [nvarchar](15) NOT NULL,
	[SaldoInicial] [decimal](18, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 9/5/2022 2:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[MovimientoId] [uniqueidentifier] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[TipoMovimiento] [nvarchar](max) NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Saldo] [decimal](18, 2) NOT NULL,
	[CuentaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[MovimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 9/5/2022 2:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[PersonaId] [uniqueidentifier] NOT NULL,
	[Nombres] [nvarchar](120) NOT NULL,
	[Genero] [nvarchar](9) NOT NULL,
	[Edad] [int] NOT NULL,
	[Identificacion] [nvarchar](13) NOT NULL,
	[Direccion] [nvarchar](250) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cliente_PersonaId]    Script Date: 9/5/2022 2:25:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cliente_PersonaId] ON [dbo].[Cliente]
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cuenta_ClienteId]    Script Date: 9/5/2022 2:25:25 ******/
CREATE NONCLUSTERED INDEX [IX_Cuenta_ClienteId] ON [dbo].[Cuenta]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cuenta_NumeroCuenta]    Script Date: 9/5/2022 2:25:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cuenta_NumeroCuenta] ON [dbo].[Cuenta]
(
	[NumeroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movimiento_CuentaId]    Script Date: 9/5/2022 2:25:25 ******/
CREATE NONCLUSTERED INDEX [IX_Movimiento_CuentaId] ON [dbo].[Movimiento]
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Persona_Identificacion]    Script Date: 9/5/2022 2:25:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Persona_Identificacion] ON [dbo].[Persona]
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Persona_PersonaId] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Persona] ([PersonaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Persona_PersonaId]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_Cuenta_CuentaId] FOREIGN KEY([CuentaId])
REFERENCES [dbo].[Cuenta] ([CuentaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_Cuenta_CuentaId]
GO
USE [master]
GO
ALTER DATABASE [cjfgbcopichinchatest] SET  READ_WRITE 
GO
