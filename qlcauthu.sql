USE [master]
GO
/****** Object:  Database [qlbongda1065]    Script Date: 20/02/2024 6:08:37 CH ******/
CREATE DATABASE [qlbongda1065]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlbongda1065', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\qlbongda1065.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qlbongda1065_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\qlbongda1065_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [qlbongda1065] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlbongda1065].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlbongda1065] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlbongda1065] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlbongda1065] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlbongda1065] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlbongda1065] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlbongda1065] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qlbongda1065] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlbongda1065] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlbongda1065] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlbongda1065] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlbongda1065] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlbongda1065] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlbongda1065] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlbongda1065] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlbongda1065] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qlbongda1065] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlbongda1065] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlbongda1065] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlbongda1065] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlbongda1065] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlbongda1065] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlbongda1065] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlbongda1065] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qlbongda1065] SET  MULTI_USER 
GO
ALTER DATABASE [qlbongda1065] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlbongda1065] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlbongda1065] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlbongda1065] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qlbongda1065] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qlbongda1065] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [qlbongda1065] SET QUERY_STORE = OFF
GO
USE [qlbongda1065]
GO
/****** Object:  Table [dbo].[tblBanThang]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanThang](
	[ID_BanThang] [nvarchar](20) NOT NULL,
	[ID_Tran] [nvarchar](20) NULL,
	[ID_CauThu] [nvarchar](20) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [pk_bt] PRIMARY KEY CLUSTERED 
(
	[ID_BanThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCauThu]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCauThu](
	[ID_CauThu] [nvarchar](20) NOT NULL,
	[ID_CLB] [nvarchar](20) NULL,
	[HOTEN] [nvarchar](40) NULL,
	[NGAYSINH] [date] NULL,
	[VITRI] [nvarchar](20) NULL,
	[SOAO] [nvarchar](10) NULL,
	[ANH] [nvarchar](100) NULL,
	[QuocTich] [nvarchar](30) NULL,
 CONSTRAINT [pk_ct] PRIMARY KEY CLUSTERED 
(
	[ID_CauThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCLB]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCLB](
	[ID_CLB] [nvarchar](20) NOT NULL,
	[TenCLB] [nvarchar](40) NULL,
	[TenSVD] [nvarchar](20) NULL,
	[LogoCLB] [nvarchar](20) NULL,
	[ID_QuocGia] [nvarchar](20) NULL,
 CONSTRAINT [pk_clb] PRIMARY KEY CLUSTERED 
(
	[ID_CLB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiaiDau]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiaiDau](
	[ID_GiaiDau] [nvarchar](20) NOT NULL,
	[TenGiaiDau] [nvarchar](60) NULL,
 CONSTRAINT [pk_gdt] PRIMARY KEY CLUSTERED 
(
	[ID_GiaiDau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHLV]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHLV](
	[ID_HLV] [nvarchar](20) NOT NULL,
	[Ten_HLV] [nvarchar](20) NULL,
	[ID_CLB] [nvarchar](20) NULL,
	[NGAYSINH] [date] NULL,
	[QUOCTICH] [nvarchar](20) NULL,
	[Anh] [nvarchar](30) NULL,
 CONSTRAINT [pk_hlv] PRIMARY KEY CLUSTERED 
(
	[ID_HLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuocGia]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuocGia](
	[ID_Quocgia] [nvarchar](20) NOT NULL,
	[TenQuocGia] [nvarchar](20) NULL,
 CONSTRAINT [pk_qg] PRIMARY KEY CLUSTERED 
(
	[ID_Quocgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTranDau]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTranDau](
	[ID_Tran] [nvarchar](20) NOT NULL,
	[Gio_TD] [time](7) NULL,
	[Ngaythidau] [date] NULL,
	[DoiNha] [nvarchar](20) NULL,
	[DoiKhach] [nvarchar](20) NULL,
	[KetQua] [nvarchar](20) NULL,
	[GiaiDau] [nvarchar](20) NULL,
 CONSTRAINT [pk_td] PRIMARY KEY CLUSTERED 
(
	[ID_Tran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 20/02/2024 6:08:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID_USER] [nvarchar](20) NOT NULL,
	[HOTEN] [nvarchar](40) NULL,
	[DCHI] [nvarchar](50) NULL,
	[SODT] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](20) NULL,
	[PASS] [nvarchar](50) NULL,
	[IS_USER] [int] NULL,
	[IS_ADMIN] [int] NULL,
 CONSTRAINT [pk_kh] PRIMARY KEY CLUSTERED 
(
	[ID_USER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBanThang] ([ID_BanThang], [ID_Tran], [ID_CauThu], [ThoiGian]) VALUES (N'Bt01', N'TD07', N'023', CAST(N'2023-04-15T05:18:00.000' AS DateTime))
INSERT [dbo].[tblBanThang] ([ID_BanThang], [ID_Tran], [ID_CauThu], [ThoiGian]) VALUES (N'Bt02', N'TD07', N'024', CAST(N'2023-04-15T05:45:00.000' AS DateTime))
INSERT [dbo].[tblBanThang] ([ID_BanThang], [ID_Tran], [ID_CauThu], [ThoiGian]) VALUES (N'dsad', N'TD07', N'026', CAST(N'2023-04-15T17:58:00.000' AS DateTime))
GO
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'001', N'A1001', N'Marcus Rashford111', CAST(N'1997-10-31' AS Date), N'Tiền đạo', N'10', N'1.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'002', N'A1001', N'Jadon Sancho', CAST(N'2000-03-25' AS Date), N'Tiền đạo', N'25', N'2.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'003', N'A1001', N'Anthony Martial', CAST(N'1995-12-05' AS Date), N'Tiền đạo', N'19', N'3.jpg', N'Brazil')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'004', N'A1001', N'Casemiro', CAST(N'1993-02-23' AS Date), N'Tiền vệ', N'13', N'4.jpg', N'Brazil')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'005', N'A1001', N'Bruno Fernandes', CAST(N'1998-05-06' AS Date), N'Tiền vệ', N'8', N'5.jpg', N'Bồ Đào Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'006', N'A1001', N'Christian Eriksen', CAST(N'1997-09-23' AS Date), N'Tiền vệ', N'7', N'6.jpg', N'Đan Mạch')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'007', N'A1001', N'Lisandro Martínez', CAST(N'1998-01-12' AS Date), N'Hậu vệ', N'3', N'7.jpg', N'Argentina')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'008', N'A1001', N'Harry Maguire', CAST(N'1993-03-05' AS Date), N'Hậu vệ', N'5', N'8.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'009', N'A1001', N'Diogo Dalot', CAST(N'1998-09-20' AS Date), N'Hậu vệ', N'20', N'9.jpg', N'Bồ Đào Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'010', N'A1001', N'Aaron Wan-Bissakaa', CAST(N'1997-07-25' AS Date), N'Hậu vệ công', N'6', N'10.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'011', N'A1001', N'David de Gea', CAST(N'1990-07-11' AS Date), N'Thủ Môn', N'1', N'11.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'012', N'A1004', N'Yann Sommer', CAST(N'1988-12-17' AS Date), N'Thủ môn', N'27', N'12.jpg', N'Thụy Sĩ')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'013', N'A1004', N'Robert Lewandowski', CAST(N'1988-08-21' AS Date), N'Tiền đạo', N'9', N'13.jpg', N'Ba Lan')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'014', N'A1004', N'Gavi', CAST(N'2003-03-17' AS Date), N'Tiền vệ', N'30', N'14.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'015', N'A1004', N'Pedri', CAST(N'2001-06-18' AS Date), N'Tiền vệ', N'8', N'15.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'016', N'A1004', N'Raphinha', CAST(N'1996-02-19' AS Date), N'Tiền đạo', N'19', N'16.jpg', N'Brazil')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'017', N'A1004', N'Ansu Fati', CAST(N'1999-09-19' AS Date), N'Tiền đạo', N'10', N'17.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'018', N'A1004', N'Frenkie de Jong', CAST(N'1997-04-19' AS Date), N'Tiền vệ', N'23', N'18.jpg', N'Hà Lan')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'019', N'A1004', N'Jules Kounde', CAST(N'1998-03-20' AS Date), N'Hậu vệ', N'30', N'19.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'020', N'A1004', N'Marcos Alonso Mendoza', CAST(N'1986-09-20' AS Date), N'Hậu vệ', N'13', N'20.jpg', N'Đan Mạch')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'021', N'A1004', N'Andreas Christensen', CAST(N'1996-04-10' AS Date), N'Hậu vệ ', N'21', N'21.jpg', N'Đan Mạch')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'022', N'A1004', N'Sergio Busquets', CAST(N'1983-09-27' AS Date), N'Tiền vệ', N'6', N'22.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'023', N'A1003', N'Lionel Messi', CAST(N'1987-06-24' AS Date), N'Tiền đạo', N'30', N'23.jpg', N'Argentina')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'024', N'A1003', N'Kylian Mbappé', CAST(N'1998-12-20' AS Date), N'Tiền đạo', N'7', N'24.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'025', N'A1003', N'Neymar', CAST(N'1992-12-05' AS Date), N'Tiền đạo', N'10', N'25.jpg', N'Brazil')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'026', N'A1003', N'Sergio Ramos', CAST(N'1986-03-30' AS Date), N'Hậu vệ', N'4', N'26.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'027', N'A1003', N'Achraf Hakimi', CAST(N'1998-11-04' AS Date), N'Hậu vệ', N'3', N'27.jpg', N'Ma Rốc')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'028', N'A1003', N'Marquinhos', CAST(N'1994-05-14' AS Date), N'Hậu vệ', N'5', N'28.jpg', N'Brazil')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'029', N'A1003', N'Gianluigi Donnarumma', CAST(N'1999-02-25' AS Date), N'Thủ Môn', N'1', N'29.jpg', N'Ý')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'030', N'A1003', N'Carlos Soler', CAST(N'1997-01-02' AS Date), N'Tiền vệ', N'8', N'30.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'031', N'A1003', N'Marco Verratti', CAST(N'1992-11-05' AS Date), N'Tiền vệ', N'6', N'31.jpg', N'Ý')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'032', N'A1003', N'Presnel Kimpembe', CAST(N'1995-08-13' AS Date), N'Hậu vệ', N'2', N'32.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'033', N'A1003', N'Juan Bernat', CAST(N'1993-03-01' AS Date), N'Hậu vệ', N'16', N'33.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'034', N'A1002', N'Sadio Mane', CAST(N'1992-04-10' AS Date), N'Tiền đạo', N'10', N'34.jpg', N'Senegal')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'035', N'A1002', N'Manuel Neuer', CAST(N'1986-03-27' AS Date), N'Thủ môn', N'1', N'35.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'036', N'A1002', N'Jamal Musiala', CAST(N'2003-02-26' AS Date), N'Tiền vệ', N'19', N'36.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'037', N'A1002', N'Thomas Muller', CAST(N'1989-09-13' AS Date), N'Tiền đạo', N'23', N'37.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'038', N'A1002', N'Leroy Sane', CAST(N'1996-01-11' AS Date), N'Tiền đạo', N'9', N'38.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'039', N'A1002', N'Benjamin Pavard', CAST(N'1997-01-09' AS Date), N'Hậu vệ', N'3', N'39.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'040', N'A1002', N'Joshua Kimmich', CAST(N'1995-02-08' AS Date), N'Hậu vệ', N'6', N'40.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'041', N'A1002', N'Leon Goretzka', CAST(N'1995-02-06' AS Date), N'Tiền vệ', N'13', N'41.jpg', N'Đức')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'042', N'A1002', N'Dayot Upamecano', CAST(N'1998-10-27' AS Date), N'Hậu vệ', N'4', N'42.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'043', N'A1002', N'Lucas Hernandez', CAST(N'1996-02-14' AS Date), N'Hậu vệ', N'5', N'43.jpg', N'Pháp')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'044', N'A1002', N'Matthijs de Ligt', CAST(N'1999-08-12' AS Date), N'Hậu vệ', N'2', N'44.jpg', N'Hà Lan')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'045', N'A1005', N'Erling Haaland', CAST(N'2000-07-21' AS Date), N'Tiền Đạo', N'9', N'45.jpg', N'Na Uy')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'046', N'A1005', N'Kevin De Bruyne', CAST(N'1991-06-28' AS Date), N'Tiền vệ', N'16', N'46.jpg', N'Bỉ')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'047', N'A1005', N'Julian lvarez', CAST(N'2000-01-31' AS Date), N'Tiền đạo', N'20', N'47.jpg', N'Argentina')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'048', N'A1005', N'Riyad Mahrez', CAST(N'1991-02-21' AS Date), N'Tiền Đạo', N'26', N'48.jpg', N'Angerie')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'049', N'A1005', N'Phil Foden', CAST(N'2000-05-28' AS Date), N'Tiền vệ', N'47', N'49.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'050', N'A1005', N'Jack Grealish', CAST(N'1995-09-18' AS Date), N'Tiền vệ', N'10', N'50.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'051', N'A1005', N'Rodri', CAST(N'1996-06-22' AS Date), N'Tiền vệ', N'18', N'51.jpg', N'Tây Ban Nha')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'052', N'A1005', N'Manuel Akanji', CAST(N'1995-07-19' AS Date), N'Hậu vệ', N'4', N'52.jpg', N'Thụy Sĩ')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'053', N'A1005', N'Nathan Ake', CAST(N'1995-02-18' AS Date), N'Hậu vệ', N'6', N'53.jpg', N'Hà Lan')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'054', N'A1005', N'
Kyle Walker', CAST(N'1990-05-28' AS Date), N'Hậu vệ', N'3', N'54.jpg', N'Anh')
INSERT [dbo].[tblCauThu] ([ID_CauThu], [ID_CLB], [HOTEN], [NGAYSINH], [VITRI], [SOAO], [ANH], [QuocTich]) VALUES (N'055', N'A1005', N'Ederson Moraes', CAST(N'1993-08-17' AS Date), N'Thủ Môn', N'1', N'55.jpg', N'Brazil')
GO
INSERT [dbo].[tblCLB] ([ID_CLB], [TenCLB], [TenSVD], [LogoCLB], [ID_QuocGia]) VALUES (N'A1001', N'Manchester United', N'Old Trafford', N'mu.jpg', N'A01')
INSERT [dbo].[tblCLB] ([ID_CLB], [TenCLB], [TenSVD], [LogoCLB], [ID_QuocGia]) VALUES (N'A1002', N'Bayern Munich', N'Allianz Arena', N'bay.jpg', N'A02')
INSERT [dbo].[tblCLB] ([ID_CLB], [TenCLB], [TenSVD], [LogoCLB], [ID_QuocGia]) VALUES (N'A1003', N'Paris Saint-Germain', N'Parc des Princes', N'par1.jpg', N'A03')
INSERT [dbo].[tblCLB] ([ID_CLB], [TenCLB], [TenSVD], [LogoCLB], [ID_QuocGia]) VALUES (N'A1004', N'Barcelona', N'Camp Nou', N'bar1.jpg', N'A04')
INSERT [dbo].[tblCLB] ([ID_CLB], [TenCLB], [TenSVD], [LogoCLB], [ID_QuocGia]) VALUES (N'A1005', N'Manchester City', N'Entihad', N'mancity.jpg', N'A01')
GO
INSERT [dbo].[tblGiaiDau] ([ID_GiaiDau], [TenGiaiDau]) VALUES (N'GD01', N'UEFA Champion League')
INSERT [dbo].[tblGiaiDau] ([ID_GiaiDau], [TenGiaiDau]) VALUES (N'GD02', N'Giao Hữu CLB')
INSERT [dbo].[tblGiaiDau] ([ID_GiaiDau], [TenGiaiDau]) VALUES (N'GD03', N'Moi Lích')
INSERT [dbo].[tblGiaiDau] ([ID_GiaiDau], [TenGiaiDau]) VALUES (N'GD04', N'Siêu Cúp Liên Lục Địa')
INSERT [dbo].[tblGiaiDau] ([ID_GiaiDau], [TenGiaiDau]) VALUES (N'GD05', N'Ngoại Hạng Anh')
GO
INSERT [dbo].[tblHLV] ([ID_HLV], [Ten_HLV], [ID_CLB], [NGAYSINH], [QUOCTICH], [Anh]) VALUES (N'Hlv01', N'Erik ten Hag', N'A1001', CAST(N'1970-02-02' AS Date), N'Hà Lan', N'hlv01.jpg')
INSERT [dbo].[tblHLV] ([ID_HLV], [Ten_HLV], [ID_CLB], [NGAYSINH], [QUOCTICH], [Anh]) VALUES (N'Hlv02', N'Julian Nagelsmann', N'A1002', CAST(N'1987-07-23' AS Date), N'Đức', N'hlv02.jpg')
INSERT [dbo].[tblHLV] ([ID_HLV], [Ten_HLV], [ID_CLB], [NGAYSINH], [QUOCTICH], [Anh]) VALUES (N'Hlv03', N'Christophe Galtier', N'A1003', CAST(N'1966-08-23' AS Date), N'Pháp', N'hlv03.jpg')
INSERT [dbo].[tblHLV] ([ID_HLV], [Ten_HLV], [ID_CLB], [NGAYSINH], [QUOCTICH], [Anh]) VALUES (N'Hlv04', N'Xavier', N'A1004', CAST(N'1980-01-25' AS Date), N'Tây Ban Nha', N'hlv04.jpg')
GO
INSERT [dbo].[tblQuocGia] ([ID_Quocgia], [TenQuocGia]) VALUES (N'A01', N'Anh')
INSERT [dbo].[tblQuocGia] ([ID_Quocgia], [TenQuocGia]) VALUES (N'A02', N'Đức')
INSERT [dbo].[tblQuocGia] ([ID_Quocgia], [TenQuocGia]) VALUES (N'A03', N'Pháp')
INSERT [dbo].[tblQuocGia] ([ID_Quocgia], [TenQuocGia]) VALUES (N'A04', N'Tây Ban Nha')
GO
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T01', CAST(N'03:00:00' AS Time), CAST(N'2023-06-27' AS Date), N'A1001', N'A1002', NULL, N'GD01')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T02', CAST(N'02:00:00' AS Time), CAST(N'2023-08-24' AS Date), N'A1001', N'A1003', NULL, N'GD01')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T03', CAST(N'12:00:00' AS Time), CAST(N'2023-07-26' AS Date), N'A1001', N'A1004', NULL, N'GD02')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T04', CAST(N'22:00:00' AS Time), CAST(N'2023-06-27' AS Date), N'A1002', N'A1003', NULL, N'GD02')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T05', CAST(N'00:00:00' AS Time), CAST(N'2023-06-24' AS Date), N'A1002', N'A1004', NULL, N'GD02')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'T06', CAST(N'22:00:00' AS Time), CAST(N'2023-07-24' AS Date), N'A1003', N'A1004', NULL, N'GD04')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'TD07', CAST(N'05:14:00' AS Time), CAST(N'2023-04-15' AS Date), N'A1003', N'A1002', N'3-0', N'GD03')
INSERT [dbo].[tblTranDau] ([ID_Tran], [Gio_TD], [Ngaythidau], [DoiNha], [DoiKhach], [KetQua], [GiaiDau]) VALUES (N'TD08', CAST(N'22:00:00' AS Time), CAST(N'2023-07-24' AS Date), N'A1001', N'A1005', NULL, N'GD05')
GO
INSERT [dbo].[tblUser] ([ID_USER], [HOTEN], [DCHI], [SODT], [EMAIL], [PASS], [IS_USER], [IS_ADMIN]) VALUES (N'admin', N'admin', NULL, NULL, N'admin@gmail.com', N'12345', 0, 1)
INSERT [dbo].[tblUser] ([ID_USER], [HOTEN], [DCHI], [SODT], [EMAIL], [PASS], [IS_USER], [IS_ADMIN]) VALUES (N'hung', N'Vũ Thành Hưng', N'Hà Nội', N'0353809984', N'hung2002@gmail.com', N'123456', 0, 0)
INSERT [dbo].[tblUser] ([ID_USER], [HOTEN], [DCHI], [SODT], [EMAIL], [PASS], [IS_USER], [IS_ADMIN]) VALUES (N'hung98', N'Vu Thanh Hung', N'45/2 An Duong Vuong, Q5, TpHCM', N'0989242088', N'H3@gmail.com', N'123456', NULL, NULL)
GO
ALTER TABLE [dbo].[tblBanThang]  WITH CHECK ADD  CONSTRAINT [fk01_bt] FOREIGN KEY([ID_Tran])
REFERENCES [dbo].[tblTranDau] ([ID_Tran])
GO
ALTER TABLE [dbo].[tblBanThang] CHECK CONSTRAINT [fk01_bt]
GO
ALTER TABLE [dbo].[tblBanThang]  WITH CHECK ADD  CONSTRAINT [fk02_bt] FOREIGN KEY([ID_CauThu])
REFERENCES [dbo].[tblCauThu] ([ID_CauThu])
GO
ALTER TABLE [dbo].[tblBanThang] CHECK CONSTRAINT [fk02_bt]
GO
ALTER TABLE [dbo].[tblCauThu]  WITH CHECK ADD  CONSTRAINT [fk01_ct] FOREIGN KEY([ID_CLB])
REFERENCES [dbo].[tblCLB] ([ID_CLB])
GO
ALTER TABLE [dbo].[tblCauThu] CHECK CONSTRAINT [fk01_ct]
GO
ALTER TABLE [dbo].[tblCLB]  WITH CHECK ADD  CONSTRAINT [fk01_clb] FOREIGN KEY([ID_QuocGia])
REFERENCES [dbo].[tblQuocGia] ([ID_Quocgia])
GO
ALTER TABLE [dbo].[tblCLB] CHECK CONSTRAINT [fk01_clb]
GO
ALTER TABLE [dbo].[tblHLV]  WITH CHECK ADD  CONSTRAINT [fk01_hlv] FOREIGN KEY([ID_CLB])
REFERENCES [dbo].[tblCLB] ([ID_CLB])
GO
ALTER TABLE [dbo].[tblHLV] CHECK CONSTRAINT [fk01_hlv]
GO
ALTER TABLE [dbo].[tblTranDau]  WITH CHECK ADD  CONSTRAINT [fk01_td] FOREIGN KEY([DoiNha])
REFERENCES [dbo].[tblCLB] ([ID_CLB])
GO
ALTER TABLE [dbo].[tblTranDau] CHECK CONSTRAINT [fk01_td]
GO
ALTER TABLE [dbo].[tblTranDau]  WITH CHECK ADD  CONSTRAINT [fk02_td] FOREIGN KEY([DoiKhach])
REFERENCES [dbo].[tblCLB] ([ID_CLB])
GO
ALTER TABLE [dbo].[tblTranDau] CHECK CONSTRAINT [fk02_td]
GO
ALTER TABLE [dbo].[tblTranDau]  WITH CHECK ADD  CONSTRAINT [fk03_td] FOREIGN KEY([GiaiDau])
REFERENCES [dbo].[tblGiaiDau] ([ID_GiaiDau])
GO
ALTER TABLE [dbo].[tblTranDau] CHECK CONSTRAINT [fk03_td]
GO
USE [master]
GO
ALTER DATABASE [qlbongda1065] SET  READ_WRITE 
GO
