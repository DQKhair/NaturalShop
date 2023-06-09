USE [master]
GO
/****** Object:  Database [SanPhamTieuDung]    Script Date: 6/1/2023 7:15:52 PM ******/
CREATE DATABASE [SanPhamTieuDung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SanPhamTieuDung', FILENAME = N'D:\SQL sever\MSSQL15.SQLEXPRESS\MSSQL\DATA\SanPhamTieuDung.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SanPhamTieuDung_log', FILENAME = N'D:\SQL sever\MSSQL15.SQLEXPRESS\MSSQL\DATA\SanPhamTieuDung_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SanPhamTieuDung] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SanPhamTieuDung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SanPhamTieuDung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET ARITHABORT OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SanPhamTieuDung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SanPhamTieuDung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SanPhamTieuDung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SanPhamTieuDung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SanPhamTieuDung] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SanPhamTieuDung] SET  MULTI_USER 
GO
ALTER DATABASE [SanPhamTieuDung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SanPhamTieuDung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SanPhamTieuDung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SanPhamTieuDung] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SanPhamTieuDung] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SanPhamTieuDung] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SanPhamTieuDung] SET QUERY_STORE = OFF
GO
USE [SanPhamTieuDung]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[SoLuongSanPham] [int] NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[Gia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[MaChucNang] [int] IDENTITY(1,1) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
	[MaLoaiTaiKhoan] [int] NULL,
	[ActionName] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[MaDanhMucSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMucSanPham] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMucSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TongSoLuong] [int] NULL,
	[TongTien] [int] NULL,
	[NgayMua] [datetime] NULL,
	[MaPhuongThuc] [int] NULL,
	[MaTrangThai] [int] NULL,
	[MaNguoiDung] [int] NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChiGiaoHang] [nvarchar](100) NULL,
	[SdtLienLac] [varchar](11) NULL,
	[NhanVienThucHien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[MaLoaiTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTaiKhoan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[EmailNguoiDung] [varchar](50) NULL,
	[SdtNguoiDung] [varchar](11) NULL,
	[DiaChiNguoiDung] [nvarchar](50) NULL,
	[UserNames] [varchar](50) NULL,
	[PassWords] [varchar](max) NULL,
	[MaLoaiTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[MaPhuongThuc] [int] IDENTITY(1,1) NOT NULL,
	[TenPhuongThuc] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhuongThuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[DonGia] [int] NULL,
	[MoTaSanPham] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTaChiTietSanPham] [nvarchar](max) NULL,
	[MaDanhMucSanPham] [int] NULL,
	[CachDungSanPham] [nvarchar](max) NULL,
	[HinhAnh2] [nvarchar](max) NULL,
	[HinhAnh3] [nvarchar](max) NULL,
	[khuyenmai] [nvarchar](30) NULL,
	[CongDung] [nvarchar](2000) NULL,
	[ThanhPhan] [nvarchar](2000) NULL,
 CONSTRAINT [PK__SanPham__FAC7442D10800F8F] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [SoLuongSanPham], [MaHoaDon], [MaSanPham], [Gia]) VALUES (12, 2, 9, 17, 980000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [SoLuongSanPham], [MaHoaDon], [MaSanPham], [Gia]) VALUES (13, 2, 10, 8, 498000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [SoLuongSanPham], [MaHoaDon], [MaSanPham], [Gia]) VALUES (14, 1, 10, 9, 449000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [SoLuongSanPham], [MaHoaDon], [MaSanPham], [Gia]) VALUES (15, 2, 11, 19, 1398000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [SoLuongSanPham], [MaHoaDon], [MaSanPham], [Gia]) VALUES (16, 1, 12, 9, 449000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucNang] ON 

INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang], [MaLoaiTaiKhoan], [ActionName], [ControllerName]) VALUES (1, N'Quản lý người dùng', 1, N'index', N'NguoiDungs')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang], [MaLoaiTaiKhoan], [ActionName], [ControllerName]) VALUES (2, N'Quản lý danh mục sản phẩm', 1, N'index', N'DanhMucSanPhams')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang], [MaLoaiTaiKhoan], [ActionName], [ControllerName]) VALUES (3, N'Quản lý sản phẩm', 1, N'index', N'SanPhams')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang], [MaLoaiTaiKhoan], [ActionName], [ControllerName]) VALUES (4, N'Quản lý đơn hàng', 1, N'index', N'HoaDons')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang], [MaLoaiTaiKhoan], [ActionName], [ControllerName]) VALUES (5, N'Quản lý đơn hàng', 2, N'index', N'HoaDons')
SET IDENTITY_INSERT [dbo].[ChucNang] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([MaDanhMucSanPham], [TenDanhMucSanPham]) VALUES (1, N'QuanTum Beauty World')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMucSanPham], [TenDanhMucSanPham]) VALUES (2, N'QuanTum Daily World')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMucSanPham], [TenDanhMucSanPham]) VALUES (3, N'Quantum Healthy World')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMucSanPham], [TenDanhMucSanPham]) VALUES (4, N'Tiêu Dùng Xanh AORI')
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [TongSoLuong], [TongTien], [NgayMua], [MaPhuongThuc], [MaTrangThai], [MaNguoiDung], [TenKhachHang], [DiaChiGiaoHang], [SdtLienLac], [NhanVienThucHien]) VALUES (9, 2, 882000, CAST(N'2023-05-24T19:36:34.767' AS DateTime), 2, 2, NULL, N'Đinh Quang Khải', N'149/33A29 Bành Văn Trân, p7, Tân bình', N'0343483519', NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TongSoLuong], [TongTien], [NgayMua], [MaPhuongThuc], [MaTrangThai], [MaNguoiDung], [TenKhachHang], [DiaChiGiaoHang], [SdtLienLac], [NhanVienThucHien]) VALUES (10, 3, 852300, CAST(N'2023-05-24T19:43:46.757' AS DateTime), 2, 2, 11, N'Quang Khải', N'Phạm Văn Bạch , Tân Bình, HCM', N'0343483519', NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TongSoLuong], [TongTien], [NgayMua], [MaPhuongThuc], [MaTrangThai], [MaNguoiDung], [TenKhachHang], [DiaChiGiaoHang], [SdtLienLac], [NhanVienThucHien]) VALUES (11, 2, 1258200, CAST(N'2023-05-26T16:40:15.400' AS DateTime), 2, 2, NULL, N'Đinh Quang Khải', N'Bành Văn Trân, p7, Tân Bình, HCM', N'0343483519', 10)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TongSoLuong], [TongTien], [NgayMua], [MaPhuongThuc], [MaTrangThai], [MaNguoiDung], [TenKhachHang], [DiaChiGiaoHang], [SdtLienLac], [NhanVienThucHien]) VALUES (12, 1, 449000, CAST(N'2023-05-26T17:15:04.117' AS DateTime), 2, 1, NULL, N'Kim Tuyến', N'Phạm Văn Bạch , Tân Bình, HCM', N'0343482341', NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] ON 

INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (1, N'Quản trị viên')
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (2, N'Nhân viên bán hàng')
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (3, N'Khách hàng')
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [EmailNguoiDung], [SdtNguoiDung], [DiaChiNguoiDung], [UserNames], [PassWords], [MaLoaiTaiKhoan]) VALUES (3, N'quangkhai', N'khai02@gmail.com', N'0343483519', N'Quận Tân Bình, TP.HCM', N'khai02', N'a6e1cb143d02abde2c692ab3e6fbd576', 3)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [EmailNguoiDung], [SdtNguoiDung], [DiaChiNguoiDung], [UserNames], [PassWords], [MaLoaiTaiKhoan]) VALUES (4, N'Đinh Quang Khải', N'jonddemon2307@gmail.com', N'0343483519', N'Quận Tân Bình, TP.HCM', N'admin', N'4aa320b8074cf0d4a9eb3af7bc19090c', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [EmailNguoiDung], [SdtNguoiDung], [DiaChiNguoiDung], [UserNames], [PassWords], [MaLoaiTaiKhoan]) VALUES (10, N'Kim Tuyến', N'kimtuyen1997@gmail.com', N'0345392035', N'Quận Tân Bình, TP.HCM', N'tuyenkim1997', N'ee5e5a2ed8ccad35e238601a374b7d8f', 2)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [EmailNguoiDung], [SdtNguoiDung], [DiaChiNguoiDung], [UserNames], [PassWords], [MaLoaiTaiKhoan]) VALUES (11, N'Đinh Quang Khải', N'jonddemon2307@gmail.com', N'0343483519', N'Quận Tân Bình, TP.HCM', N'khai911', N'0bbe98be57c6d140e81bad85414eb989', 3)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([MaPhuongThuc], [TenPhuongThuc]) VALUES (1, N'Thanh toán Chuyển khoản')
INSERT [dbo].[PhuongThucThanhToan] ([MaPhuongThuc], [TenPhuongThuc]) VALUES (2, N'Thanh toán khi nhận hàng')
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (1, N'Tẩy Tế bào chế Love World tinh chất  rau má', 299000, N'Thấu hiểu tầm quan trọng của bước làm sạch da trong chu trình skincare mỗi ngày, LOVE WORLD đem đến cho bạn sản phẩm Tẩy tế bào chết và thải độc da hoàn toàn từ thiên nhiên, giúp loại bỏ phần biểu bì già cỗi, ngăn ngừa sự hình thành của mụn, thâm nám và tàn nhang, đẩy lùi các dấu hiệu lão hóa trên da, giúp da tươi trẻ và mịn màng.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_taytebaochetloveworldrauma.jpg?alt=media&token=f6a0a421-77e6-4aff-b253-fa2e77bd3e46', N'Với cam kết sản phẩm có nguồn gốc 100% từ thiên nhiên, Tẩy tế bào chết Love World không chứa các thành phần tác động gây ảnh hưởng xấu đến da như: cồn khô, hương liệu, paraben, dầu khoáng. Là sản phẩm an toàn, lành tính phù hợp với mọi loại da, dịu nhẹ cho da mụn và da nhạy cảm. Sản phẩm có chứa Cetrimonium Chloride và Styrene/Acrylates Copolymer giúp làm mềm lớp sừng, bóc tách tế bào chết trên bề mặt da nhẹ nhàng, ngăn ngừa tình trạng lỗ chân lông bị tắc nghẽn, mụn đầu đen. Nổi bật với thành phần chính là hoạt chất chiết xuất từ rau má như Asiatic Acid, Brahmic Acid có tác dụng giúp các mô liên kết tái tạo nhanh chóng, kích thích sản sinh collagen tái tạo da, đẩy lùi mụn viêm, mụn bọc; Saponin Triterpenoid, Beta Caroten giúp làm căng, săn chắc da chống lão hóa, cải thiện tình trạng da chảy xệ. Thêm vào đó, Glycerin chiết xuất từ trái dừa giúp đem lại hiệu ứng ẩm mịn, không gây khô rát sau khi tẩy tế bào chết.', 1, N'- Mở nắp, bóc tem đi, lấy 1 lượng gấp 3 lần so với SRM, làm ẩm da (Tuyệt đối không được để da và tay quá ướt vì như vậy sẽ tạo ra độ trơn không massage được, dẫn đến việc loại bỏ TBC không hiệu quả )\n- Massage theo hình xoán ốc lên toàn bộ khuôn mặt đặc biệt và vùng nhiều TBC như trán, mũi, cằm, 2 bên má\n- Massage tối thiệu từ 1 phút, tối đa 5 phút như vậy mới đủ thời gian để các TBC se lại quyện với kem tẩy tế bào và rơi ra ngoài\n- Sau cùng rửa mặt lại bằng nước và dùng khăn thấm khô.\n- Sản phẩm không gây bắt nắng\n- Dùng tối thiểu 2 lần/tuần, tối đa 5-6 lần/tuần\n- Không gây bào mòn hay căng khô da, ngược lại còn giúp kích thích tái tạo tế bào, giúp hấp thu dưỡng chất.', N'https://aorishop.com/wp-content/uploads/2022/11/z3925138718646_f2f32d44f4a47a975eb132a089f55a5b.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/TAY-TE-BAO-CHET-VA-THAI-DOC-DA-1-2048x1449.jpg', N'có', NULL, NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (2, N'Sữa rửa mặt Love World tinh chất trái nhàu', 299000, N'Sữa rửa mặt tinh chất trái nhàu là sản phẩm rất được ưa chuộng tại Love World với chiết xuất từ vỏ bưởi, tràm trà và trái nhàu – những thành phần tự nhiên vô cùng lành tính cho da, giúp kháng viêm, làm dịu da, chống oxy hóa, giảm thâm nám tàn nhang và điều trị mụn cực kỳ tốt, giúp chăm sóc làn da từ sâu bên trong.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_suaruamatloveworldnhau.jpg?alt=media&token=76170acc-2b69-43b2-9726-7b208885d38a', N'Với thành phần chính chiết xuất từ trái nhàu, một loại quả chứa rất nhiều chất chống oxy hóa mạnh, cung cấp một lượng lớn vitamin và khoáng chất rất tốt cho da. Trong trái nhàu có chứa vitamin C và E có tác dụng chống dị ứng, làm sáng da và chống lão hoá. Bên cạnh đó, trong trái nhàu còn chứa một loạt thành phần như Lauric Acid có hoạt tính kháng khuẩn kháng viêm cao, Lauryl Glucoside, Disodium Lauroyl Glutamate giúp tạo bọt hoàn toàn tự nhiên, Sodium Cocyl Glycinate giúp làm sạch mặt dịu nhẹ và không gây khô da, Hydroxyphenyl Propyl Ester – một chất chống oxy hóa mạnh và kích thích sản xuất collagen cho làn da trẻ hóa và ngăn ngừa sự hình thành nếp nhăn. Một thành phần khác là tinh dầu tràm trà nổi tiếng với khả năng kháng khuẩn mạnh, ngăn ngừa mụn viêm và loại sạch sợi bã nhờn. Với những hoạt chất tuyệt vời, Sữa rửa mặt Love World giúp làm sạch sâu bụi bẩn và dầu thừa, thải độc và tái tạo da mà vẫn giữ được độ ẩm mịn tự nhiên và không gây khô da sau khi sử dụng.', 1, N'- Bóc lớp tem, lấy 1 lượng nhỏ tương đương 1 hạt đậu đỏ, làm ẩm mặt, tạo bọt bông, nhẹ nhàng rửa cho sạch theo hình xoắn ốc từ trán xuống quanh mắt, xuống má, mũi, cằm và rửa lại bằng nước sạch
\n
- Nếu bạn có trang điểm và dùng mascara hãy làm lại thao tác trên thêm 1 lần nữa, đảm bảo da bạn sạch sâu, không tì vết', N'https://aorishop.com/wp-content/uploads/2022/11/z3925137671703_b11299c9072b8566180791dc64a734d6.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/SUA-RUA-MAT-TRAI-NHAU-2048x1448.jpg', N'có', N'- Sản phẩm ít bọt nhưng loại bỏ bụi bẩn và dầu thừa rất hiệu quả mang lại cho làn da mịn màng, sạch sẽ
\n
- Giảm thiểu kích ứng da ( điều này thường xảy ra với các loại SRM khác )
\n
- Công thức không làm cay mắt thích hợp với cả trẻ nhỏ
\n
- Là chất rửa giữ ẩm, không gây kích ứng da, phù hợp với mọi loại da
\n
- Sự khác biệt là loại SRM tích hợp 2 trong 1, vừa có tác dụng tẩy trang vừa rửa mặt, nhờ công nghệ phân tử nhỏ nên có thể loại bỏ chất bẩn nằm sâu dưới lỗ chân lông rất tốt', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (3, N'Enzym rửa thực phẩm Love World', 349000, N'Áp dụng công nghệ vật lý ứng dụng cơ lượng tử với các thành phần chiết xuất 100% từ thiên nhiên, LOVE WORLD đem đến cho bạn sản phẩm Enzyme rửa thực phẩm loại bỏ chất bẩn, các các chất độc hại trên bề mặt thực phẩm giúp bảo vệ và chăm sóc gia đình bạn thật an toàn và chất lượng', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_daily_world_enzymruamatthucphamloveworld.png?alt=media&token=2fe25bb9-3119-4e2c-b137-e96a1c90ac2a', N'Các thành phần bao gồm tinh dầu tự nhiên chiết xuất từ cam và quế giúp kháng khuẩn, khử mùi hôi tanh của thịt cá cùng chiết xuất trà xanh và rau diếp cá đem lại hiệu quả làm sạch bề mặt thực phẩm một cách vượt trội, có thể rửa sạch giun sán bám trên bề mặt rau củ quả, giúp rau tươi lâu hơn. Với thành phần nước vikill áp dụng công nghệ cơ lượng có khả năng khử khuẩn tức thời và ngăn chặn sự phát triển của vi khuẩn, loại sạch đến 99,99% vi khuẩn cho gia đình bạn luôn được sử dụng những thực phẩm tươi ngon và sạch sẽ nhất. Sản phẩm Enzyme rửa thực phẩm Love World đặc biệt có thể sử dụng được trong chế biến thức ăn cho phụ nữ mang thai và trẻ nhỏ, cực kì thân thiện với môi trường.', 2, N'- Rửa thực phẩm, rau củ 1-2 lần bằng nước sạch.
\n
- Pha loãng lượng gel tương đương 1 lần nhấn với 5 lít nước.
\n
- Cho thực phẩm vào ngâm trước khi sử dụng 15-20 phút.
\n
* Sự khác biệt
\n
- Khử mùi tanh của thực phẩm nhưng không làm mất đi độ tươi và mùi vị nguyên bản của thực phẩm.
\n
- Sản phẩm thiên nhiên 100% an toàn cho sức khỏe, có thể sự dụng trực tiếp mà không cần rửa lại bằng nước sạch hay nấu chín thực phẩm tươi.
\n
- Khả năng diệt khuẩn tuyệt đối an toàn cho sức khỏe của trẻ nhỏ.
\n
- Thân thiện với môi trường.', N'https://aorishop.com/wp-content/uploads/2022/11/z3925142405757_2e6fb9cf19debfa8cfaa55800c882866.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/ENZYME-RUA-THUC-PHAM-2048x1449.jpg', NULL, N'- Giúp kháng khuẩn, khử mùi hôi tanh từ trứng, cá, thịt.
\n
- Trà xanh diếp cá làm sạch bề mặt, giun sán trên rau củ quả tươi.
\n
- Nước Vikill trung hòa và phá vỡ liên kết thuốc trừ sâu và thuốc bảo quản thực vật.
\n
- Thực phẩm không hôi tanh, rau củ quả tươi lâu hơn.', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (4, N'Nước rửa Đa năng Love World', 235000, N'Điều lo ngại nhất của các nhà nội trợ chắc hẳn là chén bát có được diệt khuẩn sạch sẽ sau khi rửa và có để lại những chất hoá học không tốt cho cơ thể hay không? Thấu hiểu nỗi lo lắng này, Love World đem đến cho bạn và gia đình Enzyme rửa đa năng với chiết xuất hoàn toàn từ thiên nhiên, với những thành phần diệt khuẩn cực mạnh mà không sử dụng hoá chất, làm sạch tuyệt đối cho chén bát mà còn giữ an toàn cho làn da.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_daily_world_nuocruadanangloveworld.jpg?alt=media&token=04888d64-dddf-41ea-a138-7d29774f1af4', N'Phần thịt quả bồ hòn có hàm lượng lớn hoạt chất Saponin, là chất hoạt động bề mặt, tạo bọt nhẹ và cuốn chất bẩn đi theo nước. Chính vì thế nước rửa chén chiết xuất từ trái bồ hòn không để lại bất cứ tồn dư có hại nào trên bề mặt của chén đĩa và không thải ra bất cứ chất hóa học nào gây hại cho môi trường. Vỏ dứa lên men với công dụng làm sạch tuyệt vời cùng tinh dầu cam quế đem lại mùi hương dịu nhẹ trên chén bát sau khi rửa, giúp gia đình bạn có những bữa ăn an toàn và chất lượng nhất. Đặc biệt với Glycerin chiết xuất từ dầu dừa giúp dưỡng ẩm tối ưu cho day tay, bảo vệ làn da tránh khô ráp sau khi sử dụng sản phẩm. Ngoài ra, enzyme rửa đa năng còn có công dụng làm sạch cống rãnh, ngăn chặn sự phát triển của muỗi và ấu trùng gây hại. Enzyme rửa đa năng Love World sẽ giúp bạn làm sạch các bề mặt nhanh chóng, không hoá chất độc hại, an toàn cho da tay, thân thiện với môi trường. Đặc biệt dùng được cho rửa bình sữa của trẻ em và thích hợp cho người có da tay nhạy cảm hay bị bệnh lí về da,', 2, N'Pha tỉ lệ dung dịch nước rửa chén bát 1:2. Nên pha với nước ấm để phát huy hết khả năng của sản phẩm, kết hợp dùng miếng tạo bọt để sản phẩm tạo ra nhiều bọt hơn, sau đó tráng lại bằng nước.
\n
* Sự khác biệt so với những loại nước rửa thông thường:
\n
- Bao lại cá hạt dầu mỡ theo đường nước thải đẩy hết ra ngoài nhờ Sapoin được chiết xuất từ bồ hòn, là chất hoạt động bề mặt cuốn chất bẩn đi theo nước.
\n
- Không làm khô và hại da tay
\n
- Tiết kiệm nước.
\n
- Bảo vệ sức khỏe và gia đình bạn.', N'https://aorishop.com/wp-content/uploads/2022/11/z3925144895447_a2ebfe5413ce3c06233356c5a38eb47b.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/03/ENZYME-RUA-DA-NANG-2048x1448.jpg', NULL, N'- Làm sạch chén đĩa, xoong nồi và các vật dụng do dầu mỡ gây nên.
\n
- Ngoài ra còn làm sạch cống rãnh ngăn chặn sự phát triển của muỗi và ấu trùng.', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (5, N'Coffee', 450000, N'COFFEE LOVE WORLD | CẢM HỨNG BẤT TẬN
\n
Ly cà phê ngon nhất không phải đến từ vị giác, mà đó là một sự hài hòa giữa những giai điệu cảm xúc cùng sự cảm thụ của tất cả các giác quan. Người ta yêu nhau đâu cần có lý do gì, đơn giản là mình thích thì mình yêu nhau thôi. Người với người đã như thế, còn giữa người với cà phê thì sao? Yêu nhau vì đó đã là một chân lý hay triết lý sống của người đời đã gắn liền với thức uống mang vị đắng này.
\n
\n
Có ai ngờ rằng, nguồn cảm hứng sáng tạo tuyệt vời nhất đôi khi lại đến từ những thứ tưởng chừng như đơn giản nhất trên trái đất. Cà phê vừa là chất xúc tác cũng vừa là nguồn cảm hứng khơi nguồn cho sự sáng tạo vô hạn của nhân loại.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_healthy_world_coffee.png?alt=media&token=a8e9b009-0779-402e-9b24-f72c898d17d7', NULL, 3, N'- Uống nóng: Hòa 1 gói cà phê Love World với 40ml – 60ml nước nóng (80 độ C đến 90 độ C), khuấy đều và thưởng thức.
\n
- Uống đá: Hòa 2 gói cà phê Love World với 40ml – 60ml nước nóng (80 độ C đến 90 độ C), khuấy đều, cho khoảng 40 – 100gr đá vào và thưởng thức.', N'https://aorishop.com/wp-content/uploads/2023/03/IMG_9544.JPG-1-683x1024.jpg', N'https://aorishop.com/wp-content/uploads/2023/03/HNTC-Profile1-15-2048x1315-1024x658.jpg', NULL, NULL, N'Cafe nguyên chất
\n
Tim sen
\n
Collagen từ vỏ và nước luộc nghêu
\n
Vitamin C từ cam nguyên tép sấy thăng hoa
\n
Đông trùng hạ thảo
\n
Hoa kim ngân
\n
Hoa tam thất
\n
Chiết xuất đằng sâm
\n
Chiết xuất hồng sâm
\n
Chiết xuất địa hoàng
\n
Hạ cô thảo
\n
Dây thìa canh
\n
Lá sa kê
\n
Khổ qua rừng
\n
Hạt cao
\n
Vỏ cà phê lên men bacillus
\n
Lá sen lên men bacillus')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (6, N'BB CREAM AORI', 500000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_bbcreamaori.jpg?alt=media&token=6566d313-6dee-48a3-8938-aba35944bf5d', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033365737923_246a82645826dd84bcba2579b6180282.jpg', NULL, NULL, N'- Kem nền trang điểm trắng hồng tự nhiên
\n
- Che khuyết điểm mờ thâm nám tàn nhang
\n
- Bb cream dưỡng da
\n
- Chống nắng spf30+', N'Water
\n
C15-19 Alkane
\n
Polyglyceryl-3 Diisostearte
\n
Ethylhexyl Methoxycinnamate
\n
Diethylamino Hydroxybenzoyl Hexyl Benzoate
\n
Titanium Dioxide
\n
Alumium Hydroxide
\n
Triethoxycaprylylsilane
\n
Silica, Glycerin, Joerjoba Oil
\n
Tocopheldimethy
\n
Dioxidanirate (H302)
\n
Beheneth-25 Methacrylate Crosspolymer
\n
Fragrance
\n
Tetrasodium EDTA')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (7, N'DẦU TIÊU', 400000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_dautieu.jpg?alt=media&token=ec247673-b23b-407e-a71a-bb09fbbaa1aa', NULL, 4, N'Xoa tinh dầu tiêu lên vị trí bị đau', N'https://aorishop.com/wp-content/uploads/2022/12/z4033364683017_8a8fe87a4c338b4ed52291faa5b35e63.jpg', NULL, NULL, N'- Giúp trơn các khớp\n- Tiêu độc trong khớp\n- Hổ trợ điều trị viêm khớp, nhức khớp do gout\n- Ngăn ngừa nghẽn mạch máu, phòng tai biến\n- Hổ trợ điều trị khó thở, lưu thông máu huyết\n- Giảm đau nhức do hoạt động thể thao', N'Deionized Water\nPlantago Major L\nPepper Black Esantial Oil')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (8, N'Mặt nạ ngủ Love World tinh chất hoa hồng', 249000, N'Thời gian biểu bận rộn, đôi lúc bạn sẽ quên chăm sóc bản thân. Vậy tại sao không tận dụng 8 giờ đi ngủ mỗi ngày để làm đẹp cho mình? Mặt nạ ngủ Love World là sự lựa chọn hoàn hảo chăm sóc làn da ban đêm cho bạn. Với thành phần tự nhiên từ hoa hồng, trái bơ và măng tây giúp chống lão hóa, làm trẻ hóa làn da, đồng thời bổ sung độ ẩm, cải thiện sắc tố da, xua tan mệt mỏi cẳng thẳng sau ngày dài tiếp xúc với nắng gió, khói bụi và môi trường máy lanh tại nơi làm việc; cho bạn làn da tươi mới chỉ sau một đêm.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_matnanguloveworldhoahong.jpg?alt=media&token=bf38f0e4-fddf-41d0-a862-9415fb14e64c', N'Mặt Nạ Ngủ Love World với chiết xuất hoàn toàn từ thiên nhiên có hàm lượng cao các vitamin, axit amin và khoáng chất giúp dưỡng ẩm tuyệt vời cho làn da, se khít lỗ chân lông, tăng cường hàng rào độ ẩm bảo vệ da, ngăn chặn độc tố, kháng viêm, kích thích tăng sinh collagen, chống lão hóa hiệu quả cho làn da. Hyaluronic Acid chiết xuất từ trái bơ, măng tây, đậu nành có khả năng ngậm hàng triệu phân tử nước, tạo màng dưỡng ẩm bảo vệ da, giúp da được ngậm ngước, cấp ẩm sâu và khóa ẩm hiệu quả.\nChiết xuất nấm linh chi và cây lược vàng ngăn chặn oxy hóa chất béo, tái tạo các tế bào suy yếu và loại bỏ tế bào chết từ đó ngăn ngừa tình trạng lão hóa da giúp da luôn trẻ trung, mịn màng, cải thiện độ đàn hồi của da. Hương thơm dịu nhẹ của tinh chất hoa hồng giúp bạn thư giãn sau một ngày dài mệt mỏi. Sự đặc biệt của dòng sản phẩm làm đẹp nhà Love World nằm ở nước vikill được sản xuất trên dây chuyền công nghệ cao giúp làn da được cấp nước hoàn hảo vào ban đêm. Khi ngủ, H3O2 (nước vikill) chuyển hóa thành H2O, giúp cấp nước và khóa ẩm từ bên trong da. Hãy cảm nhận sự tái sinh tức của làn da thì mỗi sớm mai thức giấc với Mặt nạ ngủ Love World.', 1, N'-Bước 1: Rửa sạch mặt với SRM Love World\n-Bưới 2: Toner\n-Bước 3: Thoa serum\n-Bước 4: Dưỡng ẩm\n-Bước 5: Thoa mặt nạ ngủ 2-3 lần/tuần\n- Thoa 1 lượng vừa đủ toàn khuôn mặt sau khi đã hoàn thành tất các bước trên\n* Sản phẩm dùng kết hợp với các dòng sản phẩm khác không gây kích ứng\nChống lão hóa, săn cơ và nâng cơ, làm dịu vùng da bị ửng đỏ, cháy nắng hoặc những da tổn thương sau trị liệu.', N'https://aorishop.com/wp-content/uploads/2022/11/z3925140087110_a4459a3765c42e5b65fc13a69320f9c3.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/MAT-NA-NGU-05-2048x1448.jpg', NULL, N'- Cấp ẩm và tạo độ mềm cho da\n- Khóa nước không làm mất nước khi ngủ\n- Ngăn ngừa lão hóa, ngăn ngừa hình thành các nếp nhăn\n- Làm sáng điều màu da, kháng viêm, kích thích sản sinh collagen\n- Phục hồi làn da mỏng, yếu', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (9, N'Dầu xả khô Love World tinh chất bưởi', 449000, N'Sở hữu mái tóc đẹp chuẩn salon tại nhà luôn là một vấn đề nan giải với chị em phụ nữ chúng ta. Bạn có biết, để sở hữu một mái tóc vào nếp suôn mượt suốt cả ngày, tóc mình phải được nuôi dưỡng mềm mượt ngay từ sâu bên trong? Thay vì phải ra salon thường xuyên mất nhiều thời gian và chi phí, Love World Việt Nam đem lại cho bạn bí quyết dưỡng tóc từ các chuyên gia tạo mẫu tóc trên thế giới, cho mái tóc của bạn đẹp chuẩn salon ngay tại nhà – với Dầu xả khô Love World 100% thiên nhiên.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_dauxakholoveworldbuoi.jpg?alt=media&token=f20a304a-70fb-4462-b37c-547bb04b8708', N'Dầu xả khô chính là lựa chọn ưu việt nhất nếu bạn không có thời gian ủ và tạo kiểu cho tóc. Bạn cũng không phải lo lắng tình trạng tóc bị xơ rối, mất nếp sau một thời gian vì dầu xả khô còn có thành phần chống tĩnh điện hiệu quả. Khi sử dụng dầu xả khô, bạn cũng không cần phải xả lại với nước.\nTrong khi các sản phẩm khác hầu như chỉ tác động đến phần bên ngoài khoác lên mái tóc một lớp bóng mượt thì Love World tác động sâu vào cấu trúc bên trong, khôi phần biểu bì tóc đã đứt gãy trong quá trình tẩy, nhuộm, hay tác dụng nhiệt quá nhiều. Với những thành phần dưỡng chất chiết xuất hoàn toàn từ thiên nhiên như bồ kết, thầu dầu, vỏ bưởi, đậu bắp, quả gấc, cây tu hú,.. dầu xả khô giúp bạn nuôi dưỡng mái tóc bóng mượt vào nếp suốt cả ngày dài. Hoạt chất Cetyl Alcohol từ trái đậu bắp cùng D-panthenol (còn gọi là Vitamin B5) từ quả gấc ngoài việc dưỡng ẩm còn giúp tăng cường tái tạo các lớp bảo vệ ngoài cùng của mái tóc, do vậy làm giảm đáng kể tình trạng mất nước. Dimathicone Silicone chiết xuất từ cây tu hú sẽ tạo một lớp màng bảo vệ và giữ nếp, đem đến hiệu ứng bóng mượt như tóc tạo kiểu. Bạn cũng không phải lo lắng tình trạng tóc bị xơ rối, mất nếp sau một thời gian vì dầu xả khô còn có thành phần chống tĩnh điện hiệu quả.', 1, N'- Sau khi gội sạch, làm khô tóc 80% để tránh dầu xả khô bị pha.\n- Dùng khoảng 2ml dầu xả cho vào lòng bàn tay và thoa đều lên mái tóc.\n- Da đầu khô có thể dùng trực tiếp, da đầu thoa cách chân 3cm.\n* Tiện lợi:\n- Không phải xả lại với nước\n- Cung cấp nhiều dưỡng chất tạo nên sự khác biệt', N'https://aorishop.com/wp-content/uploads/2022/11/z3924991131477_04bb34315f4b325a1081177417a7ccbf.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/DAU-XA-KHO-2048x1449.jpg', NULL, N'- Giúp làm mềm, óng mượt.\n- Phục hồi biểu bì tóc đã đứt gãy trong quá trình tẩy tóc hoặc sử dụng hóa chất nhiều.\n- Tiện lợi, tiết kiệm thời gian.', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (10, N'Kem đánh răng hương thảo Love World', 159000, N'Kem đánh răng thiên nhiên Love World là sự kết hợp hài hoà và tinh tế các tinh chất dược liệu tự nhiên có tác dụng làm dịu, giảm sưng tấy những tổn thương ở chân răng và lợi, bảo vệ lợi, chắc chân răng. Sản phẩm giúp làm sạch răng lợi và bảo vệ răng từ bên trong, đẩy lui chảy máu chân răng, nhiệt miệng, ê buốt răng, góp phần làm giảm sưng, ngừa viêm lợi, tụt lợi, viêm quanh răng.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_kemdanhranghuongthaoloveworld.jpg?alt=media&token=91bde881-5641-4669-b387-5187845df3f9', N'Kem đánh răng Love World nổi trội với khả năng làm sạch mảng bám cứng đầu trên bề mặt răng mà không bào mòn men răng với Sodium Lauryl Sulfate chiết xuất từ muối than trúc và Metaphosphoric Acid từ chanh. Đặc biệt, với tinh chất làm trắng răng Silica chiết xuất từ bùn non thiên nhiên giúp răng bạn trắng sáng và làm sạch các vết ố lâu năm, cùng với Canxi tự nhiên phục hồi những vùng răng bị tổn thương do sâu răng giai đoạn đầu. Hương thơm tự nhiên chiết xuất từ tinh dầu đinh hương, táo, quế và bạc hà đem lại cho bạn hơi thở thơm mát suốt ngày dài, đánh tan nỗi lo về hơi thở có mùi. Thành phần nước vikill công nghệ cao diệt giúp diệt sạch vi khuẩn trong khoang miệng, ngăn ngừa tình trạng chảy máu chân răng, nhiệt miệng, ê buốt, cho bạn rạng rỡ với hàm răng khỏe mạnh. Với mục tiêu đặt sức khỏe người tiêu dùng lên hàng đầu, sản phẩm Kem đánh răng Love World cam kết chăm sóc cho sức khỏe răng miệng gia đình bạn một cách tốt nhất.', 1, N'- Đánh răng ngày 2-3 lần sau ăn 30 phút, lấy 1 lượng bằng hạt đậu xanh ra bàn chải và chải đều khắp khoang miệng đến khi sạch, súc miệng lại bằng nước.\n* Sự khác biệt:\n- Không chất hóa học hay flo, phù hợp với trẻ nhỏ, loại bỏ mảng bám cứng đầu trên bề mặt răng và không làm mòn men răng.\n- Sử dụng kem đánh răng Love World có thể nuốt mà không gây ảnh hưởng tới sức khỏe.', N'https://aorishop.com/wp-content/uploads/2022/11/z3924987475351_b4e403ea1244824b4003c3ab3cd3c0af-Copy.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/KEM-DANH-RANG-2048x1448.jpg', NULL, N'- Sạch mảng bám, nawgn ngừa vi khuẩn hình thành.\n- Hôi miệng, làm làm viết thương.\n- Viêm nướu, viêm nha chu, chảy máu chân răng.', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (17, N'Dầu gội phủ bạc Love World tinh chất than trúc Nhật', 490000, N'Bạn có biết: Khi chưa thể khám phá vẻ đẹp nội tâm thì vẻ đẹp hình thức được xem là ấn tượng đầu tiên trong giao tiếp, và góp phần vào sự hoàn hảo của vẻ đẹp đó không thể không kể đến vai trò của mái tóc.\nDầu gội phủ bạc Love World 100% thiên nhiên giúp mái tóc:\n❤ Đều màu ngay sau khi gội, nuôi dưỡng tóc khỏe nhờ các thảo dược dưỡng tóc tự nhiên\n❤ Có thể sử dụng hàng ngày, hàng tuần, tuyệt đối an toàn cho sức khỏe\n❤ Bao phủ nhanh chóng\nDầu gội phủ bạc Love World 100% thiên nhiên\n❤ Tinh chất thảo dược tự nhiên\n❤ Hiệu quả kéo dài\n❤ An toàn tuyệt đối', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_daugoiphubacloveworldthantrucnhat.png?alt=media&token=1f9eec3c-12ac-4f2c-80d7-d361e8e3f789', N'GỒM 2 GÓI CHÍNH\nGói 1: Gồm các chiết xuất 100% thiên nhiên.\n- Than trúc Nhật\nGói 2: Thành phần chính gồm nước Vikill (H3O2)\n- Các glycerin, vitamin C và các khoáng chất.\n- Nước Vikill (H3O2) là tác nhân chính giúp than Trúc/ củ Nu bám phủ toàn sợi tóc từ gốc đến ngọn một cách chắc chắn.\n- Khi H3O2 sau 10-20 phút chuyển hoá thành H2O hoàn toàn thì quá trình bao phủ tóc hoàn thành.\n- Những thành phần phụ khác giúp liên kết của quá trình phủ được tốt hơn, nuôi dưỡng chân tóc được khỏe hơn.\n- Các khoáng chất và vitamin c giúp bảo vệ và nuôi dưỡng tóc chắc khỏe từ gốc.\nDùng phủ đen tóc hoặc nâu tóc từ thiên nhiên giúp bảo vệ tóc, phục hồi lại tóc đã hư tổn.', 1, N'- Làm ẩm tóc đối với tóc đang còn bẩn, gội trực tiếp lên tóc khô khi tóc đã được gội sạch.\n- Chuẩn bị dầu phủ bạc, mang găng tay, trộn đều gel từ 2 ngăn vào dụng cụ và chải đối với tóc nữ. Nam có thể đổ trực tiếp.\n- Massage và ủ từ 10-30 phút cho từng loại tóc để đạt hiệu quả tối ưu.\n- Xả tóc bằng nước sạch và lau khô. Tùy theo sức mọc của tóc mà từ 2 đến 3 tuần nên gội lại 1 lần.\n* Sự khác biệt:\n-Aminiac là chất làm mềm từ quả nhàu thiên nhiên, không sử dụng các chất hóa học khác để hóa lỏng sợi tóc.\n- Cơ chế len lỏi và làm đầy sợi tóc nên cần có sự tác động của Amoniac để nước Vikill mang than tre và củ nâu lấp đầy được dễ dàng và hiệu quả.', N'https://aorishop.com/wp-content/uploads/2022/11/z3924989627284_fbbf73cd9da23a967fdc7b4c3e443c01.jpg', N'https://aorishop.com/wp-content/uploads/2022/11/z3924989619168_f89423810aaf30b7e2484d2ffbdaa21d.jpg', NULL, N'- Giúp phủ tóc, không làm khô da hay bong tróc da đầu.\n- Bảo vệ nang tóc từ gốc đến ngọn.\n-Nuôi dưỡng và cung cấp dưỡng chất cho tóc.\n-Thay đổi màu tóc giúp kéo dài thanh xuân.', N'Nước Vikill, than tre trúc Nhật, củ nâu.')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (18, N'Dầu gội đầu Love World tinh chất bưởi', 499000, N'Dầu gội Love World tinh chất bưởi – cho tóc vào nếp và suôn mượt suốt ngày dài.\nBạn có biết, mái tóc mỗi ngày đều tiếp xúc với nhiều yếu tố gây hại đến từ môi trường: nắng nóng, tia UV, thay đổi nhiệt độ đột ngột, gió lạnh, khói bụi bẩn & ô nhiễm… Bên cạnh đó, tóc còn chịu thương tổn từ cặn hóa chất trong sản phẩm tạo kiểu và chăm sóc tóc. Lâu dần, những yếu tố gây hại này sẽ khiến mái tóc trông yếu hơn, xỉn màu mất đi độ bóng mượt tự nhiên, thậm chí trở nên khô xơ và dễ gãy rụng. Love World Việt Nam giới thiệu đến bạn giải pháp cứu cánh hiệu quả cho tóc từ các chuyên gia trong lĩnh vực làm đẹp: Dầu gội Love World tinh chất bưởi!', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_daugoidauloveworldbuoi.jpg?alt=media&token=768f2b38-e15e-485d-bf90-4a23cef41d38', N'Với chiết xuất từ vỏ bưởi và nước chưng cất vỏ bưởi ép lạnh nguyên chất, kết hợp với tinh chất bồ kết, dầu dừa, lá hương nhu,…Dầu gội Love World chứa hàm lượng cao các Vitamin E&C, protein thực vật giúp giảm rụng, nuôi dưỡng tóc chắc khỏe đồng thời kích thích mọc tóc con. Hoạt chất Hydrolyzed Silk đặc chế từ vỏ bưởi có khả năng phục hồi tổn thương và tái tạo, ngăn chặn sự thoát nước, dưỡng ẩm chuyên sâu cho mái tóc. Đồng thời Glycerin tinh chế từ dừa giúp tóc luôn bồng bềnh và óng ả. Với cơ chế tạo bọt 100% thiên nhiên từ bồ kết giúp đánh bay gàu mà không kích thích tiết dầu, giúp mái tóc thoáng sạch bồng bềnh. Hương liệu tự nhiên từ tinh dầu bưởi, hương nhu, bồ kết sẽ đem lại mùi hương nhẹ nhàng thư giãn giúp bạn sảng khoái ngay khi sử dụng sản phẩm. Dầu gội Love World không chứa các thành phần hóa học, nên phù hợp với mọi đối tượng người sử dụng khác nhau, thân thiện với môi trường.', 1, N'- Có thể gội lạnh, ấm tùy theo thời tiết, khí hậu từng vùng\n- Xả tóc ướt, ẩm đều, lấy lượng dầu gội khoảng 2 nhấn, tạo bọt, sau đó gãi ngược từ trán lên đỉnh đầu, tai, gáy cũng làm như vậy. Xả tóc và gội lại lần 2, lấy 1 lượng tương ứng 1 nhấn và làm lại các thao tác trên tới khi hết ngứa và xả lại thật sạch với nước\n- Mùa đông cách ngày gội lần, không sử dụng nước quá nóng, gây tổn thương cho da đầu\n- Mùa hè nên gội hàng ngày\n- Đi tiệm 2 ngày/lần, như vậy sẽ luôn giúp da đầu sạch sẽ\n* Là dầu gội 100% thiên nhiên, không chứa chất tạo bọt, hay hóa chất như các loại dầu gội thông thường, không chứa silicon', N'https://aorishop.com/wp-content/uploads/2022/11/z3924985322542_fca86c1074d36a0ea45bf10f4bcb7b54.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/DAU-GOI-2048x1449.jpg', NULL, N'- Làm sạch\n- Trị gàu, chống rụng tóc\n- Không gây khô hay nhờn tóc\n- Giúp tóc suôn mượt bồng bềnh, hương thơm thư giãn\n- Giúp tóc khỏe, phục hồi tóc hư tổn', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (19, N'BBCream Love World tinh chất hoa hồng SPF30+', 699000, N'Với công nghệ vật lý ứng dụng cơ lượng tử đột phá; BB Cream Love World là sản phẩm kem nền tích hợp tác dụng chống nắng hiệu quả cho làn da chị em phụ nữ, giúp bạn tự tin toả sáng suốt ngày dài năng động.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_bbcreamloveworldhoahongspf30%2B.jpg?alt=media&token=a4359899-5343-496b-b0e4-d53e7730d5c5', N'Các thành phần chính được chiết xuất từ trái dừa, nhân sâm, đài hoa hồng, nha đam, lá sống đời, rau má, thầu dầu cùng với tràm trà Úc và nước Vikill. Dưỡng chất Glycerin chiết xuất từ dừa giúp dưỡng ẩm cho da cùng vitamin B3 dưỡng trắng. Titanium Dioxide – chất tạo lớp makeup trang điểm chiết xuất từ đài hoa hồng đem lại hiệu quả chống nắng bất ngờ, làm kem lót cho lớp nền trang điểm, giúp trắng da, sáng đều màu da…Bên cạnh đó, ​​Propylene Glycol giúp khóa ẩm, ổn định nền kết hợp giữ nước công thức H3O2 và tinh dầu hoa hồng.', 1, N'( Dung lượng 30g )\n- Thoa BB cream 20-30 phút trước khi tiếp xúc với ánh nắng để đảm bảo da đã được chống nắng hoàn toàn\n* BB cream không chứa chì\n- Chống nắng chính nhờ titan Alocsi được chiết xuất từ đài hoa hồng, titan ngăn tia UV, và giúp da láng mịn\n- BB cream không có các thành phần vật lý hay hóa học nào\n- Ngoài chống nắng còn giúp da ngăn chặn được ánh sáng xanh', N'https://aorishop.com/wp-content/uploads/2022/11/z3925141017183_ea31df52e33f53cab41a52f74d3cfb7c.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/bb-cream-01-1-2048x1449.jpg', NULL, N'- Tạo 1 lớp nền trang điểm tươi tắn mỏng mịn\n- Khả năng che khuyết điểm tốt\n- Chống nắng\n- Dưỡng da tác dụng 5 trong một\n- Làm sáng chống nhăn và trị mụn', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (20, N'Nước lau sàn kháng khuẩn Love World', 333000, N'Không chỉ giúp sàn nhà sạch khuẩn và bảo vệ tổ ấm khỏi sự xâm nhập của muỗi dĩn, Gel lau sàn kháng khuẩn Love World còn nhẹ nhàng “hô biến” căn nhà của bạn thành một khu vườn đầy hoa Lavender với hương thơm nhẹ nhàng, lan tỏa suốt cả ngày dài.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_daily_world_nuoclausankhangkhuanloveworld.jpg?alt=media&token=d8dfde24-f66b-4646-9c70-c4421c89627c', N'Có thành phần chính từ Water Vikill (nước H3O2) có tác dụng diệt khuẩn mạnh và là dung dịch có khả năng thẩm tách cực mạnh, được sử dụng để khử mùi. Bên cạnh đó, các tinh chất Grapefruit (tinh chất bưởi), Lavender oil (Tinh dầu Lavender), Aloe essence (Tinh chất nha đam) và Ethyl alcohol (Cồn thực phẩm) giúp tạo mùi hương thơm dễ chịu, nhẹ nhàng cho Gel lau sàn.\nVới những thành phần từ 100% thiên nhiên, sản phẩm có công dụng làm sạch sàn nhà nhà, tủ bếp, bàn học…; khử các mùi hôi khó chịu; đuổi muỗi, xua đuổi côn trùng, rắn rết không đến gần khu vực nhà ở; diệt toàn bộ nấm mốc, vi khuẩn, virus và các vi sinh vật gây hại cực mạnh; tinh dầu Lavender với hương thơm dịu nhẹ còn giúp làm mát, giảm căng thẳng, xoa dịu cơn đau…', 2, N'- Hòa tan 2 nhấn nước lau sàn với 5 lít nước để lau bàn ghế, tủ, kệ, cửa kính,... sau đó mới sử dụng lau nhà cho lần 1.\n- Hòa tan 1 nhấn với 5 lít nước cho lần 2.\n- Hòa tan trong bình xịt dùng để đuổi côn trùng trú ẩn.\n* Sự khác biệt:\n- Ngoài việc lau đồ gỗ còn dùng để giặt tất, mùng, màn, ngâm rửa đồ chơi cho trẻ nhỏ.\n- Đặc biệt đuổi muỗi và các loại côn trùng chứ không làm hại vì sản phẩm 100% thiên nhiên.', N'https://aorishop.com/wp-content/uploads/2022/11/z3925143199781_62474386cb2b6215a9c1b024cdc27d14.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/GEL-LAU-SAN-2048x1449.jpg', NULL, N'- Diệt khuẩn mạnh./n- Khử mùi./n- Làm sạch sàn nhà, tủ bếp, bàn học,.../n- Đuổi muỗi, đuổi côn trùng, giảm stress', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (21, N'Kem đánh răng hương thảo Love World', 159000, N'Kem đánh răng thiên nhiên Love World là sự kết hợp hài hoà và tinh tế các tinh chất dược liệu tự nhiên có tác dụng làm dịu, giảm sưng tấy những tổn thương ở chân răng và lợi, bảo vệ lợi, chắc chân răng. Sản phẩm giúp làm sạch răng lợi và bảo vệ răng từ bên trong, đẩy lui chảy máu chân răng, nhiệt miệng, ê buốt răng, góp phần làm giảm sưng, ngừa viêm lợi, tụt lợi, viêm quanh răng.', N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Fquantum_beauty_world_kemdanhranghuongthaoloveworld.jpg?alt=media&token=91bde881-5641-4669-b387-5187845df3f9', N'Kem đánh răng Love World nổi trội với khả năng làm sạch mảng bám cứng đầu trên bề mặt răng mà không bào mòn men răng với Sodium Lauryl Sulfate chiết xuất từ muối than trúc và Metaphosphoric Acid từ chanh. Đặc biệt, với tinh chất làm trắng răng Silica chiết xuất từ bùn non thiên nhiên giúp răng bạn trắng sáng và làm sạch các vết ố lâu năm, cùng với Canxi tự nhiên phục hồi những vùng răng bị tổn thương do sâu răng giai đoạn đầu. Hương thơm tự nhiên chiết xuất từ tinh dầu đinh hương, táo, quế và bạc hà đem lại cho bạn hơi thở thơm mát suốt ngày dài, đánh tan nỗi lo về hơi thở có mùi. Thành phần nước vikill công nghệ cao diệt giúp diệt sạch vi khuẩn trong khoang miệng, ngăn ngừa tình trạng chảy máu chân răng, nhiệt miệng, ê buốt, cho bạn rạng rỡ với hàm răng khỏe mạnh. Với mục tiêu đặt sức khỏe người tiêu dùng lên hàng đầu, sản phẩm Kem đánh răng Love World cam kết chăm sóc cho sức khỏe răng miệng gia đình bạn một cách tốt nhất.', 2, N'- Đánh răng ngày 2-3 lần sau ăn 30 phút, lấy 1 lượng bằng hạt đậu xanh ra bàn chải và chải đều khắp khoang miệng đến khi sạch, súc miệng lại bằng nước.\n* Sự khác biệt:\n- Không chất hóa học hay flo, phù hợp với trẻ nhỏ, loại bỏ mảng bám cứng đầu trên bề mặt răng và không làm mòn men răng.\n- Sử dụng kem đánh răng Love World có thể nuốt mà không gây ảnh hưởng tới sức khỏe.', N'https://aorishop.com/wp-content/uploads/2022/11/z3924987475351_b4e403ea1244824b4003c3ab3cd3c0af-Copy.jpg', N'https://thegioiyeuthuong.vn/wp-content/uploads/2022/04/DAU-XA-KHO-2048x1449.jpg', NULL, N'- Sạch mảng bám, nawgn ngừa vi khuẩn hình thành.\n- Hôi miệng, làm làm viết thương.\n- Viêm nướu, viêm nha chu, chảy máu chân răng.', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (22, N'SERUM THẢO DƯỢC AI & YOU', 1200000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_serumthaoduocai%26you.jpg?alt=media&token=9bb1d315-4eb1-4b6e-8848-3860af03e7e1', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033364904341_3738d759a25bdc75b95b5a253f2c9f97.jpg', NULL, NULL, N'- Giúp giảm khô nứt môi\n- Làm khô đầu mụn\n- Làm lành vết thương hở\n- Làm teo búi trĩ\n- Vết rôm sảy em bé\n- Côn trùng cắn\n- Đặc biệt tốt cho bà bầu và trẻ em', N'Tinh dầu hoa nguyệt quế\nTinh dầu vỏ quả cam\nTinh dầu quả mù u\Tinh dầu oliu\Tinh dầu hoa cúc dại\nTinh dầu lá kim ngân\nTinh dầu ngãi cứu')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (23, N'Gel Vệ Sinh Phụ Nữ Love Lady', 400000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_gelvesinhphunulovelady.jpg?alt=media&token=cd59229a-0e56-4fe0-b7e5-ac1b4bb6c53b', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033365525398_eddb40af74890953ac21f318e9f405f6.jpg', NULL, NULL, N'- Sạch Khuẩn\n- Khử Mùi\n- Làm Lành Vết Viêm, Trầy Xước\n- Trắng Sáng Vùng Da Xung Quanh Cô', N'Tinh Dầu Bạc Hà\nTinh Chất Trà Xanh\nNước Vikill\nGlycerin ( Chiết xuất từ dừa)\nTinh Chất Nha Đam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (24, N'XỊT HỌNG HOMIE', 400000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_xithonghomie.jpg?alt=media&token=4a6255d4-1ac3-45a4-b2e7-85adad8cd2b6', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033364475037_e52207039083fac4dd2a913fca1ce13c.jpg', NULL, NULL, N'- Diệt khuẩn, diệt virus\n- Trị ho\n- Hỗ trợ trị viêm xoang, viêm mũi, viêm tai.\n- Hỗ trợ giảm chứng trào ngược dạ dày\n- Trị viêm nha chu, viêm nướu giảm hồi miệng.', N'Tinh dầu bạc hà\nChiết xuất hoa kim ngân\nChiết xuất trà xanh\nChiết xuất hoa cúc trắng\nChiếc xuất lá quế\nChiết xuất diệp hạ châu\nChiết xuất cây me đất\nChiết xuất bào tử nấm linh chi\nChiết xuất củ tam thất\nChiết xuất nghệ đen\nMật ong')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (25, N'GEL TIÊU', 399000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_geltieu.jpg?alt=media&token=0b298b47-1b7b-4e7c-b741-35790151d603', NULL, 4, N'3 lần / ngày vào buổi sáng trưa và tối\nCho vào lòng bàn tay một lượng vừa đủ, xoa đều lên vùng cần massage , massage nhẹ nhàng từ 15-20 phút.', N'https://aorishop.com/wp-content/uploads/2022/12/z4033365980576_af0c759698589743b7a11fd4dff3f5f1.jpg', NULL, NULL, N'- Hỗ trợ xương khớp.\n- Hỗ trợ trị rối loạn tiền đình.\n- Hỗ trợ lưu thông máu huyết.\n- Hỗ trợ giảm stress, cải thiện giấc ngủ.\n- Hỗ trợ giảm đau cho các nguyên nhân do thoát vị đĩa đệm và thoái hoá đốt sống.\n- Hỗ trợ ngăn ngừa lão hóa các đốt sống, khớp xương.\n- Hỗ trợ điều trị nội thương, không thoa lên vết thương hở.', N'Glycerin\nMenthol\nPropylene Glycol\nTetrasodium EDTA\nVanillyl Butyl Ether\nSodium Polyacrylate\nCI 19140 – CI 14720 – CI 42090\nPEG-40 Hydrogynated Castor Oil\nPiper Nigrum (Black Pepper)Seed Oil\nEthylhexylglycerin (and) Phenoxyethanol.')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (26, N'NƯỚC GIẶT SINH HỌC IWASH ( màu hồng hương hoa )', 180000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_nuocgiatsinhhociwash(mauhonghuonghoa).jpg?alt=media&token=10be9527-aa21-4d74-ba3d-1eccda50c306', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033365105333_4402b3f891e8d2f384d752bf071124af.jpg', NULL, NULL, N'- Làm sạch\n- Giữ màu\n- Mềm vải\n- Không kích ứng da\n- Dễ ủi\n- Diệt khuẩn\nĐối tượng : người lớn và trẻ em', N'Bồ hòn lên men\nEnzyme sinh học\nNước H3O2\nTinh dầu bạc hà\nTinh dầu cỏ dại\nTinh dầu hoa nguyệt quế\nMuối biển sâu')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (27, N'NƯỚC GIẶT SINH HỌC IWASH', 180000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_nuocgiatsinhhociwash.jpg?alt=media&token=4399e16d-97ff-4cd4-9730-71f1d0b8dfbb', NULL, 4, NULL, N'https://aorishop.com/wp-content/uploads/2022/12/z4033365275986_712cd69316fb7924b707269de03e7c39.jpg', NULL, NULL, N'- Làm sạch\n- Giữ màu\n- Mềm vải\n- Không kích ứng da\n- Dễ ủi\n- Diệt khuẩn\nĐối tượng : người lớn và trẻ em', N'Bồ hòn lên men\nEnzyme sinh học\nNước H3O2\nTinh dầu bạc hà\nTinh dầu cỏ dại\nTinh dầu hoa nguyệt quế\nMuối biển sâu')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MoTaSanPham], [HinhAnh], [MoTaChiTietSanPham], [MaDanhMucSanPham], [CachDungSanPham], [HinhAnh2], [HinhAnh3], [khuyenmai], [CongDung], [ThanhPhan]) VALUES (28, N'DETOXPRO', 1000000, NULL, N'https://firebasestorage.googleapis.com/v0/b/sanphamtieudung-2bc7e.appspot.com/o/Picture_SanPhamTieuDung%2Ftieu_dung_xanh_aori_detoxpro.jpg?alt=media&token=01939ca2-b5dd-4f4e-848f-d9504f724041', NULL, 4, N'Sau khi uống rượu bia : 1 gói / lần\nĐào thải độc tố : 2 gói / tuần', NULL, NULL, NULL, NULL, N' DETOXPRO – HỘP 5 GÓI\nTinh Chất Nhân Sâm: giúp tăng cường sức đề kháng & phục hồi cơ thể nhanh chóng\nTinh Chất Linh Chi: giúp đào thải độc tố, bảo vệ chức năng gan, thận, bao tử\nCao Cốt Nhàu: cung cấp các chất khoáng & vi lượng cần thiết cho cơ thể\nTinh Chất Sơn Mật: giải pháp tạo ngọt tự nhiên, cung cấp Insulin tốt cho người Tiểu Đường\nCao Cốt Cát Lồi: giúp bảo vệ chức năng gan, đặc biệt khi sử dụng đồ uống có cồn như rượu bia\nNước Vikill H3O2 : hấp thu nhanh chóng, hiệu quả các thành phần có lợi và giúp trung hòa lượng cồn trong cơ thể')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (1, N'Chờ xử lý')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (2, N'Đã xác nhận')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HD] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CTHD_HD]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SP] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CTHD_SP]
GO
ALTER TABLE [dbo].[ChucNang]  WITH CHECK ADD  CONSTRAINT [FK_CN_LTK] FOREIGN KEY([MaLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan])
GO
ALTER TABLE [dbo].[ChucNang] CHECK CONSTRAINT [FK_CN_LTK]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HD_ND] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HD_ND]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HD_PTTT] FOREIGN KEY([MaPhuongThuc])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPhuongThuc])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HD_PTTT]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HD_TT] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HD_TT]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ND_LTK] FOREIGN KEY([MaLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_ND_LTK]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_DMSP] FOREIGN KEY([MaDanhMucSanPham])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMucSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SP_DMSP]
GO
/****** Object:  StoredProcedure [dbo].[DonHang_XacNhanDon]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DonHang_XacNhanDon] @mahoadon int, @nhanVienThucHien int
as
begin
    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Sử dụng cấp độ cô lập REPEATABLE READ
	BEGIN TRAN;
	begin try
	UPDATE HoaDon
	SET MaTrangThai = 2, NhanVienThucHien = @nhanVienThucHien
	WHERE  MaHoaDon = @mahoadon;
	select @@IDENTITY
	WAITFOR DELAY '00:00:03';
	COMMIT;
	end try
	begin catch
		rollback tran
		select -1 as result
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllProducts] @madmsp int
as begin
select * from SanPham where MaDanhMucSanPham = @madmsp;
end
GO
/****** Object:  StoredProcedure [dbo].[getProductKhuyenMai]    Script Date: 6/1/2023 7:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductKhuyenMai]
as begin
select * from SanPham where khuyenmai = N'Có'
end
GO
USE [master]
GO
ALTER DATABASE [SanPhamTieuDung] SET  READ_WRITE 
GO
