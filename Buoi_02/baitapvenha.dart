import 'dart:io';

abstract class HoaDon {
  String _maKH = '';
  String _tenKH = '';
  int _soLuong = 0;
  double _giaBan = 0;

  HoaDon();

  HoaDon.full(String maKH, String tenKH, int soLuong, double giaBan) {
    this.maKH = maKH;
    this.tenKH = tenKH;
    this.soLuong = soLuong;
    this.giaBan = giaBan;
  }

  String get maKH => _maKH;
  set maKH(String value) {
    if (!RegExp(r'^KH\d{4}$').hasMatch(value)) {
      throw FormatException('Mã KH phải dạng KHxxxx (4 chữ số).');
    }
    _maKH = value;
  }

  String get tenKH => _tenKH;
  set tenKH(String value) {
    if (value.trim().isEmpty) throw ArgumentError('Tên không được để trống.');
    _tenKH = value;
  }

  int get soLuong => _soLuong;
  set soLuong(int value) {
    if (value <= 0) throw ArgumentError('Số lượng phải > 0.');
    _soLuong = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0) throw ArgumentError('Giá bán phải > 0.');
    _giaBan = value;
  }

  double tinhChietKhau();
  double tinhTroGia() => 0.0;
  double tinhThueVAT() => 0.10 * (_soLuong * _giaBan);
  double tinhThanhTien() => (_soLuong * _giaBan) - tinhChietKhau() + tinhThueVAT();

  void nhap() {
    while (true) {
      try {
        stdout.write('Nhập mã KH (VD: KH0002): ');
        maKH = stdin.readLineSync() ?? '';
        break;
      } catch (e) {
        print('Lỗi: ${e.toString()}');
      }
    }
    while (true) {
      try {
        stdout.write('Nhập tên KH: ');
        tenKH = stdin.readLineSync() ?? '';
        break;
      } catch (e) {
        print('Lỗi: ${e.toString()}');
      }
    }
    while (true) {
      try {
        stdout.write('Nhập số lượng (>0): ');
        soLuong = int.parse(stdin.readLineSync() ?? '0');
        break;
      } catch (e) {
        print('Lỗi: Số lượng phải > 0.');
      }
    }
    while (true) {
      try {
        stdout.write('Nhập giá bán (>0): ');
        giaBan = double.parse(stdin.readLineSync() ?? '0');
        break;
      } catch (e) {
        print('Lỗi: Giá bán phải > 0.');
      }
    }
  }

  void xuat() {
    print('Mã KH: $_maKH | Tên: $_tenKH | SL: $_soLuong | Giá: $_giaBan');
    print('CK: ${tinhChietKhau()} | Trợ giá: ${tinhTroGia()} | VAT: ${tinhThueVAT()} | Thành tiền: ${tinhThanhTien()}');
  }
}

class HoaDonCaNhan extends HoaDon {
  double khoangCach = 0;

  HoaDonCaNhan() : super();
  HoaDonCaNhan.full(String maKH, String tenKH, int soLuong, double giaBan, this.khoangCach)
      : super.full(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double ck = (soLuong >= 3) ? (0.05 * giaBan * soLuong) : 0;
    if (khoangCach < 10) ck += (50000.0 * soLuong);
    return ck;
  }

  @override
  double tinhTroGia() {
    return (0.02 * giaBan * soLuong) + ((soLuong > 2) ? 100000.0 : 0.0);
  }

  @override
  void nhap() {
    super.nhap();
    stdout.write('Nhập khoảng cách giao hàng (km): ');
    khoangCach = double.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void xuat() {
    print('[KH Cá Nhân]');
    super.xuat();
    print('Khoảng cách: ${khoangCach}km');
  }
}

class HoaDonDaiLyCap1 extends HoaDon {
  int thoiGianHopTac = 0;

  HoaDonDaiLyCap1() : super();
  HoaDonDaiLyCap1.full(String maKH, String tenKH, int soLuong, double giaBan, this.thoiGianHopTac)
      : super.full(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double tyLe = 0.30;
    if (thoiGianHopTac > 5) tyLe += (thoiGianHopTac - 5) * 0.01;
    if (tyLe > 0.35) tyLe = 0.35;
    return tyLe * giaBan * soLuong;
  }

  @override
  void nhap() {
    super.nhap();
    stdout.write('Nhập thời gian hợp tác (năm): ');
    thoiGianHopTac = int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void xuat() {
    print('[Đại Lý Cấp 1]');
    super.xuat();
    print('Hợp tác: $thoiGianHopTac năm');
  }
}

class HoaDonCongTy extends HoaDon {
  int soNhanVien = 0;

