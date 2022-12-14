USE [master]
GO
/****** Object:  Database [QuanLyDeTai]    Script Date: 11/27/2022 4:00:02 AM ******/
CREATE DATABASE [QuanLyDeTai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDeTai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\QuanLyDeTai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyDeTai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\QuanLyDeTai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyDeTai] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDeTai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDeTai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDeTai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDeTai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDeTai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDeTai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyDeTai] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDeTai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDeTai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDeTai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDeTai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyDeTai] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyDeTai', N'ON'
GO
ALTER DATABASE [QuanLyDeTai] SET QUERY_STORE = OFF
GO
USE [QuanLyDeTai]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [QuanLyDeTai]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[maChuyenNganh] [int] IDENTITY(1,1) NOT NULL,
	[tenChuyenNganh] [nvarchar](256) NULL,
	[truongBoMon] [nvarchar](128) NULL,
 CONSTRAINT [PK_chuyenNganh] PRIMARY KEY CLUSTERED 
(
	[maChuyenNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTai](
	[maDeTai] [int] IDENTITY(1,1) NOT NULL,
	[tenDeTai] [nvarchar](256) NULL,
	[mucTieu] [nvarchar](256) NULL,
	[yeuCau] [nvarchar](256) NULL,
	[sanPham] [nvarchar](256) NULL,
	[chuThich] [nvarchar](256) NULL,
	[soLuongSinhVienToiDa] [int] NULL,
	[duocDangKyKhacChuyenNganh] [bit] NULL,
	[nienKhoa] [nvarchar](256) NULL,
	[loaiDeTai] [int] NULL,
	[diem] [float] NULL,
	[truongNhom] [int] NULL,
	[gvHuongDan] [int] NULL,
	[TrangThai] [nvarchar](255) NULL,
	[maChuyenNganh] [int] NULL,
 CONSTRAINT [PK_DeTai_maDeTai] PRIMARY KEY CLUSTERED 
(
	[maDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[account_ID] [nvarchar](128) NOT NULL,
	[tenGiangVien] [nvarchar](256) NULL,
	[loaiGiangVien] [nvarchar](256) NULL,
	[maGiangVien] [int] NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVienChuyenNganh]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVienChuyenNganh](
	[maChuyenNganh] [int] NOT NULL,
	[maGiangVien] [int] NOT NULL,
 CONSTRAINT [PK_GiangVienChuyenNganh_maChuyenNganh_maGiangVien] PRIMARY KEY CLUSTERED 
(
	[maChuyenNganh] ASC,
	[maGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVienPhanBien]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVienPhanBien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maGiangVien] [int] NOT NULL,
	[maDeTai] [int] NOT NULL,
 CONSTRAINT [PK_GiangVienPhanBien_maGiangVien_maDeTai] PRIMARY KEY CLUSTERED 
(
	[maGiangVien] ASC,
	[maDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDongCham]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDongCham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maGiangVien] [int] NOT NULL,
	[maDeTai] [int] NOT NULL,
 CONSTRAINT [PK_HoiDongCham_maGiangVien_maDeTai] PRIMARY KEY CLUSTERED 
(
	[maGiangVien] ASC,
	[maDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDeTai]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTai](
	[maLoaiDeTai] [int] IDENTITY(1,1) NOT NULL,
	[tenLoaiDeTai] [nvarchar](256) NULL,
	[nienKhoa] [nvarchar](256) NULL,
	[hocKy] [int] NULL,
 CONSTRAINT [PK_loaiDeTai] PRIMARY KEY CLUSTERED 
(
	[maLoaiDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhom]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhom](
	[maDeTai] [int] NOT NULL,
	[MSSV] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Nhom_maDeTai_MSSV] PRIMARY KEY CLUSTERED 
(
	[maDeTai] ASC,
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/27/2022 4:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[account_ID] [nvarchar](128) NOT NULL,
	[MSSV] [int] NOT NULL,
	[tenSinhVien] [nvarchar](256) NULL,
	[maChuyenNganh] [int] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1', N'nguyenvantoan@gmail.com', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'NguyenVanToan')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2', N'nguyencongphuong', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'NguyenCongPhuong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3', N'dangvanlam', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'DangVanLam')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4', N'hocsinha@gmail.com', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'HocSinhA')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5', N'hocsinhb@gmail.com', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'HocSinhB')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6', N'hocsinhc@gmail.com', 1, NULL, NULL, N'0987654321', 1, 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, 0, N'HocSinhC')
GO
SET IDENTITY_INSERT [dbo].[ChuyenNganh] ON 

INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (1, N'Công nghệ phần mềm', N'1')
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (2, N'Hệ thống thông tin', N'2')
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (3, N'Mạng máy tính', N'3')
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (4, N'Kỹ thuật dữ liệu', NULL)
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (5, N'Sư phạm', NULL)
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (6, N'Trí tuệ nhân tạo', NULL)
INSERT [dbo].[ChuyenNganh] ([maChuyenNganh], [tenChuyenNganh], [truongBoMon]) VALUES (7, N'An toàn thông tin', NULL)
SET IDENTITY_INSERT [dbo].[ChuyenNganh] OFF
GO
SET IDENTITY_INSERT [dbo].[DeTai] ON 

INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (1, N'Máy phát nhạc MP3 trên nền kit nhúng', N'Hệ thống nhúng, lập trình', NULL, N'Tài liệu, chạy thực', NULL, 2, 0, N'2014', 1, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (2, N'	Hệ thống cảnh báo bằng phát hiện chuyển động trên kit nhúng Raspberry Pi', N'Hệ thống nhúng, lập trình', NULL, N'Tài liệu, chạy thực', NULL, 2, 0, N'2014', 1, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (3, N'Hệ thống giám sát cửa Garage dùng Raspberry Pi', N'Như tên đề tài', NULL, N'Báo cáo + sản phẩm', NULL, 2, 0, N'2014', 2, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (4, N'Tìm hiểu Two - Factor Authentication và ứng dụng bảo mật website.', N'Tìm hiểu các chứng thực bảo mật ứng dụng', N'Bảo mật web, cơ sở lập trình, Nhóm, Tiếng Anh', N'Demo Two - Factor Authentication', NULL, 2, 0, N'2014', 2, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (5, N'Face Recognition Door Lock System using Raspberry Pi', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'tài liệu, triển khai hệ thống', NULL, 2, 0, N'2017', 3, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[DeTai] ([maDeTai], [tenDeTai], [mucTieu], [yeuCau], [sanPham], [chuThich], [soLuongSinhVienToiDa], [duocDangKyKhacChuyenNganh], [nienKhoa], [loaiDeTai], [diem], [truongNhom], [gvHuongDan], [TrangThai], [maChuyenNganh]) VALUES (6, N'Real-Time License Plate Recognition using Raspberry Pi and Python', N'Tìm hiểu vấn đề nhận dạng', N'Tìm hiểu vấn đề nhận dạng', N'Tài liệu, triển khai', NULL, 2, 0, N'2017', 3, NULL, NULL, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[DeTai] OFF
GO
INSERT [dbo].[GiangVien] ([account_ID], [tenGiangVien], [loaiGiangVien], [maGiangVien]) VALUES (N'1', N'Nguyễn Văn Toàn', N'Giảng viên', 1)
INSERT [dbo].[GiangVien] ([account_ID], [tenGiangVien], [loaiGiangVien], [maGiangVien]) VALUES (N'2', N'Nguyễn Công Phượng', N'Giảng viên', 2)
INSERT [dbo].[GiangVien] ([account_ID], [tenGiangVien], [loaiGiangVien], [maGiangVien]) VALUES (N'3', N'Đặng Văn Lâm', N'Giảng viên', 3)
GO
INSERT [dbo].[GiangVienChuyenNganh] ([maChuyenNganh], [maGiangVien]) VALUES (1, 1)
INSERT [dbo].[GiangVienChuyenNganh] ([maChuyenNganh], [maGiangVien]) VALUES (2, 2)
INSERT [dbo].[GiangVienChuyenNganh] ([maChuyenNganh], [maGiangVien]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[LoaiDeTai] ON 

INSERT [dbo].[LoaiDeTai] ([maLoaiDeTai], [tenLoaiDeTai], [nienKhoa], [hocKy]) VALUES (1, N'Tiểu luận chuyên ngành | K14 (2014 - 2019) | Học kỳ 1 (2017-2018)', N'2017 - 2018', 1)
INSERT [dbo].[LoaiDeTai] ([maLoaiDeTai], [tenLoaiDeTai], [nienKhoa], [hocKy]) VALUES (2, N'Đề tài tốt nghiệp | K14 (2014 - 2019) | Học kỳ 2 (2017-2018)', N'2017 - 2018', 2)
INSERT [dbo].[LoaiDeTai] ([maLoaiDeTai], [tenLoaiDeTai], [nienKhoa], [hocKy]) VALUES (3, N'	Tiểu luận chuyên ngành | K17 (2017 - 2022) | Học kỳ 1 (2020-2021)', N'2020 - 2021', 1)
INSERT [dbo].[LoaiDeTai] ([maLoaiDeTai], [tenLoaiDeTai], [nienKhoa], [hocKy]) VALUES (4, N'Tiểu luận chuyên ngành | K19 (2019 - 2024) | Học kỳ 1 (2022-2023)', N'2022 - 2023', 1)
SET IDENTITY_INSERT [dbo].[LoaiDeTai] OFF
GO
INSERT [dbo].[SinhVien] ([account_ID], [MSSV], [tenSinhVien], [maChuyenNganh]) VALUES (N'4', 1, N'Hoc Sinh A', 1)
INSERT [dbo].[SinhVien] ([account_ID], [MSSV], [tenSinhVien], [maChuyenNganh]) VALUES (N'5', 2, N'Hoc Sinh B', 2)
INSERT [dbo].[SinhVien] ([account_ID], [MSSV], [tenSinhVien], [maChuyenNganh]) VALUES (N'6', 3, N'Hoc Sinh C', 3)
GO
/****** Object:  Index [U_maGiangVien]    Script Date: 11/27/2022 4:00:03 AM ******/
ALTER TABLE [dbo].[GiangVien] ADD  CONSTRAINT [U_maGiangVien] UNIQUE NONCLUSTERED 
(
	[maGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__GiangVie__3213E83E7B636E19]    Script Date: 11/27/2022 4:00:03 AM ******/
ALTER TABLE [dbo].[GiangVienPhanBien] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__HoiDongC__3213E83E6988E76B]    Script Date: 11/27/2022 4:00:03 AM ******/
ALTER TABLE [dbo].[HoiDongCham] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Nhom__3213E83E39D79BF5]    Script Date: 11/27/2022 4:00:03 AM ******/
ALTER TABLE [dbo].[Nhom] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Uni_MSSV]    Script Date: 11/27/2022 4:00:03 AM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [Uni_MSSV] UNIQUE NONCLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChuyenNganh]  WITH CHECK ADD  CONSTRAINT [fk_truongBoMon] FOREIGN KEY([truongBoMon])
REFERENCES [dbo].[GiangVien] ([account_ID])
GO
ALTER TABLE [dbo].[ChuyenNganh] CHECK CONSTRAINT [fk_truongBoMon]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_ChuyenNganh_maChuyenNganh] FOREIGN KEY([maChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([maChuyenNganh])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_ChuyenNganh_maChuyenNganh]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_GiangVien_gvHuongDan] FOREIGN KEY([gvHuongDan])
REFERENCES [dbo].[GiangVien] ([maGiangVien])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_GiangVien_gvHuongDan]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_LoaiDeTai_loaiDeTai] FOREIGN KEY([loaiDeTai])
REFERENCES [dbo].[LoaiDeTai] ([maLoaiDeTai])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_LoaiDeTai_loaiDeTai]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_SinhVien_truongNhom] FOREIGN KEY([truongNhom])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_SinhVien_truongNhom]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [fk_accountTeacher] FOREIGN KEY([account_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [fk_accountTeacher]
GO
ALTER TABLE [dbo].[GiangVienChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_GiangVienChuyenNganh_ChuyenNganh_maChuyenNganh] FOREIGN KEY([maChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([maChuyenNganh])
GO
ALTER TABLE [dbo].[GiangVienChuyenNganh] CHECK CONSTRAINT [FK_GiangVienChuyenNganh_ChuyenNganh_maChuyenNganh]
GO
ALTER TABLE [dbo].[GiangVienChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_GiangVienChuyenNganh_GiangVien_maGiangVien] FOREIGN KEY([maGiangVien])
REFERENCES [dbo].[GiangVien] ([maGiangVien])
GO
ALTER TABLE [dbo].[GiangVienChuyenNganh] CHECK CONSTRAINT [FK_GiangVienChuyenNganh_GiangVien_maGiangVien]
GO
ALTER TABLE [dbo].[GiangVienPhanBien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVienPhanBien_DeTai_maDeTai] FOREIGN KEY([maDeTai])
REFERENCES [dbo].[DeTai] ([maDeTai])
GO
ALTER TABLE [dbo].[GiangVienPhanBien] CHECK CONSTRAINT [FK_GiangVienPhanBien_DeTai_maDeTai]
GO
ALTER TABLE [dbo].[GiangVienPhanBien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVienPhanBien_GiangVien_maGiangVien] FOREIGN KEY([maGiangVien])
REFERENCES [dbo].[GiangVien] ([maGiangVien])
GO
ALTER TABLE [dbo].[GiangVienPhanBien] CHECK CONSTRAINT [FK_GiangVienPhanBien_GiangVien_maGiangVien]
GO
ALTER TABLE [dbo].[HoiDongCham]  WITH CHECK ADD  CONSTRAINT [FK_HoiDongCham_DeTai_maDeTai] FOREIGN KEY([maDeTai])
REFERENCES [dbo].[DeTai] ([maDeTai])
GO
ALTER TABLE [dbo].[HoiDongCham] CHECK CONSTRAINT [FK_HoiDongCham_DeTai_maDeTai]
GO
ALTER TABLE [dbo].[HoiDongCham]  WITH CHECK ADD  CONSTRAINT [FK_HoiDongCham_GiangVien_maGiangVien] FOREIGN KEY([maGiangVien])
REFERENCES [dbo].[GiangVien] ([maGiangVien])
GO
ALTER TABLE [dbo].[HoiDongCham] CHECK CONSTRAINT [FK_HoiDongCham_GiangVien_maGiangVien]
GO
ALTER TABLE [dbo].[Nhom]  WITH CHECK ADD  CONSTRAINT [FK_Nhom_DeTai_maDeTai] FOREIGN KEY([maDeTai])
REFERENCES [dbo].[DeTai] ([maDeTai])
GO
ALTER TABLE [dbo].[Nhom] CHECK CONSTRAINT [FK_Nhom_DeTai_maDeTai]
GO
ALTER TABLE [dbo].[Nhom]  WITH CHECK ADD  CONSTRAINT [FK_Nhom_SinhVien_MSSV] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[Nhom] CHECK CONSTRAINT [FK_Nhom_SinhVien_MSSV]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [fk_accountStudent] FOREIGN KEY([account_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [fk_accountStudent]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [fk_sinhVien_chuyenNganh] FOREIGN KEY([maChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([maChuyenNganh])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [fk_sinhVien_chuyenNganh]
GO
USE [master]
GO
ALTER DATABASE [QuanLyDeTai] SET  READ_WRITE 
GO
