GO
USE master
GO
DROP DATABASE DATN_BERRYSHOES
GO
CREATE DATABASE DATN_BERRYSHOES
GO
USE DATN_BERRYSHOES
GO
	CREATE TABLE DiaChi (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdKhachHang INT  NULL,
	TenDuong NVARCHAR(100) NOT NULL,
	XaPhuong NVARCHAR(100) NOT NULL,
	QuanHuyen NVARCHAR(100) NOT NULL,
	TinhThanhPho NVARCHAR(100) NOT NULL,
	TenNguoiNhan NVARCHAR(100) NULL,
	SdtNguoiNhan VARCHAR(30) NULL,
	NgayTao DATETIME DEFAULT GETDATE()  NULL,
	NguoiTao NVARCHAR(100)  NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE()  NULL,
	NguoiCapNhat NVARCHAR(100)  NULL,
	TrangThai INT DEFAULT 0
	)
	GO
	CREATE TABLE PhuongThucThanhToan (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHoaDon INT  NULL,
	TenPhuongThuc NVARCHAR(50) NOT NULL,
	MoTa NVARCHAR(MAX) NULL,
	TongTien MONEY NOT NULL,
	MaGiaoDichVnPay VARCHAR(200)  NULL,
	NgayTao DATETIME DEFAULT GETDATE()  NULL,
	NguoiTao NVARCHAR(100)  NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE()  NULL,
	NguoiCapNhat NVARCHAR(100)  NULL,
	TrangThai INT DEFAULT 0
	)
	GO
	CREATE TABLE MauSac (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	MaMauSac VARCHAR(50),
	TenMauSac NVARCHAR(100) NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE()  NULL,
	NguoiTao NVARCHAR(100)  NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE()  NULL,
	NguoiCapNhat NVARCHAR(100)  NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE ChatLieu (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenChatLieu NVARCHAR(100) NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE DeGiay (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenDeGiay NVARCHAR(100) NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE ThuongHieu (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenThuongHieu NVARCHAR(100) NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE KichCo (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenKichCo NVARCHAR(50)  NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE SanPham (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdThuongHieu INT  NULL,
	IdChatLieu INT  NULL,
	IdDeGiay INT  NULL,
	MaSanPham NVARCHAR(MAX) NULL,
	TenSanPham NVARCHAR(300) NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1,
	[anh] [varchar](500) NULL,
	[giaBan] [int] NULL,
	)
	GO
	CREATE TABLE SanPhamChiTiet (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdSanPham INT  NULL,
	IdKichCo INT  NULL,
	IdMauSac INT  NULL,
	IdDotGiamGia INT NULL,
	MaSanPhamChiTiet NVARCHAR(MAX) NULL,
	QRCode NVARCHAR(MAX) NULL,
	SoLuong INT NULL,
	GiaTien MONEY NULL,
	MoTa NVARCHAR(MAX) NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 1
	)
	GO
	CREATE TABLE DotGiamGia (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	GiaTriGiam INT NOT NULL,
	NgayBatDau DATETIME NOT NULL,
	NgayKetThuc DATETIME NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT NOT NULL 
	)
	GO
	CREATE TABLE KhachHang (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	MaKhachHang VARCHAR(50),
	Anh VARCHAR(300) NULL,
	HoVaTen NVARCHAR(100) NOT NULL,
	NgaySinh DATE NULL,
	GioiTinh BIT DEFAULT 0,
	SoDienThoai VARCHAR(20) NULL,
	Email VARCHAR(50) NULL,
	TaiKhoan VARCHAR(50) NULL,
	MatKhau VARCHAR(300) NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT NOT NULL 
	)
	GO
	CREATE TABLE NhanVien(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	MaNhanVien VARCHAR(50),
	Anh VARCHAR(300) NULL,
	HoVaTen NVARCHAR(100) NOT NULL,
	NgaySinh DATE NULL,
	GioiTinh BIT, --DEFAULT 0,
	QueQuan NVARCHAR(200) NOT NULL,
	Cccd VARCHAR(20) NULL,
	SoDienThoai VARCHAR(20) NULL,
	Email VARCHAR(50) NULL,
	TaiKhoan VARCHAR(50) NULL,
	MatKhau VARCHAR(300) NULL,
	VaiTro INT DEFAULT 0,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT DEFAULT 0
	)
	GO
	CREATE TABLE GioHang (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdKhachHang INT UNIQUE  NULL,
	IdSanPhamChiTiet INT  NULL,
	SoLuong SMALLINT  NULL,
	NgayTao DATETIME DEFAULT GETDATE()  NULL,
	TrangThai BIT DEFAULT 0
	)
	GO
	CREATE TABLE HoaDon (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdNhanVien INT  NULL,
	IdKhachHang INT NULL,
	IdPhieuGiamGia INT NULL,
	Mahoadon NVARCHAR(100) UNIQUE NULL,
	TenKhachHang NVARCHAR(50) NULL,
	Email VARCHAR(100) NULL,
	SoDienThoai VARCHAR(20) NULL,
	DiaChi NVARCHAR(100) NULL,
	TienGiam MONEY NULL,
	TongTien MONEY  NULL,
	LoaiHoaDon BIT DEFAULT 0,
	PhiVanChuyen MONEY NULL,
	NgayXacNhan DATETIME NULL,
	NgayVanChuyen DATETIME NULL,
	NgayNhanHang DATETIME NULL,
	NgayHoanThanh DATETIME NULL,
	GhiChu NVARCHAR(MAX) NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT,
	[daThanhToan] [bit] NULL

	)
	GO
	CREATE TABLE HoaDonChiTiet (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHoaDon INT  NULL,
	IdSanPhamChiTiet INT NOT NULL,
	GiaSanPham MONEY NULL,
	SoLuong SMALLINT NULL,
	GhiChu NVARCHAR(MAX) NULL,
	TrangThai INT
	)
	GO
	CREATE TABLE LichSuHoaDon (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHoaDon INT   NULL,
	IdNhanVien INT   NULL,
	GhiChu NVARCHAR(MAX) NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT
	)
	GO
	CREATE TABLE KhachHangPhieuGiam (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdKhachHang INT  NULL,
	IdPhieuGiamGia INT NOT NULL,
	)
	GO
	CREATE TABLE PhieuGiamGia (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHoaDon INT   NULL,
	MaCode NVARCHAR(100) NULL,
	TenPhieu NVARCHAR(300) NOT NULL,
	GiaTriGiamToiDa MONEY NULL,--giảm tối đa là 40k
	GiaTriGiam INT NOT NULL,--giảm 50%
	DonToiThieu MONEY NULL,--tổng đơn là 100k
	SoLuong SMALLINT NULL,
	LoaiPhieu BIT DEFAULT 0,
	KieuPhieu BIT DEFAULT 0,
	NgayBatDau DATETIME NOT NULL,
	NgayKetThuc DATETIME NOT NULL,
	NgayTao DATETIME DEFAULT GETDATE(),
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE(),
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai INT NOT NULL
	)
	GO
	CREATE TABLE Anh (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdSanPhamChiTiet INT  NULL,
	TenAnh VARCHAR(300) NULL,
	NgayTao DATETIME DEFAULT GETDATE() NULL,
	NguoiTao NVARCHAR(100) NULL,
	LanCapNhatCuoi DATETIME DEFAULT GETDATE() NULL,
	NguoiCapNhat NVARCHAR(100) NULL,
	TrangThai BIT DEFAULT 1
	)
-- Bảng DiaChi
ALTER TABLE DiaChi
ADD CONSTRAINT FK_DiaChi_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id);

-- Bảng PhuongThucThanhToan
ALTER TABLE PhuongThucThanhToan
ADD CONSTRAINT FK_PhuongThucThanhToan_HoaDon FOREIGN KEY (IdHoaDon) REFERENCES HoaDon(Id);

-- Bảng SanPham
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_ThuongHieu FOREIGN KEY (IdThuongHieu) REFERENCES ThuongHieu(Id);
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_ChatLieu FOREIGN KEY (IdChatLieu) REFERENCES ChatLieu(Id);
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_DeGiay FOREIGN KEY (IdDeGiay) REFERENCES DeGiay(Id);

-- Bảng SanPhamChiTiet
ALTER TABLE SanPhamChiTiet ADD CONSTRAINT FK_SanPhamChiTiet_SanPham FOREIGN KEY (IdSanPham) REFERENCES SanPham(Id);
ALTER TABLE SanPhamChiTiet ADD CONSTRAINT FK_SanPhamChiTiet_KichCo FOREIGN KEY (IdKichCo) REFERENCES KichCo(Id);
ALTER TABLE SanPhamChiTiet ADD CONSTRAINT FK_SanPhamChiTiet_MauSac FOREIGN KEY (IdMauSac) REFERENCES MauSac(Id);
ALTER TABLE SanPhamChiTiet ADD CONSTRAINT FK_SanPhamChiTiet_DotGiamGia FOREIGN KEY (IdDotGiamGia) REFERENCES DotGiamGia(Id);

-- Bảng GioHang
ALTER TABLE GioHang ADD CONSTRAINT FK_GioHang_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id);
ALTER TABLE GioHang ADD CONSTRAINT FK_GioHang_SanPhamChiTiet FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(Id);

-- Bảng HoaDon
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (IdNhanVien) REFERENCES NhanVien(Id);
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id);
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_PhieuGiamGia FOREIGN KEY (IdPhieuGiamGia) REFERENCES PhieuGiamGia(Id);

-- Bảng HoaDonChiTiet
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_HoaDonChiTiet_HoaDon FOREIGN KEY (IdHoaDon) REFERENCES HoaDon(Id);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_HoaDonChiTiet_SanPhamChiTiet FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(Id);

-- Bảng LichSuHoaDon
ALTER TABLE LichSuHoaDon ADD CONSTRAINT FK_LichSuHoaDon_HoaDon FOREIGN KEY (IdHoaDon) REFERENCES HoaDon(Id);
ALTER TABLE LichSuHoaDon ADD CONSTRAINT FK_LichSuHoaDon_NhanVien FOREIGN KEY (IdNhanVien) REFERENCES NhanVien(Id);

-- Bảng KhachHangPhieuGiam
ALTER TABLE KhachHangPhieuGiam ADD CONSTRAINT FK_KhachHangPhieuGiam_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id);
ALTER TABLE KhachHangPhieuGiam ADD CONSTRAINT FK_KhachHangPhieuGiam_PhieuGiamGia FOREIGN KEY (IdPhieuGiamGia) REFERENCES PhieuGiamGia(Id);

-- Bảng Anh
ALTER TABLE Anh ADD CONSTRAINT FK_Anh_SanPhamChiTiet FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(Id);
GO
-- Bảng PhieuGiamGia
ALTER TABLE PhieuGiamGia ADD CONSTRAINT FK_PhieuGiamGia_HoaDon FOREIGN KEY (IdHoaDon) REFERENCES HoaDon(Id);

-- Bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, HoVaTen, SoDienThoai, Email, MatKhau, NguoiTao, NguoiCapNhat, TrangThai)
VALUES
('KH01', N'Nguyễn Văn Nam', '0909123456', 'namnv1@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH02', N'Lê Ánh Ngọc', '0912345678', 'ngocla2@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH03', N'Trần Quốc Nghĩa', '0923456789', 'nghiatq3@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH04', N'Nguyễn Phúc Long', '0934567890', 'longnp4@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH05', N'Kiều Khánh Huyền', '0945678901', 'huyenkh5@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH06', N'Nguyễn Thùy Linh', '0956789012', 'linhnt6@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH07', N'Bùi Huyền Anh', '0967890123', 'anhbh7@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH08', N'Đặng Phương Thảo', '0978901234', 'thaodpt8@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH09', N'Lê Hải Đăng', '0989012345', 'danghd9@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH10', N'Phùng Thanh Hiền', '0990123456', 'hienpt10@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH11', N'Nguyễn Anh Vũ', '0910112233', 'vuna11@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH12', N'Vũ Thùy Tiên', '0911223344', 'tienvt12@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH13', N'Lê Phương Anh', '0912334455', 'anhpa13@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH14', N'Nguyễn Thị Thùy Linh', '0913445566', 'linhnt14@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH15', N'Đỗ Ánh Dương', '0914556677', 'duongad15@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH16', N'Nguyễn Thúy Hằng', '0915667788', 'hangnt16@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH17', N'Nguyễn Anh Dũng', '0916778899', 'dungna17@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH18', N'Vũ Văn Nguyên', '0917889900', 'nguyenvv18@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH19', N'Hoàng Công Vinh', '0918990011', 'vinhhc19@gmail.com', '123456', N'Admin', N'Admin', 1),
('KH20', N'Bạch Văn Sơn', '0919001122', 'sonbv20@gmail.com', '123456', N'Admin', N'Admin', 1);

