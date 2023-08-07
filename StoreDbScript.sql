USE [master]
GO
/****** Object:  Database [StoreDb]    Script Date: 31.07.2023 12:51:31 ******/
CREATE DATABASE [StoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoppingDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoppingDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StoreDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [StoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StoreDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [StoreDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StoreDb]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicesDetails]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [money] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[VatRate] [int] NOT NULL,
	[Vat] [money] NULL,
	[Total] [money] NULL,
	[GeneralTotal] [money] NULL,
 CONSTRAINT [PK_InvoicesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[Payment] [money] NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[BarcodNumber] [varchar](50) NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[VatRate] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoicesDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesDetails_Invoices] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([Id])
GO
ALTER TABLE [dbo].[InvoicesDetails] CHECK CONSTRAINT [FK_InvoicesDetails_Invoices]
GO
ALTER TABLE [dbo].[InvoicesDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[InvoicesDetails] CHECK CONSTRAINT [FK_InvoicesDetails_Products]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Invoices] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Invoices]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AddProduct] @name varchar(50), @barcodeNumber varchar(50), @stock int, @price money, @vatRate int

as
begin
insert into Products values (@name, @barcodeNumber, @stock, @price, @vatRate)

end
GO
/****** Object:  StoredProcedure [dbo].[AddShoppingCarts]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AddShoppingCarts] @productId int, @quantity int =1 
as
begin
insert into ShoppingCarts values(@productId, @quantity)
end
GO
/****** Object:  StoredProcedure [dbo].[CompleteShopping]    Script Date: 31.07.2023 12:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompleteShopping]

	@paymentType varchar (50)

AS
BEGIN
DECLARE @invoiceId int;
DECLARE @invoiceNumber varchar(36);
DECLARE @paymentAmount money;

BEGIN TRANSACTION; --birden fazla tabloya kayıt atmak istersek
BEGIN TRY

		--FATURA NUMARASINI RATGELE DÖNÜŞTÜR
		SELECT @invoiceNumber = CAST (NEWID() AS varchar (36));

		--sepetteki toplam tutarı bul
		SELECT @paymentAmount = SUM (((p.Price*sp.Quantity) * p.VatRate/100)+ (p.Price * sp.Quantity))
		FROM dbo.ShoppingCarts  as sp
		JOIN dbo.Products as p ON sp.ProductId=p.Id;

		-- fatura olustur

		INSERT INTO dbo.Invoices (InvoiceNumber, Date)
		VALUES (@invoiceNumber, GETDATE())

		--fatura numarasını al

		SET @invoiceId=SCOPE_IDENTITY ();

		--sepetteki tüm ürünleri fatura detaylarına ekle
		INSERT INTO dbo.InvoicesDetails (ProductId,Quantity, Price, Discount,InvoiceId, VatRate, Vat, Total, GeneralTotal)

		SELECT

			ProductId,
			Quantity,
			Products.Price,
			0,-- indirim oranını belirtin, örnekte indirim uygulanmamaktadır
			@invoiceId,
			Products.VatRate,
			((Products.Price*Quantity) *  Products.VatRate /100) ,
			(Products.Price*Quantity),
			(Products.Price*Quantity) + ((Products.Price*Quantity)* Products.VatRate/100)

		FROM dbo.ShoppingCarts
		JOIN dbo.Products on ShoppingCarts.ProductId=Products.Id

		--ödeme bilgilerini kaydet 

		INSERT INTO dbo.Payments (InvoiceId, Payment, PaymentType)
		VALUES( @invoiceId, @paymentAmount, @paymentType);

		--sepeti temizle
		DELETE FROM dbo.ShoppingCarts;

		COMMIT;

	END TRY

	BEGIN CATCH

	--HATA DURUMMUNDA İŞLEMLERİ GERİ AL
	ROLLBACK;
	THROW; -- HATA BİLGİLERİNİ DÖNDÜR
END CATCH

END;
GO
USE [master]
GO
ALTER DATABASE [StoreDb] SET  READ_WRITE 
GO