  HoaDonCongTy() : super();
  HoaDonCongTy.full(String maKH, String tenKH, int soLuong, double giaBan, this.soNhanVien)
      : super.full(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double tyLe = 0;
    if (soNhanVien > 5000) tyLe = 0.07;
    else if (soNhanVien > 1000) tyLe = 0.05;
    return tyLe * giaBan * soLuong;
  }

  @override
  double tinhTroGia() => 120000.0 * soLuong;

  @override
  void nhap() {
    super.nhap();
    stdout.write('Nhập số nhân viên công ty: ');
    soNhanVien = int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void xuat() {
    print('[KH Công Ty]');
    super.xuat();
    print('Số nhân viên: $soNhanVien');
  }
}

class QuanLyHoaDon {
  List<HoaDon> ds = [];

  void nhapDanhSach() {
    stdout.write('Nhập số hóa đơn: ');
    int n = int.parse(stdin.readLineSync() ?? '0');
    for (int i = 0; i < n; i++) {
      print('\n--- Hóa đơn ${i + 1} ---');
      print('1: KH Cá nhân | 2: Đại lý cấp 1 | 3: KH Công ty');
      stdout.write('Chọn loại KH: ');
      int loai = int.parse(stdin.readLineSync() ?? '1');
      HoaDon hd = (loai == 2) ? HoaDonDaiLyCap1() : (loai == 3 ? HoaDonCongTy() : HoaDonCaNhan());
      hd.nhap();
      ds.add(hd);
    }
  }

  void xuatDanhSach() {
    if (ds.isEmpty) return print('Danh sách trống.');
    for (var hd in ds) {
      hd.xuat();
      print('-----------------------');
    }
  }

  double tinhTongThanhTien() => ds.fold(0, (sum, item) => sum + item.tinhThanhTien());
  double tinhTongTroGia() => ds.fold(0, (sum, item) => sum + item.tinhTroGia());

  void timKHMuaNhieuNhat() {
    if (ds.isEmpty) return;
    int maxSL = ds.map((e) => e.soLuong).reduce((a, b) => a > b ? a : b);
    print('\n--- KHÁCH HÀNG MUA NHIỀU NHẤT (SL: $maxSL) ---');
    ds.where((e) => e.soLuong == maxSL).forEach((e) => e.xuat());
  }

  double tinhTongCKCongTy() =>
      ds.whereType<HoaDonCongTy>().fold(0, (sum, item) => sum + item.tinhChietKhau());

  void sapXep() {
    ds.sort((a, b) {
      if (a.soLuong != b.soLuong) return a.soLuong.compareTo(b.soLuong);
      return b.tinhThanhTien().compareTo(a.tinhThanhTien());
    });
    print('\nĐã sắp xếp danh sách!');
  }

  void timKiemTheoMa(String maX) {
    var res = ds.where((e) => e.maKH.toUpperCase() == maX.toUpperCase());
    if (res.isEmpty) {
      print('\nKhách hàng lạ');
    } else {
      print('\n--- KẾT QUẢ TÌM KIẾM ---');
      res.forEach((e) => e.xuat());
    }
  }
}

void main() {
  QuanLyHoaDon ql = QuanLyHoaDon();
  while (true) {
    print('\n1.Nhập | 2.Xuất | 3.Tổng tiền | 4.Tổng trợ giá | 5.SL lớn nhất | 6.CK Công ty | 7.Sắp xếp | 8.Tìm mã | 0.Thoát');
    stdout.write('Chọn: ');
    switch (stdin.readLineSync()) {
      case '1': ql.nhapDanhSach(); break;
      case '2': ql.xuatDanhSach(); break;
      case '3': print('Tổng tiền: ${ql.tinhTongThanhTien()}'); break;
      case '4': print('Tổng trợ giá: ${ql.tinhTongTroGia()}'); break;
      case '5': ql.timKHMuaNhieuNhat(); break;
      case '6': print('Tổng CK KH Công ty: ${ql.tinhTongCKCongTy()}'); break;
      case '7': ql.sapXep(); ql.xuatDanhSach(); break;
      case '8': 
        stdout.write('Nhập mã x: ');
        ql.timKiemTheoMa(stdin.readLineSync() ?? '');
        break;
      case '0': return;
    }
  }
}