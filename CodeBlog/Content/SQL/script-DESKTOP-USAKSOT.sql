USE [master]
GO
/****** Object:  Database [CodeBlog]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[AdminTable]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[BinhLuanCodeTable]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[BlogTable]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[CodeTable]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[DanhMuc_TheLoaiTable]    Script Date: 6/21/2020 10:37:30 PM ******/
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
/****** Object:  Table [dbo].[DanhMucTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[NgonNgu_BlogTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[NgonNgu_CodeTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[NgonNguTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[NguoiDungTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[ThanhToanTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[TheLoaiTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
/****** Object:  Table [dbo].[TraLoiCodeTable]    Script Date: 6/21/2020 10:37:31 PM ******/
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