-- Bảng DiaChi
INSERT INTO DiaChi (IdKhachHang, TenDuong, XaPhuong, QuanHuyen, TinhThanhPho, TenNguoiNhan, SdtNguoiNhan, NguoiTao, NguoiCapNhat, TrangThai)
VALUES
(1, N'Trần Hưng Đạo', N'Tây Sơn', N'Hoa Lư', N'Ninh Bình', N'Nguyễn Văn Nam', '0909123456', N'Admin', N'Admin', 1),
(2, N'Phan Đình Phùng', N'Thạch Trung', N'Hải Châu', N'Đà Nẵng', N'Lê Ánh Ngọc', '0912345678', N'Admin', N'Admin', 1),
(3, N'Nguyễn Thái Học', N'Phú Thượng', N'Tây Hồ', N'Hà Nội', N'Trần Quốc Nghĩa', '0923456789', N'Admin', N'Admin', 1),
(4, N'Đường 3/2', N'Phường 2', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Nguyễn Phúc Long', '0934567890', N'Admin', N'Admin', 1),
(5, N'Nguyễn Hữu Cảnh', N'Phú Hữu', N'Nhà Bè', N'Tp. Hồ Chí Minh', N'Kiều Khánh Huyền', '0945678901', N'Admin', N'Admin', 1),
(6, N'Trần Não', N'Bình An', N'Thủ Đức', N'Tp. Hồ Chí Minh', N'Nguyễn Thùy Linh', '0956789012', N'Admin', N'Admin', 1),
(7, N'Phạm Hữu Lầu', N'Đa Kao', N'Quận 1', N'Tp. Hồ Chí Minh', N'Bùi Huyền Anh', '0967890123', N'Admin', N'Admin', 1),
(8, N'Hồng Bàng', N'An Hải Bắc', N'Sơn Trà', N'Đà Nẵng', N'Đặng Phương Thảo', '0978901234', N'Admin', N'Admin', 1),
(9, N'Hà Huy Tập', N'An Khê', N'Tam Kỳ', N'Quảng Nam', N'Lê Hải Đăng', '0989012345', N'Admin', N'Admin', 1),
(10, N'Quang Trung', N'Thường Định', N'Thành phố Thái Bình', N'Thái Bình', N'Phùng Thanh Hiền', '0990123456', N'Admin', N'Admin', 1),
(11, N'Nguyễn Đình Chiểu', N'Gia Quất', N'Thuận Thành', N'Bắc Ninh', N'Nguyễn Anh Vũ', '0910112233', N'Admin', N'Admin', 1),
(12, N'Lê Lợi', N'Phú Thượng', N'Tây Hồ', N'Hà Nội', N'Vũ Thùy Tiên', '0911223344', N'Admin', N'Admin', 1),
(13, N'Hà Bổng', N'Gia Huynh', N'Hương Khê', N'Hà Tĩnh', N'Lê Phương Anh', '0912334455', N'Admin', N'Admin', 1),
(14, N'Tôn Đức Thắng', N'Tân Hưng', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Nguyễn Thị Thùy Linh', '0913445566', N'Admin', N'Admin', 1),
(15, N'Hòa Hảo', N'Hòa An', N'Phú Nhuận', N'Tp. Hồ Chí Minh', N'Đỗ Ánh Dương', '0914556677', N'Admin', N'Admin', 1),
(16, N'Nguyễn Văn Cừ', N'Mỹ Đình', N'Thành phố Hải Phòng', N'Hải Phòng', N'Nguyễn Thúy Hằng', '0915667788', N'Admin', N'Admin', 1),
(17, N'Phạm Văn Đồng', N'Phú Đô', N'Nam Từ Liêm', N'Hà Nội', N'Nguyễn Anh Dũng', '0916778899', N'Admin', N'Admin', 1),
(18, N'Trần Đại Nghĩa', N'Đại Kim', N'Hoàng Mai', N'Hà Nội', N'Vũ Văn Nguyên', '0917889900', N'Admin', N'Admin', 1),
(19, N'Lê Văn Lương', N'Tân Hưng', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Hoàng Công Vinh', '0918990011', N'Admin', N'Admin', 1),
(20, N'Nguyễn Trãi', N'Hương Tích', N'Can Lộc', N'Hà Tĩnh', N'Bạch Văn Sơn', '0919001122', N'Admin', N'Admin', 1);

-- Bảng NhanVien
INSERT INTO NhanVien (MaNhanVien, HoVaTen, QueQuan, SoDienThoai, Email, MatKhau, VaiTro, NguoiTao, NguoiCapNhat, TrangThai)
VALUES
('NV01', N'Bùi Văn Hưng', N'Hà Nội', '0934567890', 'hungbv1@gmail.com', '123456', 1, N'Admin', N'Admin', 1),
('NV02', N'Nguyễn Văn Hải', N'Hà Nội', '0945678901', 'hainv2@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV03', N'Nguyễn Thành Đồng', N'Hà Nội', '0934567890', 'dongnt3@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV04', N'Nguyễn Thị Thùy Dương', N'Hưng Yên', '0945678901', 'duongntt4@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV05', N'Đỗ Trung Trường', N'Hà Nội', '0956789012', 'truongdt5@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV06', N'Nguyễn Văn Thắng', N'Hà Nội', '0967890123', 'thangnv6@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV07', N'Lê Thị Hương Giang', N'Hà Nội', '0978901234', 'gianglt7@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV08', N'Lê Văn Tiến', N'Hà Nội', '0989012345', 'tienlv8@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV09', N'Nguyễn Văn Huy', N'Hà Nội', '0990123456', 'huyhv9@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV10', N'Vũ Tiến Vinh', N'Hà Nội', '0901234567', 'vinhv10@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV11', N'Nguyễn Thị Ngọc Ánh', N'Hà Nội', '0912345678', 'anhnt11@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV12', N'Hoàng Văn Phương', N'Hà Nội', '0923456789', 'phuonghv12@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV13', N'Đặng Thị Thanh Lan', N'Hà Nội', '0934567890', 'lannt13@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV14', N'Nguyễn Trung Hiếu', N'Hà Nội', '0945678901', 'hieun14@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV15', N'Dương Quang Vinh', N'Hà Nội', '0956789012', 'vinhdq15@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV16', N'Vi Văn Thái', N'Hà Nội', '0967890123', 'thai.vv16@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV17', N'Vũ Trọng Minh', N'Hà Nội', '0978901234', 'minhvtr17@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV18', N'Truong Văn Thiện', N'Hà Nội', '0989012345', 'thientv18@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV19', N'Trần Tuấn Vũ', N'Hà Nội', '0990123456', 'vutuan19@gmail.com', '123456', 0, N'Admin', N'Admin', 1),
('NV20', N'Trương Hà Vy', N'Hà Nội', '0901234567', 'vyth21@gmail.com', '123456', 0, N'Admin', N'Admin', 1);

-- Bảng ThuongHieu
INSERT INTO ThuongHieu (TenThuongHieu, NguoiTao, NguoiCapNhat)
VALUES
(N'Nike', N'Admin', N'Admin'),
(N'Adidas', N'Admin', N'Admin'),
(N'Gucci', N'Admin', N'Admin'),
(N'Dolce', N'Admin', N'Admin'),
(N'Balenciaga', N'Admin', N'Admin'),
(N'Puma', N'Admin', N'Admin')

-- Bảng MauSac
INSERT INTO MauSac (MaMauSac, TenMauSac, NguoiTao, NguoiCapNhat)
VALUES
(N'#2e53c2', N'Xanh dương', N'Admin', N'Admin'),
(N'#f76808', N'Cam', N'Admin', N'Admin'),
(N'#f50505', N'Đỏ', N'Admin', N'Admin'),
(N'#030303', N'Đen', N'Admin', N'Admin'),
(N'#77e92b', N'Xanh lá', N'Admin', N'Admin'),
(N'#288a6a', N'Turquoise', N'Admin', N'Admin'),
(N'#0eccfb', N'Xanh nhạt', N'Admin', N'Admin'),
(N'#654206', N'Nâu', N'Admin', N'Admin'),
(N'#d1236f', N'Hồng', N'Admin', N'Admin'),
(N'#003b99', N'Xanh navy', N'Admin', N'Admin'),
(N'#ffcc00', N'Vàng', N'Admin', N'Admin'),
(N'#e6e6e6', N'Xám', N'Admin', N'Admin'),
(N'#ffffff', N'Trắng', N'Admin', N'Admin'),
(N'#f9f9f9', N'Kem', N'Admin', N'Admin'),
(N'#c0c0c0', N'Bạc', N'Admin', N'Admin'),
(N'#ffd700', N'Vàng kim', N'Admin', N'Admin'),
(N'#e5e500', N'Vàng chanh', N'Admin', N'Admin'),
(N'#000080', N'Xanh dương đậm', N'Admin', N'Admin'),
(N'#4b0082', N'Tím', N'Admin', N'Admin'),
(N'#ff6347', N'Tomato', N'Admin', N'Admin');

-- Bảng KichCo
INSERT INTO KichCo (TenKichCo, NguoiTao, NguoiCapNhat)
VALUES
(N'35', N'Admin', N'Admin'),
(N'36', N'Admin', N'Admin'),
(N'37', N'Admin', N'Admin'),
(N'38', N'Admin', N'Admin'),
(N'39', N'Admin', N'Admin'),
(N'40', N'Admin', N'Admin'),
(N'41', N'Admin', N'Admin'),
(N'42', N'Admin', N'Admin'),
(N'43', N'Admin', N'Admin'),
(N'44', N'Admin', N'Admin');

-- Bảng ChatLieu
INSERT INTO ChatLieu (TenChatLieu, NguoiTao, NguoiCapNhat)
VALUES
(N'Da', N'Admin', N'Admin'),
(N'Lụa', N'Admin', N'Admin'),
(N'Vải', N'Admin', N'Admin')

-- Bảng DeGiay
INSERT INTO DeGiay (TenDeGiay, NguoiTao, NguoiCapNhat)
VALUES
(N'Da', N'Admin', N'Admin'),
(N'Cao su', N'Admin', N'Admin'),
(N'Nhựa PU', N'Admin', N'Admin'),
(N'Boost', N'Admin', N'Admin'),
(N'Air', N'Admin', N'Admin')
-- Bảng SanPham
INSERT INTO SanPham (MaSanPham, IdThuongHieu, IdChatLieu, IdDeGiay, TenSanPham, NguoiTao, NguoiCapNhat)
VALUES
-- Sản phẩm cho thương hiệu Nike
(N'NIKE001', 1, 1, 1, N'Nike Air Max', N'Admin', N'Admin'),
(N'NIKE002', 1, 2, 2, N'Nike Zoom', N'Admin', N'Admin'),
(N'NIKE003', 1, 3, 3, N'Nike Pegasus', N'Admin', N'Admin'),

-- Sản phẩm cho thương hiệu Adidas
(N'ADIDAS001', 2, 1, 4, N'Adidas Ultraboost', N'Admin', N'Admin'),
(N'ADIDAS002', 2, 2, 2, N'Adidas NMD', N'Admin', N'Admin'),
(N'ADIDAS003', 2, 3, 1, N'Adidas Gazelle', N'Admin', N'Admin'),

-- Sản phẩm cho thương hiệu Gucci
(N'GUCCI001', 3, 1, 5, N'Gucci Rhyton', N'Admin', N'Admin'),
(N'GUCCI002', 3, 2, 3, N'Gucci Ace', N'Admin', N'Admin'),
(N'GUCCI003', 3, 3, 2, N'Gucci Screener', N'Admin', N'Admin'),

-- Sản phẩm cho thương hiệu Dolce
(N'DOLCE001', 4, 1, 2, N'Dolce Super King', N'Admin', N'Admin'),
(N'DOLCE002', 4, 2, 1, N'Dolce NS1', N'Admin', N'Admin'),
(N'DOLCE003', 4, 3, 4, N'Dolce Daymaster', N'Admin', N'Admin'),

-- Sản phẩm cho thương hiệu Balenciaga
(N'BALENCIAGA001', 5, 1, 3, N'Balenciaga Triple S', N'Admin', N'Admin'),
(N'BALENCIAGA002', 5, 2, 5, N'Balenciaga Speed', N'Admin', N'Admin'),
(N'BALENCIAGA003', 5, 3, 4, N'Balenciaga Track', N'Admin', N'Admin'),

-- Sản phẩm cho thương hiệu Puma
(N'PUMA001', 6, 1, 4, N'Puma RS-X', N'Admin', N'Admin'),
(N'PUMA002', 6, 2, 3, N'Puma Suede', N'Admin', N'Admin'),
(N'PUMA003', 6, 3, 2, N'Puma Cali', N'Admin', N'Admin');

-- Bảng SanPhamChiTiet
INSERT INTO SanPhamChiTiet (IdSanPham, IdKichCo, IdMauSac, IdDotGiamGia, QRCode, MaSanPhamChiTiet, SoLuong, MoTa, GiaTien, NguoiTao, NguoiCapNhat)
VALUES
-- Sản phẩm chi tiết cho Nike Air Max
(1, 1, 1, NULL, N'QR_NIKE001_35_1', N'NIKE001-35-1', 10, N'Size 35, màu Xanh dương', 3000000, N'Admin', N'Admin'),
(1, 2, 2, NULL, N'QR_NIKE001_36_2', N'NIKE001-36-2', 15, N'Size 36, màu Cam', 3000000, N'Admin', N'Admin'),
(1, 3, 3, NULL, N'QR_NIKE001_37_3', N'NIKE001-37-3', 20, N'Size 37, màu Đỏ', 3000000, N'Admin', N'Admin'),
(1, 4, 4, NULL, N'QR_NIKE001_38_4', N'NIKE001-38-4', 12, N'Size 38, màu Đen', 3000000, N'Admin', N'Admin'),
(1, 5, 5, NULL, N'QR_NIKE001_39_5', N'NIKE001-39-5', 8, N'Size 39, màu Xanh lá', 3000000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Nike Zoom
(2, 1, 6, NULL, N'QR_NIKE002_35_6', N'NIKE002-35-6', 10, N'Size 35, màu Turquoise', 3500000, N'Admin', N'Admin'),
(2, 2, 7, NULL, N'QR_NIKE002_36_7', N'NIKE002-36-7', 15, N'Size 36, màu Xanh nhạt', 3500000, N'Admin', N'Admin'),
(2, 3, 8, NULL, N'QR_NIKE002_37_8', N'NIKE002-37-8', 20, N'Size 37, màu Nâu', 3500000, N'Admin', N'Admin'),
(2, 4, 9, NULL, N'QR_NIKE002_38_9', N'NIKE002-38-9', 12, N'Size 38, màu Hồng', 3500000, N'Admin', N'Admin'),
(2, 5, 10, NULL, N'QR_NIKE002_39_10', N'NIKE002-39-10', 8, N'Size 39, màu Xanh navy', 3500000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Nike Pegasus
(3, 1, 11, NULL, N'QR_NIKE003_35_11', N'NIKE003-35-11', 10, N'Size 35, màu Vàng', 3200000, N'Admin', N'Admin'),
(3, 2, 12, NULL, N'QR_NIKE003_36_12', N'NIKE003-36-12', 15, N'Size 36, màu Xám', 3200000, N'Admin', N'Admin'),
(3, 3, 13, NULL, N'QR_NIKE003_37_13', N'NIKE003-37-13', 20, N'Size 37, màu Trắng', 3200000, N'Admin', N'Admin'),
(3, 4, 14, NULL, N'QR_NIKE003_38_14', N'NIKE003-38-14', 12, N'Size 38, màu Kem', 3200000, N'Admin', N'Admin'),
(3, 5, 15, NULL, N'QR_NIKE003_39_15', N'NIKE003-39-15', 8, N'Size 39, màu Bạc', 3200000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Adidas Ultraboost
(4, 1, 1, NULL, N'QR_ADIDAS001_35_1', N'ADIDAS001-35-1', 10, N'Size 35, màu Xanh dương', 4000000, N'Admin', N'Admin'),
(4, 2, 2, NULL, N'QR_ADIDAS001_36_2', N'ADIDAS001-36-2', 15, N'Size 36, màu Cam', 4000000, N'Admin', N'Admin'),
(4, 3, 3, NULL, N'QR_ADIDAS001_37_3', N'ADIDAS001-37-3', 20, N'Size 37, màu Đỏ', 4000000, N'Admin', N'Admin'),
(4, 4, 4, NULL, N'QR_ADIDAS001_38_4', N'ADIDAS001-38-4', 12, N'Size 38, màu Đen', 4000000, N'Admin', N'Admin'),
(4, 5, 5, NULL, N'QR_ADIDAS001_39_5', N'ADIDAS001-39-5', 8, N'Size 39, màu Xanh lá', 4000000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Gucci Rhyton
(7, 1, 6, NULL, N'QR_GUCCI001_35_6', N'GUCCI001-35-6', 10, N'Size 35, màu Turquoise', 1500000, N'Admin', N'Admin'),
(7, 2, 7, NULL, N'QR_GUCCI001_36_7', N'GUCCI001-36-7', 12, N'Size 36, màu Xanh nhạt', 1500000, N'Admin', N'Admin'),
(7, 3, 8, NULL, N'QR_GUCCI001_37_8', N'GUCCI001-37-8', 8, N'Size 37, màu Nâu', 1500000, N'Admin', N'Admin'),
(7, 4, 9, NULL, N'QR_GUCCI001_38_9', N'GUCCI001-38-9', 15, N'Size 38, màu Hồng', 1500000, N'Admin', N'Admin'),
(7, 5, 10, NULL, N'QR_GUCCI001_39_10', N'GUCCI001-39-10', 10, N'Size 39, màu Xanh navy', 1500000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Gucci Ace
(8, 1, 11, NULL, N'QR_GUCCI002_35_11', N'GUCCI002-35-11', 10, N'Size 35, màu Vàng', 1300000, N'Admin', N'Admin'),
(8, 2, 12, NULL, N'QR_GUCCI002_36_12', N'GUCCI002-36-12', 12, N'Size 36, màu Xám', 1300000, N'Admin', N'Admin'),
(8, 3, 13, NULL, N'QR_GUCCI002_37_13', N'GUCCI002-37-13', 8, N'Size 37, màu Trắng', 1300000, N'Admin', N'Admin'),
(8, 4, 14, NULL, N'QR_GUCCI002_38_14', N'GUCCI002-38-14', 15, N'Size 38, màu Kem', 1300000, N'Admin', N'Admin'),
(8, 5, 15, NULL, N'QR_GUCCI002_39_15', N'GUCCI002-39-15', 10, N'Size 39, màu Bạc', 1300000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Gucci Screener
(9, 1, 1, NULL, N'QR_GUCCI003_35_1', N'GUCCI003-35-1', 10, N'Size 35, màu Xanh dương', 1400000, N'Admin', N'Admin'),
(9, 2, 2, NULL, N'QR_GUCCI003_36_2', N'GUCCI003-36-2', 12, N'Size 36, màu Cam', 1400000, N'Admin', N'Admin'),
(9, 3, 3, NULL, N'QR_GUCCI003_37_3', N'GUCCI003-37-3', 8, N'Size 37, màu Đỏ', 1400000, N'Admin', N'Admin'),
(9, 4, 4, NULL, N'QR_GUCCI003_38_4', N'GUCCI003-38-4', 15, N'Size 38, màu Đen', 1400000, N'Admin', N'Admin'),
(9, 5, 5, NULL, N'QR_GUCCI003_39_5', N'GUCCI003-39-5', 10, N'Size 39, màu Xanh lá', 1400000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Dolce Super King
(10, 1, 6, NULL, N'QR_DOLCE001_35_6', N'DOLCE001-35-6', 12, N'Size 35, màu Turquoise', 1200000, N'Admin', N'Admin'),
(10, 2, 7, NULL, N'QR_DOLCE001_36_7', N'DOLCE001-36-7', 8, N'Size 36, màu Xanh nhạt', 1200000, N'Admin', N'Admin'),
(10, 3, 8, NULL, N'QR_DOLCE001_37_8', N'DOLCE001-37-8', 15, N'Size 37, màu Nâu', 1200000, N'Admin', N'Admin'),
(10, 4, 9, NULL, N'QR_DOLCE001_38_9', N'DOLCE001-38-9', 10, N'Size 38, màu Hồng', 1200000, N'Admin', N'Admin'),
(10, 5, 10, NULL, N'QR_DOLCE001_39_10', N'DOLCE001-39-10', 12, N'Size 39, màu Xanh navy', 1200000, N'Admin', N'Admin'),
-- Sản phẩm chi tiết cho Balenciaga Triple S
(13, 1, 1, NULL, N'QR_BALENCIAGA001_35_1', N'BALENCIAGA001-35-1', 10, N'Size 35, màu Xanh dương', 1800000, N'Admin', N'Admin'),
(13, 2, 2, NULL, N'QR_BALENCIAGA001_36_2', N'BALENCIAGA001-36-2', 8, N'Size 36, màu Cam', 1800000, N'Admin', N'Admin'),
(13, 3, 3, NULL, N'QR_BALENCIAGA001_37_3', N'BALENCIAGA001-37-3', 12, N'Size 37, màu Đỏ', 1800000, N'Admin', N'Admin'),
(13, 4, 4, NULL, N'QR_BALENCIAGA001_38_4', N'BALENCIAGA001-38-4', 10, N'Size 38, màu Đen', 1800000, N'Admin', N'Admin'),
(13, 5, 5, NULL, N'QR_BALENCIAGA001_39_5', N'BALENCIAGA001-39-5', 15, N'Size 39, màu Xanh lá', 1800000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Balenciaga Speed
(14, 1, 6, NULL, N'QR_BALENCIAGA002_35_6', N'BALENCIAGA002-35-6', 12, N'Size 35, màu Turquoise', 1500000, N'Admin', N'Admin'),
(14, 2, 7, NULL, N'QR_BALENCIAGA002_36_7', N'BALENCIAGA002-36-7', 8, N'Size 36, màu Xanh nhạt', 1500000, N'Admin', N'Admin'),
(14, 3, 8, NULL, N'QR_BALENCIAGA002_37_8', N'BALENCIAGA002-37-8', 10, N'Size 37, màu Nâu', 1500000, N'Admin', N'Admin'),
(14, 4, 9, NULL, N'QR_BALENCIAGA002_38_9', N'BALENCIAGA002-38-9', 15, N'Size 38, màu Hồng', 1500000, N'Admin', N'Admin'),
(14, 5, 10, NULL, N'QR_BALENCIAGA002_39_10', N'BALENCIAGA002-39-10', 10, N'Size 39, màu Xanh navy', 1500000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Balenciaga Track
(15, 1, 11, NULL, N'QR_BALENCIAGA003_35_11', N'BALENCIAGA003-35-11', 8, N'Size 35, màu Vàng', 1700000, N'Admin', N'Admin'),
(15, 2, 12, NULL, N'QR_BALENCIAGA003_36_12', N'BALENCIAGA003-36-12', 12, N'Size 36, màu Xám', 1700000, N'Admin', N'Admin'),
(15, 3, 13, NULL, N'QR_BALENCIAGA003_37_13', N'BALENCIAGA003-37-13', 15, N'Size 37, màu Trắng', 1700000, N'Admin', N'Admin'),
(15, 4, 14, NULL, N'QR_BALENCIAGA003_38_14', N'BALENCIAGA003-38-14', 10, N'Size 38, màu Kem', 1700000, N'Admin', N'Admin'),
(15, 5, 15, NULL, N'QR_BALENCIAGA003_39_15', N'BALENCIAGA003-39-15', 10, N'Size 39, màu Bạc', 1700000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Puma RS-X
(16, 1, 1, NULL, N'QR_PUMA001_35_1', N'PUMA001-35-1', 10, N'Size 35, màu Xanh dương', 350000, N'Admin', N'Admin'),
(16, 2, 2, NULL, N'QR_PUMA001_36_2', N'PUMA001-36-2', 12, N'Size 36, màu Cam', 350000, N'Admin', N'Admin'),
(16, 3, 3, NULL, N'QR_PUMA001_37_3', N'PUMA001-37-3', 8, N'Size 37, màu Đỏ', 350000, N'Admin', N'Admin'),
(16, 4, 4, NULL, N'QR_PUMA001_38_4', N'PUMA001-38-4', 15, N'Size 38, màu Đen', 350000, N'Admin', N'Admin'),
(16, 5, 5, NULL, N'QR_PUMA001_39_5', N'PUMA001-39-5', 10, N'Size 39, màu Xanh lá', 350000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Puma Suede
(17, 1, 6, NULL, N'QR_PUMA002_35_6', N'PUMA002-35-6', 12, N'Size 35, màu Turquoise', 330000, N'Admin', N'Admin'),
(17, 2, 7, NULL, N'QR_PUMA002_36_7', N'PUMA002-36-7', 8, N'Size 36, màu Xanh nhạt', 330000, N'Admin', N'Admin'),
(17, 3, 8, NULL, N'QR_PUMA002_37_8', N'PUMA002-37-8', 10, N'Size 37, màu Nâu', 330000, N'Admin', N'Admin'),
(17, 4, 9, NULL, N'QR_PUMA002_38_9', N'PUMA002-38-9', 15, N'Size 38, màu Hồng', 330000, N'Admin', N'Admin'),
(17, 5, 10, NULL, N'QR_PUMA002_39_10', N'PUMA002-39-10', 10, N'Size 39, màu Xanh navy', 330000, N'Admin', N'Admin'),

-- Sản phẩm chi tiết cho Puma Cali
(18, 1, 11, NULL, N'QR_PUMA003_35_11', N'PUMA003-35-11', 10, N'Size 35, màu Vàng', 340000, N'Admin', N'Admin'),
(18, 2, 12, NULL, N'QR_PUMA003_36_12', N'PUMA003-36-12', 8, N'Size 36, màu Xám', 340000, N'Admin', N'Admin'),
(18, 3, 13, NULL, N'QR_PUMA003_37_13', N'PUMA003-37-13', 12, N'Size 37, màu Trắng', 340000, N'Admin', N'Admin'),
(18, 4, 14, NULL, N'QR_PUMA003_38_14', N'PUMA003-38-14', 15, N'Size 38, màu Kem', 340000, N'Admin', N'Admin'),
(18, 5, 15, NULL, N'QR_PUMA003_39_15', N'PUMA003-39-15', 10, N'Size 39, màu Bạc', 340000, N'Admin', N'Admin');

-- Bảng HoaDon
INSERT INTO HoaDon (IdNhanVien, IdKhachHang, TenKhachHang, SoDienThoai, Mahoadon, DiaChi, Email, TongTien, NgayXacNhan, NgayVanChuyen, LoaiHoaDon, PhiVanChuyen, NguoiTao, NguoiCapNhat, GhiChu,TrangThai)
VALUES
(1, 1, N'Nguyễn Văn Nam', '0909123456', 'HD20231011', 'Trần Hưng Đạo, Tây Sơn, Hoa Lư, Ninh Bình', 'namnv1@gmail.com', 500000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 1', 1),
(2, 2, N'Lê Ánh Ngọc', '0912345678', 'HD20231012', 'Phan Đình Phùng, Thạch Trung, Hải Châu, Đà Nẵng', 'ngocla2@gmail.com', 600000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 2', 2),
(1, 3, N'Trần Quốc Nghĩa', '0923456789', 'HD20231013', 'Nguyễn Thái Học, Phú Thượng, Tây Hồ, Hà Nội', 'nghiatq3@gmail.com', 700000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 3', 3),
(2, 4, N'Nguyễn Phúc Long', '0934567890', 'HD20231014', 'Đường 3/2, Phường 2, Tân Bình, TP.HCM', 'longnp4@gmail.com', 800000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 4', 4),
(1, 5, N'Kiều Khánh Huyền', '0945678901', 'HD20231015', 'Nguyễn Hữu Cảnh, Phú Hữu, Nhà Bè, TP.HCM', 'huyenkh5@gmail.com', 900000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 5', 5),
(2, 6, N'Nguyễn Thùy Linh', '0956789012', 'HD20231016', 'Trần Não, Bình An, Thủ Đức, TP.HCM', 'linhnt6@gmail.com', 1000000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 6', 1),
(1, 7, N'Bùi Huyền Anh', '0967890123', 'HD20231017', 'Phạm Hữu Lầu, Đa Kao, Quận 1, TP.HCM', 'anhbh7@gmail.com', 1100000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 7', 2),
(2, 8, N'Đặng Phương Thảo', '0978901234', 'HD20231018', 'Hồng Bàng, An Hải Bắc, Sơn Trà, Đà Nẵng', 'thaodpt8@gmail.com', 1200000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 8', 3),
(1, 9, N'Lê Hải Đăng', '0989012345', 'HD20231019', 'Hà Huy Tập, An Khê, Tam Kỳ, Quảng Nam', 'danghd9@gmail.com', 1300000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 9', 4),
(2, 10, N'Phùng Thanh Hiền', '0990123456', 'HD20231020', 'Quang Trung, Thường Định, Thành phố Thái Bình, Thái Bình', 'hienpt10@gmail.com', 1400000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 10', 5),
(1, 11, N'Nguyễn Anh Vũ', '0910112233', 'HD20231021', 'Nguyễn Đình Chiểu, Gia Quất, Thuận Thành, Bắc Ninh', 'vuna11@gmail.com', 1500000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 11', 1),
(2, 12, N'Vũ Thùy Tiên', '0911223344', 'HD20231022', 'Lê Lợi, Phú Thượng, Tây Hồ, Hà Nội', 'tienvt12@gmail.com', 1600000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 12', 2),
(1, 13, N'Lê Phương Anh', '0912334455', 'HD20231023', 'Hà Bổng, Gia Huynh, Hương Khê, Hà Tĩnh', 'anhpa13@gmail.com', 1700000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 13', 3),
(2, 14, N'Nguyễn Thị Thùy Linh', '0913445566', 'HD20231024', 'Tôn Đức Thắng, Tân Hưng, Tân Bình, TP.HCM', 'linhnt14@gmail.com', 1800000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 14', 4),
(1, 15, N'Đỗ Ánh Dương', '0914556677', 'HD20231025', 'Hòa Hảo, Hòa An, Phú Nhuận, TP.HCM', 'duongad15@gmail.com', 1900000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 15', 5),
(2, 16, N'Nguyễn Thúy Hằng', '0915667788', 'HD20231026', 'Nguyễn Văn Cừ, Mỹ Đình, Thành phố Hải Phòng, Hải Phòng', 'hangnt16@gmail.com', 2000000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 16', 1),
(1, 17, N'Nguyễn Anh Dũng', '0916778899', 'HD20231027', 'Phạm Văn Đồng, Phú Đô, Nam Từ Liêm, Hà Nội', 'dungna17@gmail.com', 2100000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 17', 2),
(2, 18, N'Vũ Văn Nguyên', '0917889900', 'HD20231028', 'Trần Đại Nghĩa, Đại Kim, Hoàng Mai, Hà Nội', 'nguyenvv18@gmail.com', 2200000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 18', 3),
(1, 19, N'Hoàng Công Vinh', '0918990011', 'HD20231029', 'Lê Văn Lương, Tân Hưng, Tân Bình, TP.HCM', 'vinhhc19@gmail.com', 2300000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 19', 4),
(2, 20, N'Bạch Văn Sơn', '0919001122', 'HD20231030', 'Nguyễn Trãi, Hương Tích, Can Lộc, Hà Tĩnh', 'sonbv20@gmail.com', 2400000, GETDATE(), NULL, 1, 30000, 'Admin', 'Admin', 'Ghi chú hóa đơn 20', 5);

--Bảng HoaDonChiTiet
INSERT INTO HoaDonChiTiet (IdHoaDon, IdSanPhamChiTiet, GiaSanPham, SoLuong, GhiChu,TrangThai)
VALUES
(1, 1, 250000, 2, NULL, 1), -- Tổng: 500000
(1, 2, 300000, 1, NULL, 1), -- Tổng: 300000
(2, 3, 600000, 1, NULL, 1), -- Tổng: 600000
(3, 4, 700000, 1, NULL, 1), -- Tổng: 700000
(4, 5, 800000, 1, NULL, 1), -- Tổng: 800000
(5, 6, 900000, 1, NULL, 1), -- Tổng: 900000
(6, 7, 1000000, 1, NULL, 1), -- Tổng: 1000000
(7, 8, 1100000, 1, NULL, 1), -- Tổng: 1100000
(8, 9, 1200000, 1, NULL, 1), -- Tổng: 1200000
(9, 10, 1300000, 1, NULL, 1), -- Tổng: 1300000
(10, 11, 1400000, 1, NULL, 1), -- Tổng: 1400000
(11, 12, 1500000, 1, NULL, 1), -- Tổng: 1500000
(12, 13, 1600000, 1, NULL, 1), -- Tổng: 1600000
(13, 14, 1700000, 1, NULL, 1), -- Tổng: 1700000
(14, 15, 1800000, 1, NULL, 1), -- Tổng: 1800000
(15, 16, 1900000, 1, NULL, 1), -- Tổng: 1900000
(16, 17, 2000000, 1, NULL, 1), -- Tổng: 2000000
(17, 18, 2100000, 1, NULL, 1), -- Tổng: 2100000
(18, 19, 2200000, 1, NULL, 1) -- Tổng: 2200000

-- Bảng PhieuGiamGia
INSERT INTO PhieuGiamGia (IdHoaDon, MaCode, TenPhieu, GiaTriGiamToiDa, GiaTriGiam, DonToiThieu, SoLuong, LoaiPhieu, KieuPhieu, NgayBatDau, NgayKetThuc, NguoiTao, NguoiCapNhat, TrangThai)
VALUES
(1, 'PGG001', N'Giảm 10%', 500000, 10, 100000, 100, 0, 0, '2024-01-01', '2024-12-31', 'Admin', 'Admin', 1),
(2, 'PGG002', N'Giảm 20%', 1000000, 20, 200000, 50, 0, 0, '2024-01-01', '2024-12-31', 'Admin', 'Admin', 1),
(3, 'PGG003', N'Giảm 15%', 700000, 15, 150000, 80, 0, 0, '2024-01-01', '2024-12-31', 'Admin', 'Admin', 1)

-- Bảng GioHang
INSERT INTO GioHang (IdKhachHang, IdSanPhamChiTiet)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
