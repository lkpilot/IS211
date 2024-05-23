-- Thiet ke csdl tai CN1
CREATE TABLE CN1.CHINHANH (
    MACN VARCHAR2(10) PRIMARY KEY,
    TENCN VARCHAR2(50) UNIQUE,
    DIACHI VARCHAR2(100)
);

CREATE TABLE CN1.KHACHHANG (
    MAKH VARCHAR2(10) PRIMARY KEY,
    TENKH VARCHAR2(50),
    SDT VARCHAR2(15) UNIQUE,
    NGTG DATE,
    DOANHSO NUMBER,
    DTL NUMBER
);

CREATE TABLE CN1.NHANVIEN (
    MANV VARCHAR2(10) PRIMARY KEY,
    TENNV VARCHAR2(50),
    NGVL DATE,
    SDT VARCHAR2(15),
    CHUCVU VARCHAR2(20) CHECK (CHUCVU IN ('Thu ngan', 'Boi ban', 'Quan ly')),
    LUONG NUMBER,
    TINHTRANG VARCHAR2(20) CHECK (TINHTRANG IN ('Dang lam viec', 'Da nghi viec')),
    MACN VARCHAR2(10),
    FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN)
);

CREATE TABLE CN1.MONAN (
    MAMA VARCHAR2(10) PRIMARY KEY,
    TENMON VARCHAR2(50),
    DONGIA NUMBER,
    MOTA VARCHAR2(200),
    LOAIMA VARCHAR2(50)
);

CREATE TABLE CN1.BAN (
    MABAN VARCHAR2(10) PRIMARY KEY,
    TENBAN VARCHAR2(50),
    TRANGTHAI VARCHAR2(50) CHECK (TRANGTHAI IN ('Dang dung bua', 'Da dat truoc', 'Dang trong'))
);

CREATE TABLE CN1.HDCHINHANH_QL (
    MAHD VARCHAR2(10) PRIMARY KEY,
    MAKH VARCHAR2(10),
    NGHD DATE,
    TONGTIEN NUMBER,
    MACN VARCHAR2(10),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN)
);

CREATE TABLE CN1.HDCHINHANH_NV (
    MAHD VARCHAR2(10) PRIMARY KEY,
    MANV1 VARCHAR2(10),
    MANV2 VARCHAR2(10),
    MABAN VARCHAR2(10),
    MACN VARCHAR2(10),
    FOREIGN KEY (MANV1) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MANV2) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MABAN) REFERENCES BAN(MABAN),
    FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN)
);

CREATE TABLE CN1.CTHD (
    MAHD VARCHAR2(10),
    MAMA VARCHAR2(10),
    SL NUMBER,
    DONGIA NUMBER,
    PRIMARY KEY (MAHD, MAMA),
    FOREIGN KEY (MAHD) REFERENCES HDCHINHANH_QL(MAHD),
    FOREIGN KEY (MAMA) REFERENCES MONAN(MAMA)
);

-- Them du lieu tai CN1
-- CHINHANH
INSERT INTO CN1.CHINHANH VALUES ('CN1','Dreamers, Thu Duc', 'Lang Dai Hoc, Thu Duc');

-- KHACHHANG
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH001', 'Nguyen Van A', '0901234567', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1500000, 10);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH002', 'Tran Thi B', '0912345678', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2000000, 15);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH003', 'Le Van C', '0923456789', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 1800000, 12);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH004', 'Pham Thi D', '0934567890', TO_DATE('2023-04-10', 'YYYY-MM-DD'), 2200000, 18);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH005', 'Hoang Van E', '0945678901', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 2500000, 20);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH006', 'Nguyen Thi F', '0956789012', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 3000000, 25);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH007', 'Tran Van G', '0967890123', TO_DATE('2023-07-18', 'YYYY-MM-DD'), 2800000, 22);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH008', 'Le Thi H', '0978901234', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 3300000, 30);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH009', 'Pham Van I', '0989012345', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 2700000, 24);
INSERT INTO CN1.KHACHHANG (MAKH, TENKH, SDT, NGTG, DOANHSO, DTL) VALUES
('KH010', 'Ho Thi K', '0990123456', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 3200000, 28);

-- NHANVIEN
INSERT INTO CN1.NHANVIEN (MANV, TENNV, NGVL, SDT, CHUCVU, LUONG, TINHTRANG, MACN) VALUES
('NV001', 'Tran Van An', TO_DATE('2022-01-05', 'YYYY-MM-DD'), '0912345678', 'Thu ngan', 12000000, 'Dang lam viec', 'CN1');
INSERT INTO CN1.NHANVIEN (MANV, TENNV, NGVL, SDT, CHUCVU, LUONG, TINHTRANG, MACN) VALUES
('NV002', 'Nguyen Thi Binh', TO_DATE('2022-02-10', 'YYYY-MM-DD'), '0923456789', 'Boi ban', 10000000, 'Dang lam viec', 'CN1');
INSERT INTO CN1.NHANVIEN (MANV, TENNV, NGVL, SDT, CHUCVU, LUONG, TINHTRANG, MACN) VALUES
('NV003', 'Le Van Cuong', TO_DATE('2022-03-15', 'YYYY-MM-DD'), '0934567890', 'Quan ly', 15000000, 'Dang lam viec', 'CN1');
INSERT INTO CN1.NHANVIEN (MANV, TENNV, NGVL, SDT, CHUCVU, LUONG, TINHTRANG, MACN) VALUES
('NV004', 'Pham Thi Dung', TO_DATE('2022-04-20', 'YYYY-MM-DD'), '0945678901', 'Thu ngan', 12000000, 'Da nghi viec', 'CN1');
INSERT INTO CN1.NHANVIEN (MANV, TENNV, NGVL, SDT, CHUCVU, LUONG, TINHTRANG, MACN) VALUES
('NV005', 'Hoang Van Eo', TO_DATE('2022-05-25', 'YYYY-MM-DD'), '0956789012', 'Boi ban', 10000000, 'Dang lam viec', 'CN1');

