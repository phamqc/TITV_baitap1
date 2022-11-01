-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mywebsite
DROP DATABASE IF EXISTS `mywebsite`;
CREATE DATABASE IF NOT EXISTS `mywebsite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `mywebsite`;

-- Dumping structure for table mywebsite.chitietdonhang
DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `machitietdonhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sanpham` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `soluong` double DEFAULT 0,
  `giagoc` double DEFAULT 0,
  `giamgia` double DEFAULT 0,
  `giaban` double DEFAULT 0,
  `thuevat` double DEFAULT 0,
  `tongtien` double DEFAULT 0,
  PRIMARY KEY (`machitietdonhang`),
  KEY `FK_chitietdonhang_donhang` (`donhang`),
  KEY `FK_chitietdonhang_sanpham` (`sanpham`),
  CONSTRAINT `FK_chitietdonhang_donhang` FOREIGN KEY (`donhang`) REFERENCES `donhang` (`madonhang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_chitietdonhang_sanpham` FOREIGN KEY (`sanpham`) REFERENCES `sanpham` (`masanpham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mywebsite.chitietdonhang: ~3 rows (approximately)
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
REPLACE INTO `chitietdonhang` (`machitietdonhang`, `donhang`, `sanpham`, `soluong`, `giagoc`, `giamgia`, `giaban`, `thuevat`, `tongtien`) VALUES
	('CTDH1', 'DH1', 'SP1', 2, 12000, 2000, 15000, 0.1, 140000),
	('CTDH2', 'DH2', 'SP2', 1, 20000, 18000, 12000, 0.2, 140000),
	('CTDH3', 'DH3', 'SP3', 10, 30000, 10000, 400000, 0.1, 152000),
	('CTDH4', 'DH4', 'SP4', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;

-- Dumping structure for table mywebsite.donhang
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `madonhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `khachhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachinguoimua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachinguoinhan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangthai` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thanhtoan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tienthanhtoan` double NOT NULL,
  `tienthieu` double NOT NULL,
  `ngaydathang` date DEFAULT NULL,
  `ngaygiaohang` date DEFAULT NULL,
  PRIMARY KEY (`madonhang`),
  KEY `FK_donhang_khachhang` (`khachhang`),
  CONSTRAINT `FK_donhang_khachhang` FOREIGN KEY (`khachhang`) REFERENCES `khachhang` (`makhachhang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mywebsite.donhang: ~4 rows (approximately)
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
REPLACE INTO `donhang` (`madonhang`, `khachhang`, `diachinguoimua`, `diachinguoinhan`, `trangthai`, `thanhtoan`, `tienthanhtoan`, `tienthieu`, `ngaydathang`, `ngaygiaohang`) VALUES
	('DH1', 'KH1', 'HCM', 'HCM', 'dang giao', 'tien mat', 120000, 20000, '2022-10-31', '2022-11-02'),
	('DH2', 'KH2', 'Bien Hoa', 'Nha Trang', 'dang giao', 'tien mat', 1000000, 50000, '2022-10-31', '2022-10-31'),
	('DH3', 'KH3', 'Thanh Hoa', 'Vung Tau', 'da giao', 'Chuyen khoan', 1523600, 0, '2022-10-31', '2022-11-13'),
	('DH4', 'KH4', 'KomTum', 'Dong Thap', 'dang giao', 'tien mat', 150000, 0, '2022-10-31', '0000-00-00'),
	('DH5', 'KH5', 'Kien Giang', 'Lao Cai', 'da giao', 'chuyen khoan', 15890000, 1200000, '0000-00-00', '2022-10-31');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;

-- Dumping structure for table mywebsite.khachhang
DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `makhachhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tendangnhap` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioitinh` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachinhanhang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachimuahang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `sodienthoai` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dangkinhanbangtin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`makhachhang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mywebsite.khachhang: ~4 rows (approximately)
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
REPLACE INTO `khachhang` (`makhachhang`, `tendangnhap`, `matkhau`, `hoten`, `gioitinh`, `diachi`, `diachinhanhang`, `diachimuahang`, `ngaysinh`, `sodienthoai`, `email`, `dangkinhanbangtin`) VALUES
	('KH1', 'abc123', '147258', 'Nguyen Chau Anh', 'Nu', 'HCM', 'q2 tp.hcm', 'q10 tp.hcm', '2000-10-31', '0123654789', 'xyz@gmail.com', 'yes'),
	('KH2', 'qwerty', 'abcdef', 'Ngoc Long', 'Nam', 'Ha Noi', 'Dong Da, Ha Noi', 'Hai Phong', '1950-12-07', '0987456321', 'eghugkjv@gmail.com', 'no'),
	('KH3', 'zxcvbnm', 'asdfgh', 'Phi Hoang', 'Nam', 'Gia Lai', 'Thu Duc', 'Binh Dinh', '2003-06-14', '0123654725', 'poiuyt@gmail.com', 'yes'),
	('KH4', 'abcxyz', '159753', 'Duy Vu', 'Nam', 'Dong Nai', 'Ben Tre', 'Kien Giang', '1989-10-31', '0123457896', 'lmxjcnan@gmail.com', 'no'),
	('KH5', 'jafueasd', 'zxcvbnm', 'Chau ', 'Nu', 'Khanh Hoa', 'HCM', 'HCM', '1970-12-31', '0147852369', 'cbjfuie@gmail.com', 'no');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;

-- Dumping structure for table mywebsite.sanpham
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `masanpham` varchar(50) NOT NULL,
  `tensanpham` varchar(512) DEFAULT NULL,
  `matagia` varchar(255) DEFAULT NULL,
  `namxuatban` int(11) DEFAULT NULL,
  `gianhap` double DEFAULT NULL,
  `giagoc` double DEFAULT NULL,
  `giaban` double DEFAULT NULL,
  `soluong` double DEFAULT NULL,
  `matheloai` varchar(50) DEFAULT NULL,
  `ngonngu` varchar(255) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  PRIMARY KEY (`masanpham`),
  KEY `FK_sanpham_tacgia` (`matagia`) USING BTREE,
  KEY `FK_sanpham_theloai` (`matheloai`) USING BTREE,
  CONSTRAINT `FK_sanpham_tacgia` FOREIGN KEY (`matagia`) REFERENCES `tacgia` (`matacgia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sanpham_theloai` FOREIGN KEY (`matheloai`) REFERENCES `theloai` (`matheloai`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mywebsite.sanpham: ~5 rows (approximately)
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
REPLACE INTO `sanpham` (`masanpham`, `tensanpham`, `matagia`, `namxuatban`, `gianhap`, `giagoc`, `giaban`, `soluong`, `matheloai`, `ngonngu`, `mota`) VALUES
	('SP1', 'Java', 'TG1', 2000, 120000, 100000, 110000, 50, 'CT', 'Viet', NULL),
	('SP2', 'C/C++', 'TG2', 1950, 150000, 30000, 160000, 20, 'KH', 'Viet', NULL),
	('SP3', 'Python', 'TG3', 2003, 50000, 50000, 70000, 30, 'KT', 'Anh', NULL),
	('SP4', 'JS', 'TG4', 2000, 140000, 130000, 170000, 70, 'PL', 'Anh', NULL),
	('SP5', 'GoLang', 'TG5', 1980, 20000, 15000, 50000, 100, 'TT', 'Anh', NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;

-- Dumping structure for table mywebsite.tacgia
DROP TABLE IF EXISTS `tacgia`;
CREATE TABLE IF NOT EXISTS `tacgia` (
  `matacgia` varchar(255) NOT NULL,
  `hovaten` varchar(255) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `tieusu` text DEFAULT NULL,
  PRIMARY KEY (`matacgia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mywebsite.tacgia: ~5 rows (approximately)
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
REPLACE INTO `tacgia` (`matacgia`, `hovaten`, `ngaysinh`, `tieusu`) VALUES
	('TG1', 'Nguyen Van A', '2000-11-11', NULL),
	('TG2', 'Dao Trinh Trong', '1990-02-04', NULL),
	('TG3', 'Pham Hoang Huy', '1989-07-24', NULL),
	('TG4', 'Le Ngoc', '2003-10-31', NULL),
	('TG5', 'Nguyen Sang', '1995-08-21', NULL);
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;

-- Dumping structure for table mywebsite.theloai
DROP TABLE IF EXISTS `theloai`;
CREATE TABLE IF NOT EXISTS `theloai` (
  `matheloai` varchar(50) NOT NULL DEFAULT '',
  `tentheloai` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`matheloai`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mywebsite.theloai: ~4 rows (approximately)
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
REPLACE INTO `theloai` (`matheloai`, `tentheloai`) VALUES
	('CT', 'Chính trị'),
	('KH', 'Khoa học'),
	('KT', 'Kinh tế'),
	('PL', 'Pháp luật'),
	('TT', 'Trinh thám');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
