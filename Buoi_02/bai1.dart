import 'dart:io';

// Lớp cơ sở trừu tượng đại diện cho một phòng trọ
abstract class PhongTro {
  String maPhong;
  int soNguoiO;
  double soDien;
  double soNuoc;

  PhongTro(this.maPhong, this.soNguoiO, this.soDien, this.soNuoc);

  // Phương thức trừu tượng tính tiền phòng
  double tinhTienPhong();

  // Phương thức xuất thông tin
  void xuatThongTin() {
    stdout.write(
      "Ma phong: " +
          maPhong +
          " | So nguoi o: " +
          soNguoiO.toString() +
          " | So dien: " +
          soDien.toString() +
          " | So nuoc: " +
          soNuoc.toString(),
    );
  }
}

// Lớp phòng loại A kế thừa từ PhongTro
class PhongLoaiA extends PhongTro {
  int soNguoiThan;

  PhongLoaiA(
    String maPhong,
    int soNguoiO,
    double soDien,
    double soNuoc,
    this.soNguoiThan,
  ) : super(maPhong, soNguoiO, soDien, soNuoc);

  @override
  double tinhTienPhong() {
    return 1400 + 2 * soDien + 8 * soNuoc + 50 * soNguoiThan;
  }

  @override
  void xuatThongTin() {
    super.xuatThongTin();
    print(
      " | So nguoi than: " +
          soNguoiThan.toString() +
          " | Loai: A | Tien phong: " +
          tinhTienPhong().toString(),
    );
  }
}

// Lớp phòng loại B kế thừa từ PhongTro
class PhongLoaiB extends PhongTro {
  double giaTui;
  int soMay;

  PhongLoaiB(
    String maPhong,
    int soNguoiO,
    double soDien,
    double soNuoc,
    this.giaTui,
    this.soMay,
  ) : super(maPhong, soNguoiO, soDien, soNuoc);

  @override
  double tinhTienPhong() {
    return 2000 + 2 * soDien + 8 * soNuoc + giaTui * 5 + soMay * 100;
  }

  @override
  void xuatThongTin() {
    super.xuatThongTin();
    print(
      " | Giat ui: " +
          giaTui.toString() +
          " kg" +
          " | So may internet: " +
          soMay.toString() +
          " | Loai: B | Tien phong: " +
          tinhTienPhong().toString(),
    );
  }
}

void main() {
  List<PhongTro> danhSachPhong = [];
  String filePath = 'Buoi_02/phongthue.txt';
  File file = File(filePath);

  // 1. Đọc nội dung file phongthue.txt vào danh sách phòng thuê
  if (file.existsSync()) {
    List<String> lines = file.readAsLinesSync();
    for (String line in lines) {
      if (line.trim().isEmpty) continue;

      List<String> parts = line.split('#');
      String maPhong = parts[0].trim();
      int soNguoiO = int.parse(parts[1].trim());
      double soDien = double.parse(parts[2].trim());
      double soNuoc = double.parse(parts[3].trim());

      if (maPhong.toUpperCase().startsWith("A")) {
        int soNguoiThan = int.parse(parts[4].trim());
        danhSachPhong.add(
          PhongLoaiA(maPhong, soNguoiO, soDien, soNuoc, soNguoiThan),
        );
      } else if (maPhong.toUpperCase().startsWith("B")) {
        double giaTui = double.parse(parts[4].trim());
        int soMay = int.parse(parts[5].trim());
        danhSachPhong.add(
          PhongLoaiB(maPhong, soNguoiO, soDien, soNuoc, giaTui, soMay),
        );
      }
    }
  } else {
    print("Khong tim thay file " + filePath);
    return;
  }

  // 2. In ra màn hình thông tin các phòng thuê có trong danh sách
  print("DANH SACH TAT CA CAC PHONG THUE:");
  for (var phong in danhSachPhong) {
    phong.xuatThongTin();
  }
  print("");

  // 3. In ra danh sách các phòng có số người thuê lớn hơn 2
  print("DANH SACH PHONG CO SO NGUOI THUE > 2:");
  var phongNhieuNguoi = danhSachPhong.where((p) => p.soNguoiO > 2).toList();
  for (var phong in phongNhieuNguoi) {
    phong.xuatThongTin();
  }
  print("");

  // 4. Tính tổng tiền phòng thu được từ các phòng
  double tongTien = danhSachPhong.fold(0, (sum, p) => sum + p.tinhTienPhong());
  print("TONG TIEN PHONG THU DUOC: " + tongTien.toString());
  print("");

  // 5. Sắp xếp danh sách phòng thuê theo thứ tự giảm dần của số điện tiêu thụ
  print("DANH SACH PHONG THEO THU TU GIAM DAN CUA SO DIEN:");
  var danhSachSapXep = List<PhongTro>.from(danhSachPhong);
  danhSachSapXep.sort((a, b) => b.soDien.compareTo(a.soDien));
  for (var phong in danhSachSapXep) {
    phong.xuatThongTin();
  }
  print("");

  // 6. In ra màn hình danh sách các phòng loại A
  print("DANH SACH CAC PHONG LOAI A:");
  var danhSachPhongA = danhSachPhong.whereType<PhongLoaiA>().toList();
  for (var phong in danhSachPhongA) {
    phong.xuatThongTin();
  }
}
