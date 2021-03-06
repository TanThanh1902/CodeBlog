USE [master]
GO
/****** Object:  Database [CodeBlog]    Script Date: 6/22/2020 1:58:26 PM ******/
CREATE DATABASE [CodeBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodeBlog', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CodeBlog.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CodeBlog_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CodeBlog_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CodeBlog] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodeBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodeBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodeBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodeBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodeBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodeBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodeBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodeBlog] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CodeBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodeBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodeBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodeBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodeBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodeBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodeBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodeBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodeBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CodeBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodeBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodeBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodeBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodeBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodeBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodeBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodeBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CodeBlog] SET  MULTI_USER 
GO
ALTER DATABASE [CodeBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodeBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodeBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodeBlog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CodeBlog]
GO
/****** Object:  Table [dbo].[AdminTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminTable](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TenHienThi] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Role] [bit] NULL,
	[Email] [varchar](100) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_AdminTable] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BinhLuanCodeTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanCodeTable](
	[MaBnhLuanCode] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDang] [int] NULL,
	[MaCode] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[PhanQuyen] [bit] NULL,
 CONSTRAINT [PK_BinhLuanCodeTable] PRIMARY KEY CLUSTERED 
(
	[MaBnhLuanCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTable](
	[MaBlog] [int] IDENTITY(1,1) NOT NULL,
	[TenBlog] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[AnhMinhHoa] [nvarchar](max) NULL,
	[MaTheLoai] [int] NULL,
	[MaNguoiDang] [int] NULL,
	[PhanQuyen] [bit] NULL,
 CONSTRAINT [PK_BlogTable] PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CodeTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeTable](
	[MaCode] [int] IDENTITY(1,1) NOT NULL,
	[TenCode] [nvarchar](70) NULL,
	[AnhMinhHoa] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[LuotXem] [int] NULL,
	[LuotYeuThich] [int] NULL,
	[MaNguoiDung] [int] NULL,
	[MaTheLoai] [int] NULL,
	[LuotTai] [int] NULL,
	[LinkTai] [nvarchar](max) NULL,
	[DonGia] [money] NULL,
	[MoTaNgan] [nvarchar](200) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[HuongDanCaiDat] [nvarchar](max) NULL,
	[AnhXemThem] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[MaAdmin] [int] NULL,
 CONSTRAINT [PK_CodeTable] PRIMARY KEY CLUSTERED 
(
	[MaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc_TheLoaiTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc_TheLoaiTable](
	[MaDanhMuc_TheLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NULL,
	[MaTheLoai] [int] NULL,
 CONSTRAINT [PK_DanhMuc_TheLoaiTable] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc_TheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucTable](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[AnhDanhMuc] [nvarchar](max) NULL,
 CONSTRAINT [PK_DanhMucTable] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NgonNgu_BlogTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu_BlogTable](
	[MaNgonNgu_Blog] [int] IDENTITY(1,1) NOT NULL,
	[MaNgonNgu] [int] NULL,
	[MaBlog] [int] NULL,
 CONSTRAINT [PK_NgonNgu_BlogTable] PRIMARY KEY CLUSTERED 
(
	[MaNgonNgu_Blog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NgonNgu_CodeTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu_CodeTable](
	[MaNgonNgu_Code] [int] IDENTITY(1,1) NOT NULL,
	[MaNgonNgu] [int] NULL,
	[MaCode] [int] NULL,
 CONSTRAINT [PK_NgonNgu_CodeTable] PRIMARY KEY CLUSTERED 
(
	[MaNgonNgu_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NgonNguTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNguTable](
	[MaNgonNgu] [int] IDENTITY(1,1) NOT NULL,
	[NgonNgu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NgonNguTable] PRIMARY KEY CLUSTERED 
(
	[MaNgonNgu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDungTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDungTable](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenHienThi] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](30) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[Token] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
	[SoDu] [money] NULL,
 CONSTRAINT [PK_NguoiDungTable] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThanhToanTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToanTable](
	[MaThanhToan] [int] IDENTITY(1,1) NOT NULL,
	[MaCode] [int] NULL,
	[NgayGiaoDich] [datetime] NULL,
	[MaNguoiMua] [int] NULL,
 CONSTRAINT [PK_ThanhToanTable] PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoaiTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiTable](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoaiTable] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TraLoiCodeTable]    Script Date: 6/22/2020 1:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraLoiCodeTable](
	[MaTraLoiCode] [int] IDENTITY(1,1) NOT NULL,
	[MaBinhLuanCode] [int] NULL,
	[MaNguoiDang] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[PhanQuyen] [bit] NULL,
 CONSTRAINT [PK_TraLoiCodeTable] PRIMARY KEY CLUSTERED 
(
	[MaTraLoiCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CodeTable] ON 

INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (2, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 52, 6, 1, 1, 13, NULL, 100.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (3, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 61, 2, 2, 16, NULL, 12.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (4, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 91, 61, 1, 3, 13, NULL, 312.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (5, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 651, 2, 4, 16, NULL, 123.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (9, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 61, 1, 5, 16, NULL, 34.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (10, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 51, 321, 1, 6, 1, NULL, 43.0000, NULL, NULL, NULL, N'images (1).jpg;images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (11, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 9, 161, 2, 7, 61, NULL, 123.0000, NULL, NULL, NULL, N'images (1).jpg;images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (12, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 3, 161, 1, 8, 61, NULL, 12.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (13, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 29, 6, 2, 9, 6, NULL, 14.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (14, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 21, 1, 2, 1, 16, NULL, 123.0000, NULL, NULL, NULL, N'images (1).jpg;images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (15, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 1651, 2, 2, 1, NULL, 45.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (16, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 3, 2, 3, 64, NULL, 76.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (17, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 1651, 1, 4, 4613, NULL, 41.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (18, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 131, NULL, 1, 5, 16, NULL, 12321.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (19, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 1, 461, 1, 5, 161, NULL, 43.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (20, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 14316, 5, 2, 4, 3, NULL, 123.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (21, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 1, 1, 9, 16, NULL, 54.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (22, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 34, 2, 1, 1, NULL, 2.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (23, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 145, 1, 1, 2, 51, NULL, 2.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (24, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 3, 21354, 2, 1, 61, NULL, 5.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (25, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 13, 1, 8, 7, NULL, 6.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (26, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 1, 2, 6, 16, NULL, 334.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (27, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 21, 13, 1, 1, 1, NULL, 7.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (28, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 4, 1, 1, 1, 46, NULL, 34.0000, NULL, NULL, NULL, N'images (1).jpg;', NULL, 1)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem], [Status], [MaAdmin]) VALUES (32, N'1', N'assignment-quan-ly-nhan-vien-java-2-fpt-polytechnic-java-swing-183851.jpg', CAST(0x0000ABDB008B05A3 AS DateTime), 0, 0, 1, 1, 0, N'gaga', 1.0000, N'gaga', N'<p>hh</p>
', N'<p>hh</p>
', N'images (1).jpg;', NULL, 1)
SET IDENTITY_INSERT [dbo].[CodeTable] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc_TheLoaiTable] ON 

INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (1, 1, 1)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (2, 1, 2)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (3, 2, 3)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (4, 2, 4)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (5, 3, 8)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (6, 4, 5)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (7, 5, 8)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (8, 6, 6)
INSERT [dbo].[DanhMuc_TheLoaiTable] ([MaDanhMuc_TheLoai], [MaDanhMuc], [MaTheLoai]) VALUES (9, 6, 7)
SET IDENTITY_INSERT [dbo].[DanhMuc_TheLoaiTable] OFF
SET IDENTITY_INSERT [dbo].[DanhMucTable] ON 

INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (1, N'Web', N'web_background.jpg')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (2, N'Desktop', N'desktop_background.jpg')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (3, N'Layout', N'layout_background.jpg')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (4, N'Game', N'game_background.png')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (5, N'IoT', N'IoT_background.jpg')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (6, N'AppMoblie', N'mobile_app_background.jpg')
INSERT [dbo].[DanhMucTable] ([MaDanhMuc], [TenDanhMuc], [AnhDanhMuc]) VALUES (7, N'icloud', NULL)
SET IDENTITY_INSERT [dbo].[DanhMucTable] OFF
SET IDENTITY_INSERT [dbo].[NgonNgu_CodeTable] ON 

INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (2, 1, 2)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (3, 2, 2)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (4, 3, 2)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (5, 4, 3)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (6, 5, 3)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (7, 6, 4)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (8, 7, 4)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (9, 8, 5)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (10, 9, 5)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (11, 10, 9)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (12, 11, 9)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (13, 12, 10)
INSERT [dbo].[NgonNgu_CodeTable] ([MaNgonNgu_Code], [MaNgonNgu], [MaCode]) VALUES (14, 13, 11)
SET IDENTITY_INSERT [dbo].[NgonNgu_CodeTable] OFF
SET IDENTITY_INSERT [dbo].[NgonNguTable] ON 

INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (1, N'Html')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (2, N'CSS')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (3, N'JavaScript')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (4, N'C#')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (5, N'C')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (6, N'C++')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (7, N'Angular')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (8, N'.Net')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (9, N'Ruby')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (10, N'React')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (11, N'GoLang')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (12, N'Sql')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (13, N'Java')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (14, N'Assembly')
INSERT [dbo].[NgonNguTable] ([MaNgonNgu], [NgonNgu]) VALUES (15, N'PHP')
SET IDENTITY_INSERT [dbo].[NgonNguTable] OFF
SET IDENTITY_INSERT [dbo].[NguoiDungTable] ON 

INSERT [dbo].[NguoiDungTable] ([MaNguoiDung], [TenHienThi], [TaiKhoan], [MatKhau], [AnhDaiDien], [NgayTao], [Token], [Email], [SoDu]) VALUES (1, N'User', N'thanh', N'1', N'default_user.png', CAST(0x0000ABD1011D21E9 AS DateTime), N'82e6c489-2d28-410f-84db-96849f82b3c9', NULL, 0.0000)
INSERT [dbo].[NguoiDungTable] ([MaNguoiDung], [TenHienThi], [TaiKhoan], [MatKhau], [AnhDaiDien], [NgayTao], [Token], [Email], [SoDu]) VALUES (2, N'User', N'thanh1', N'1', N'default_user.png', CAST(0x0000ABD1011D21E9 AS DateTime), N'caa84386-5ebf-425b-a57c-556e8b8a999a', NULL, 0.0000)
SET IDENTITY_INSERT [dbo].[NguoiDungTable] OFF
SET IDENTITY_INSERT [dbo].[ThanhToanTable] ON 

INSERT [dbo].[ThanhToanTable] ([MaThanhToan], [MaCode], [NgayGiaoDich], [MaNguoiMua]) VALUES (2, 2, CAST(0x0000ABDE00000000 AS DateTime), 2)
INSERT [dbo].[ThanhToanTable] ([MaThanhToan], [MaCode], [NgayGiaoDich], [MaNguoiMua]) VALUES (3, 3, CAST(0x0000ABDE00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ThanhToanTable] OFF
SET IDENTITY_INSERT [dbo].[TheLoaiTable] ON 

INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (1, N'MVC')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (2, N'WordPress')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (3, N'Winform')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (4, N'Javaform')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (5, N'Unity 3D')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (6, N'Android')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (7, N'IOS')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (8, N'API')
INSERT [dbo].[TheLoaiTable] ([MaTheLoai], [TheLoai]) VALUES (9, N'Themes')
SET IDENTITY_INSERT [dbo].[TheLoaiTable] OFF
ALTER TABLE [dbo].[BinhLuanCodeTable]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanCodeTable_AdminTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[AdminTable] ([MaAdmin])
GO
ALTER TABLE [dbo].[BinhLuanCodeTable] CHECK CONSTRAINT [FK_BinhLuanCodeTable_AdminTable]
GO
ALTER TABLE [dbo].[BinhLuanCodeTable]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanCodeTable_NguoiDungTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[NguoiDungTable] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[BinhLuanCodeTable] CHECK CONSTRAINT [FK_BinhLuanCodeTable_NguoiDungTable]
GO
ALTER TABLE [dbo].[BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_BlogTable_AdminTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[AdminTable] ([MaAdmin])
GO
ALTER TABLE [dbo].[BlogTable] CHECK CONSTRAINT [FK_BlogTable_AdminTable]
GO
ALTER TABLE [dbo].[BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_BlogTable_NguoiDungTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[NguoiDungTable] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[BlogTable] CHECK CONSTRAINT [FK_BlogTable_NguoiDungTable]
GO
ALTER TABLE [dbo].[BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_BlogTable_TheLoaiTable] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoaiTable] ([MaTheLoai])
GO
ALTER TABLE [dbo].[BlogTable] CHECK CONSTRAINT [FK_BlogTable_TheLoaiTable]
GO
ALTER TABLE [dbo].[CodeTable]  WITH CHECK ADD  CONSTRAINT [FK_CodeTable_NguoiDungTable] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDungTable] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[CodeTable] CHECK CONSTRAINT [FK_CodeTable_NguoiDungTable]
GO
ALTER TABLE [dbo].[CodeTable]  WITH CHECK ADD  CONSTRAINT [FK_CodeTable_TheLoaiTable] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoaiTable] ([MaTheLoai])
GO
ALTER TABLE [dbo].[CodeTable] CHECK CONSTRAINT [FK_CodeTable_TheLoaiTable]
GO
ALTER TABLE [dbo].[DanhMuc_TheLoaiTable]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_TheLoaiTable_DanhMucTable] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucTable] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[DanhMuc_TheLoaiTable] CHECK CONSTRAINT [FK_DanhMuc_TheLoaiTable_DanhMucTable]
GO
ALTER TABLE [dbo].[DanhMuc_TheLoaiTable]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_TheLoaiTable_TheLoaiTable] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoaiTable] ([MaTheLoai])
GO
ALTER TABLE [dbo].[DanhMuc_TheLoaiTable] CHECK CONSTRAINT [FK_DanhMuc_TheLoaiTable_TheLoaiTable]
GO
ALTER TABLE [dbo].[NgonNgu_BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_BlogTable_BlogTable] FOREIGN KEY([MaBlog])
REFERENCES [dbo].[BlogTable] ([MaBlog])
GO
ALTER TABLE [dbo].[NgonNgu_BlogTable] CHECK CONSTRAINT [FK_NgonNgu_BlogTable_BlogTable]
GO
ALTER TABLE [dbo].[NgonNgu_BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_BlogTable_NgonNguTable] FOREIGN KEY([MaNgonNgu])
REFERENCES [dbo].[NgonNguTable] ([MaNgonNgu])
GO
ALTER TABLE [dbo].[NgonNgu_BlogTable] CHECK CONSTRAINT [FK_NgonNgu_BlogTable_NgonNguTable]
GO
ALTER TABLE [dbo].[NgonNgu_CodeTable]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_CodeTable_CodeTable] FOREIGN KEY([MaCode])
REFERENCES [dbo].[CodeTable] ([MaCode])
GO
ALTER TABLE [dbo].[NgonNgu_CodeTable] CHECK CONSTRAINT [FK_NgonNgu_CodeTable_CodeTable]
GO
ALTER TABLE [dbo].[NgonNgu_CodeTable]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_CodeTable_NgonNguTable] FOREIGN KEY([MaNgonNgu])
REFERENCES [dbo].[NgonNguTable] ([MaNgonNgu])
GO
ALTER TABLE [dbo].[NgonNgu_CodeTable] CHECK CONSTRAINT [FK_NgonNgu_CodeTable_NgonNguTable]
GO
ALTER TABLE [dbo].[ThanhToanTable]  WITH CHECK ADD  CONSTRAINT [FK_ThanhToanTable_CodeTable] FOREIGN KEY([MaCode])
REFERENCES [dbo].[CodeTable] ([MaCode])
GO
ALTER TABLE [dbo].[ThanhToanTable] CHECK CONSTRAINT [FK_ThanhToanTable_CodeTable]
GO
ALTER TABLE [dbo].[TraLoiCodeTable]  WITH CHECK ADD  CONSTRAINT [FK_TraLoiCodeTable_AdminTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[AdminTable] ([MaAdmin])
GO
ALTER TABLE [dbo].[TraLoiCodeTable] CHECK CONSTRAINT [FK_TraLoiCodeTable_AdminTable]
GO
ALTER TABLE [dbo].[TraLoiCodeTable]  WITH CHECK ADD  CONSTRAINT [FK_TraLoiCodeTable_BinhLuanCodeTable] FOREIGN KEY([MaBinhLuanCode])
REFERENCES [dbo].[BinhLuanCodeTable] ([MaBnhLuanCode])
GO
ALTER TABLE [dbo].[TraLoiCodeTable] CHECK CONSTRAINT [FK_TraLoiCodeTable_BinhLuanCodeTable]
GO
ALTER TABLE [dbo].[TraLoiCodeTable]  WITH CHECK ADD  CONSTRAINT [FK_TraLoiCodeTable_NguoiDungTable] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[NguoiDungTable] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TraLoiCodeTable] CHECK CONSTRAINT [FK_TraLoiCodeTable_NguoiDungTable]
GO
USE [master]
GO
ALTER DATABASE [CodeBlog] SET  READ_WRITE 
GO
