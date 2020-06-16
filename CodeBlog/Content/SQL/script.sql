USE [master]
GO
/****** Object:  Database [CodeBlog]    Script Date: 6/16/2020 1:21:05 PM ******/
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
/****** Object:  Table [dbo].[AdminTable]    Script Date: 6/16/2020 1:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminTable](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TenHienThi] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](30) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[Token] [nvarchar](max) NULL,
 CONSTRAINT [PK_AdminTable] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogTable]    Script Date: 6/16/2020 1:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTable](
	[MaBlog] [int] IDENTITY(1,1) NOT NULL,
	[TenBlog] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaNguoiDung] [int] NULL,
	[AnhMinhHoa] [nvarchar](max) NULL,
 CONSTRAINT [PK_BlogTable] PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDeTable]    Script Date: 6/16/2020 1:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDeTable](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDeTable] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CodeTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
	[MaAdmin] [int] NULL,
	[MaTheLoai] [int] NULL,
	[LuotTai] [int] NULL,
	[LinkTai] [nvarchar](max) NULL,
	[DonGia] [money] NULL,
	[MoTaNgan] [nvarchar](200) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[HuongDanCaiDat] [nvarchar](max) NULL,
	[AnhXemThem] [nvarchar](max) NULL,
 CONSTRAINT [PK_CodeTable] PRIMARY KEY CLUSTERED 
(
	[MaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc_TheLoaiTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[DanhMucTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[NgonNgu_BlogTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[NgonNgu_CodeTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[NgonNguTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[NguoiDungTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
 CONSTRAINT [PK_NguoiDungTable] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheLoaiTable]    Script Date: 6/16/2020 1:21:06 PM ******/
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
/****** Object:  Table [dbo].[TinTucTable]    Script Date: 6/16/2020 1:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTucTable](
	[MaTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TenTinTuc] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaAdmin] [int] NULL,
	[MaChuDe] [int] NULL,
	[AnhMinhHoa] [nvarchar](max) NULL,
 CONSTRAINT [PK_TinTucTable] PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AdminTable] ON 

INSERT [dbo].[AdminTable] ([MaAdmin], [TenHienThi], [TaiKhoan], [MatKhau], [AnhDaiDien], [NgayTao], [Token]) VALUES (1, N'Thanh', N'admin01', N'thanh', NULL, CAST(0x0000ABD100000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[AdminTable] OFF
SET IDENTITY_INSERT [dbo].[ChuDeTable] ON 

INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (1, N'Android')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (2, N'Window')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (3, N'ASP')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (4, N'IoT')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (5, N'IOS')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (6, N'Game')
INSERT [dbo].[ChuDeTable] ([MaChuDe], [ChuDe]) VALUES (7, N'Tin công nghệ')
SET IDENTITY_INSERT [dbo].[ChuDeTable] OFF
SET IDENTITY_INSERT [dbo].[CodeTable] ON 

INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (2, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 52, 6, 1, 1, 1, 13, NULL, 100.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (3, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 61, 2, 1, 2, 16, NULL, 12.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (4, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 91, 61, 1, 1, 3, 13, NULL, 312.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (5, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 651, 2, 1, 4, 16, NULL, 123.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (9, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 61, 1, 1, 5, 16, NULL, 34.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (10, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 51, 321, 1, 1, 6, 1, NULL, 43.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (11, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 9, 161, 2, 1, 7, 61, NULL, 123.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (12, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 3, 161, 1, 1, 8, 61, NULL, 12.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (13, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 29, 6, 2, NULL, 9, 6, NULL, 14.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (14, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 21, 1, 2, NULL, 1, 16, NULL, 123.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (15, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 1651, 2, 1, 2, 1, NULL, 45.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (16, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 61, 3, 2, NULL, 3, 64, NULL, 76.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (17, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 6, 1651, 1, NULL, 4, 4613, NULL, 41.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (18, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 131, NULL, 1, 1, 5, 16, NULL, 12321.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (19, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 1, 461, 1, NULL, 5, 161, NULL, 43.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (20, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 14316, 5, 2, NULL, 4, 3, NULL, 123.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (21, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 1, 1, 1, 9, 16, NULL, 54.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (22, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 34, 2, NULL, 1, 1, NULL, 2.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (23, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 145, 1, 1, 1, 2, 51, NULL, 2.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (24, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 3, 21354, 2, 1, 1, 61, NULL, 5.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (25, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 13, 1, 1, 8, 7, NULL, 6.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (26, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 13, 1, 2, 1, 6, 16, NULL, 334.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (27, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 21, 13, 1, 1, 1, 1, NULL, 7.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (28, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'demo_code.jpg', CAST(0x0000ABD100000000 AS DateTime), 4, 1, 1, 1, 1, 46, NULL, 34.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CodeTable] ([MaCode], [TenCode], [AnhMinhHoa], [NgayDang], [LuotXem], [LuotYeuThich], [MaNguoiDung], [MaAdmin], [MaTheLoai], [LuotTai], [LinkTai], [DonGia], [MoTaNgan], [MoTaChiTiet], [HuongDanCaiDat], [AnhXemThem]) VALUES (32, N'1', N'assignment-quan-ly-nhan-vien-java-2-fpt-polytechnic-java-swing-183851.jpg', CAST(0x0000ABDB008B05A3 AS DateTime), 0, 0, 1, 1, 1, 0, N'gaga', 1.0000, N'gaga', N'<p>hh</p>
', N'<p>hh</p>
', N'images (1).jpg;')
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

INSERT [dbo].[NguoiDungTable] ([MaNguoiDung], [TenHienThi], [TaiKhoan], [MatKhau], [AnhDaiDien], [NgayTao], [Token], [Email]) VALUES (1, N'User', N'thanh', N'1', N'default_user.jpg', CAST(0x0000ABD1011D21E9 AS DateTime), N'82e6c489-2d28-410f-84db-96849f82b3c9', NULL)
INSERT [dbo].[NguoiDungTable] ([MaNguoiDung], [TenHienThi], [TaiKhoan], [MatKhau], [AnhDaiDien], [NgayTao], [Token], [Email]) VALUES (2, N'User', N'thanh1', N'1', N'default_user.jpg', CAST(0x0000ABD1011D21E9 AS DateTime), N'caa84386-5ebf-425b-a57c-556e8b8a999a', NULL)
SET IDENTITY_INSERT [dbo].[NguoiDungTable] OFF
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
SET IDENTITY_INSERT [dbo].[TinTucTable] ON 

INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (1, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 1, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (2, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 2, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (3, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 3, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (4, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 4, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (5, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 5, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (6, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 6, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (7, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 7, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (8, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 7, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (9, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 6, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (10, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 5, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (11, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 4, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (12, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 3, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (13, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 2, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (14, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 1, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (15, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 1, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (16, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 4, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (17, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 6, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (18, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 4, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (19, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 2, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (20, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 7, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (21, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 2, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (22, N'Dấu trường chân lýDấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 3, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (23, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 1, N'game_technology_news.jpg')
INSERT [dbo].[TinTucTable] ([MaTinTuc], [TenTinTuc], [NoiDung], [NgayDang], [MaAdmin], [MaChuDe], [AnhMinhHoa]) VALUES (24, N'Dấu trường chân lý', N'Dấu trường chân lý', CAST(0x0000ABD100000000 AS DateTime), 1, 5, N'game_technology_news.jpg')
SET IDENTITY_INSERT [dbo].[TinTucTable] OFF
ALTER TABLE [dbo].[BlogTable]  WITH CHECK ADD  CONSTRAINT [FK_BlogTable_NguoiDungTable] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDungTable] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[BlogTable] CHECK CONSTRAINT [FK_BlogTable_NguoiDungTable]
GO
ALTER TABLE [dbo].[CodeTable]  WITH CHECK ADD  CONSTRAINT [FK_CodeTable_AdminTable] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[AdminTable] ([MaAdmin])
GO
ALTER TABLE [dbo].[CodeTable] CHECK CONSTRAINT [FK_CodeTable_AdminTable]
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
ALTER TABLE [dbo].[TinTucTable]  WITH CHECK ADD  CONSTRAINT [FK_TinTucTable_AdminTable] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[AdminTable] ([MaAdmin])
GO
ALTER TABLE [dbo].[TinTucTable] CHECK CONSTRAINT [FK_TinTucTable_AdminTable]
GO
ALTER TABLE [dbo].[TinTucTable]  WITH CHECK ADD  CONSTRAINT [FK_TinTucTable_ChuDeTable] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDeTable] ([MaChuDe])
GO
ALTER TABLE [dbo].[TinTucTable] CHECK CONSTRAINT [FK_TinTucTable_ChuDeTable]
GO
USE [master]
GO
ALTER DATABASE [CodeBlog] SET  READ_WRITE 
GO
