USE [master]
GO
/****** Object:  Database [QuanLyDeTai]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[DeTai]    Script Date: 11/26/2022 3:05:33 PM ******/
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
 CONSTRAINT [PK_DeTai_maDeTai] PRIMARY KEY CLUSTERED 
(
	[maDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 11/26/2022 3:05:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_maGiangVien] UNIQUE NONCLUSTERED 
(
	[maGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVienChuyenNganh]    Script Date: 11/26/2022 3:05:33 PM ******/
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
/****** Object:  Table [dbo].[GiangVienPhanBien]    Script Date: 11/26/2022 3:05:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDongCham]    Script Date: 11/26/2022 3:05:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDeTai]    Script Date: 11/26/2022 3:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTai](
	[maLoaiDeTai] [int] IDENTITY(1,1) NOT NULL,
	[tenLoaiDeTai] [nvarchar](256) NULL,
	[nienKhoa] [nvarchar](256) NULL,
	[hocKy] [int] NULL,
	[maChuyenNganh] [int] NULL,
 CONSTRAINT [PK_loaiDeTai] PRIMARY KEY CLUSTERED 
(
	[maLoaiDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDeTaiChuyenNganh]    Script Date: 11/26/2022 3:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTaiChuyenNganh](
	[maChuyenNganh] [int] NOT NULL,
	[maLoaiDeTai] [int] NOT NULL,
 CONSTRAINT [PK_LoaiDeTaiChuyenNganh_maChuyenNganh_maLoaiDeTai] PRIMARY KEY CLUSTERED 
(
	[maChuyenNganh] ASC,
	[maLoaiDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhom]    Script Date: 11/26/2022 3:05:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/26/2022 3:05:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uni_MSSV] UNIQUE NONCLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[LoaiDeTai]  WITH CHECK ADD  CONSTRAINT [fk_loaiDeTai_chuyenNganh] FOREIGN KEY([maChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([maChuyenNganh])
GO
ALTER TABLE [dbo].[LoaiDeTai] CHECK CONSTRAINT [fk_loaiDeTai_chuyenNganh]
GO
ALTER TABLE [dbo].[LoaiDeTaiChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_LoaiDeTaiChuyenNganh_ChuyenNganh_maChuyenNganh] FOREIGN KEY([maChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([maChuyenNganh])
GO
ALTER TABLE [dbo].[LoaiDeTaiChuyenNganh] CHECK CONSTRAINT [FK_LoaiDeTaiChuyenNganh_ChuyenNganh_maChuyenNganh]
GO
ALTER TABLE [dbo].[LoaiDeTaiChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_LoaiDeTaiChuyenNganh_LoaiDeTai_maLoaiDeTai] FOREIGN KEY([maLoaiDeTai])
REFERENCES [dbo].[LoaiDeTai] ([maLoaiDeTai])
GO
ALTER TABLE [dbo].[LoaiDeTaiChuyenNganh] CHECK CONSTRAINT [FK_LoaiDeTaiChuyenNganh_LoaiDeTai_maLoaiDeTai]
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