-- MONAN
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA001', 'Bun rieu', 35000, 'Bun rieu cay nong, nuoc dung thom ngon', 'Mi, Bun');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA002', 'Com chien', 25000, 'Com chien hap dan, co them rau song', 'Com');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA003', 'Pho bo', 40000, 'Pho bo nuoc dung dam da, thit mem', 'Mi, Bun');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA004', 'Goi cuon', 30000, 'Goi cuon tuoi ngon, nhe nhang', 'Goi cuon');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA005', 'Banh mi chao', 28000, 'Banh mi chao gion thom, an kem sot', 'Banh mi');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA006', 'Banh xeo', 32000, 'Banh xeo nuoc mam pha chua ngot', 'Banh xeo');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA007', 'Com nieu', 30000, 'Com nieu hap dan, thom phuc', 'Com');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA008', 'Hu tieu', 38000, 'Hu tieu nuoc dung dam da, an kem rau song', 'Mi, Bun');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA009', 'Nem cuon', 32000, 'Nem cuon tuoi ngon, an kem nuoc mam pha chua ngot', 'Nem cuon');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES
('MA010', 'Bun thit nuong', 35000, 'Bun thit nuong banh trang, an kem gia vi', 'Mi, Bun');
INSERT INTO CN1.MONAN (MAMA, TENMON, DONGIA, MOTA, LOAIMA) VALUES ('MA011', 'Mi xao', 50000, 'Mi xao ngon', 'Mi');

-- BAN
INSERT INTO CN1.BAN (MABAN, TENBAN, TRANGTHAI) VALUES
('B001', 'Ban 1', 'Dang trong');
INSERT INTO CN1.BAN (MABAN, TENBAN, TRANGTHAI) VALUES
('B002', 'Ban 2', 'Dang trong');
INSERT INTO CN1.BAN (MABAN, TENBAN, TRANGTHAI) VALUES
('B003', 'Ban 3', 'Dang trong');
INSERT INTO CN1.BAN (MABAN, TENBAN, TRANGTHAI) VALUES
('B004', 'Ban 4', 'Da dat truoc');
INSERT INTO CN1.BAN (MABAN, TENBAN, TRANGTHAI) VALUES
('B005', 'Ban 5', 'Dang dung bua');

-- HDCHINHANH_QL
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES
('HD001', 'KH001', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 120000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES
('HD002', 'KH002', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 180000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES
('HD003', 'KH003', TO_DATE('2023-03-25', 'YYYY-MM-DD'), 150000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES
('HD004', 'KH004', TO_DATE('2023-04-10', 'YYYY-MM-DD'), 200000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES
('HD005', 'KH005', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 160000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES 
('HD006', 'KH001', TO_DATE('1/1/2024', 'DD/MM/YYYY'), 800000, 'CN1');
INSERT INTO CN1.HDCHINHANH_QL (MAHD, MAKH, NGHD, TONGTIEN, MACN) VALUES 
('HD007', 'KH001', TO_DATE('1/1/2024', 'DD/MM/YYYY'), 700000, 'CN1');

-- HDCHINHANH_NV
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD001', 'NV001', 'NV005', 'B001', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD002', 'NV001', 'NV002', 'B002', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD003', 'NV004', 'NV002', 'B003', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD004', 'NV004', 'NV005', 'B004', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD005', 'NV004', 'NV002', 'B005', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD006', 'NV001', 'NV002', 'B002', 'CN1');
INSERT INTO CN1.HDCHINHANH_NV (MAHD, MANV1, MANV2, MABAN, MACN) VALUES
('HD007', 'NV001', 'NV002', 'B001', 'CN1');

-- CTHD
INSERT INTO CN1.CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD001', 'MA001', 2, 60000);
INSERT INTO CN1.CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD002', 'MA002', 3, 60000);
INSERT INTO CN1.CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD003', 'MA003', 2, 75000);
INSERT INTO CN1.CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD004', 'MA004', 1, 200000);
INSERT INTO CN1.CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD005', 'MA005', 2, 80000);
INSERT INTO CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD006', 'MA011', 5, 50000);
INSERT INTO CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD006', 'MA010', 3, 50000);
INSERT INTO CTHD (MAHD, MAMA, SL, DONGIA) VALUES
('HD007', 'MA009', 5, 20000);
--------------------------------------