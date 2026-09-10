import 'dart:io';
import 'dart:math';

// Lớp trừu tượng Môn Học
abstract class MonHoc {
  String maMH;
  String tenMH;
  int soTinChi;

  MonHoc(this.maMH, this.tenMH, this.soTinChi);

  // Phương thức trừu tượng tính ĐTB
  double tinhDTB();

  // Quy đổi điểm hệ 4
  double quyDoiHe4() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return 4.0;
    if (dtb >= 7.0) return 3.0;
    if (dtb >= 5.5) return 2.0;
    if (dtb >= 4.0) return 1.0;
    return 0.0;
  }

  // Quy đổi điểm chữ
  String quyDoiDiemChu() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return "A";
    if (dtb >= 7.0) return "B";
    if (dtb >= 5.5) return "C";
    if (dtb >= 4.0) return "D";
    return "F";
  }

  // Xuất thông tin
  void xuatThongTin() {
    String dtbStr = tinhDTB().toStringAsFixed(2);
    String he4Str = quyDoiHe4().toStringAsFixed(1);
    stdout.write(
      "Ma: " +
          maMH +
          " | Ten: " +
          tenMH +
          " | Tin chi: " +
          soTinChi.toString() +
          " | DTB: " +
          dtbStr +
          " | He 4: " +
          he4Str +
          " | Diem chu: " +
          quyDoiDiemChu(),
    );
  }
}

// Lớp Lý Thuyết
class LyThuyet extends MonHoc {
  double diemTieuLuan;
  double diemCuoiKy;

  LyThuyet(
    String maMH,
    String tenMH,
    int soTinChi,
    this.diemTieuLuan,
    this.diemCuoiKy,
  ) : super(maMH, tenMH, soTinChi);

  @override
  double tinhDTB() {
    return diemTieuLuan * 0.3 + diemCuoiKy * 0.7;
  }

  @override
  void xuatThongTin() {
    super.xuatThongTin();
    print(" | Loai: Ly Thuyet");
  }
}

// Lớp Thực Hành
class ThucHanh extends MonHoc {
  double diemKT1;
  double diemKT2;
  double diemKT3;

  ThucHanh(
    String maMH,
    String tenMH,
    int soTinChi,
    this.diemKT1,
    this.diemKT2,
    this.diemKT3,
  ) : super(maMH, tenMH, soTinChi);

  @override
  double tinhDTB() {
    return (diemKT1 + diemKT2 + diemKT3) / 3;
  }

  @override
  void xuatThongTin() {
    super.xuatThongTin();
    print(" | Loai: Thuc Hanh");
  }
}

// Lớp Đồ Án
class DoAn extends MonHoc {
  double diemGVHD;
  double diemGVPB;

  DoAn(String maMH, String tenMH, int soTinChi, this.diemGVHD, this.diemGVPB)
    : super(maMH, tenMH, soTinChi);

  @override
  double tinhDTB() {
    return (diemGVHD + diemGVPB) / 2;
  }

  @override
  void xuatThongTin() {
    super.xuatThongTin();
    print(" | Loai: Do An");
  }
}

void main() {
  List<MonHoc> danhSach = [];

  // 7. Đọc nội dung file vào danh sách (Thực hiện trước để có data)
  String filePath = 'Buoi_02/monhoc.txt';
  File file = File(filePath);
  if (file.existsSync()) {
    List<String> lines = file.readAsLinesSync();
    for (String line in lines) {
      if (line.trim().isEmpty) continue;
      List<String> parts = line.split('#');
      String loai = parts[0].trim().toUpperCase();
      String ma = parts[1].trim();
      String ten = parts[2].trim();
      int tc = int.parse(parts[3].trim());

      if (loai == "LT") {
        danhSach.add(
          LyThuyet(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])),
        );
      } else if (loai == "TH") {
        danhSach.add(
          ThucHanh(
            ma,
            ten,
            tc,
            double.parse(parts[4]),
            double.parse(parts[5]),
            double.parse(parts[6]),
          ),
        );
      } else if (loai == "DA") {
        danhSach.add(
          DoAn(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])),
        );
      }
    }
    print("Da doc xong du lieu tu file " + filePath + " vao danh sach.");
  } else {
    print("Khong tim thay file " + filePath);
  }

  // 1. Nhập thêm danh sách môn học từ bàn phím
  print("\nNhap so luong mon hoc muon them tu ban phim (Nhap 0 de bo qua):");
  int soLuongThem = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
  for (int i = 0; i < soLuongThem; i++) {
    print("Chon loai mon (1: Ly thuyet, 2: Thuc hanh, 3: Do an): ");
    String loaiChon = stdin.readLineSync() ?? "1";

    print("Nhap ma mon hoc: ");
    String ma = stdin.readLineSync() ?? "";
    print("Nhap ten mon hoc: ");
    String ten = stdin.readLineSync() ?? "";
    print("Nhap so tin chi: ");
    int tc = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    if (loaiChon == "1") {
      print("Diem tieu luan: ");
      double d1 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      print("Diem cuoi ky: ");
      double d2 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      danhSach.add(LyThuyet(ma, ten, tc, d1, d2));
    } else if (loaiChon == "2") {
      print("Diem KT1: ");
      double d1 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      print("Diem KT2: ");
      double d2 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      print("Diem KT3: ");
      double d3 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      danhSach.add(ThucHanh(ma, ten, tc, d1, d2, d3));
    } else if (loaiChon == "3") {
      print("Diem GVHD: ");
      double d1 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      print("Diem GVPB: ");
      double d2 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      danhSach.add(DoAn(ma, ten, tc, d1, d2));
    }
  }

  // 2. Xuất danh sách môn học
  print("\nDANH SACH MON HOC:");
  for (var mh in danhSach) {
    mh.xuatThongTin();
  }

  // 3. Kiểm tra danh sách có sắp xếp tăng dần theo tên hay không
  bool isSortedByName = true;
  for (int i = 0; i < danhSach.length - 1; i++) {
    if (danhSach[i].tenMH.compareTo(danhSach[i + 1].tenMH) > 0) {
      isSortedByName = false;
      break;
    }
  }
  print(
    "\nDanh sach co duoc sap xep tang dan theo ten khong? " +
        (isSortedByName ? "Co" : "Khong"),
  );

  // 4. Sắp xếp danh sách tăng dần theo số tín chỉ
  danhSach.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
  print("\nDANH SACH SAU KHI SAP XEP TANG DAN THEO SO TIN CHI:");
  for (var mh in danhSach) {
    mh.xuatThongTin();
  }

  // 5. Các môn học có số tín chỉ cao nhất
  if (danhSach.isNotEmpty) {
    int maxTc = danhSach.map((e) => e.soTinChi).reduce(max);
    print("\nCAC MON HOC CO SO TIN CHI CAO NHAT (" + maxTc.toString() + "):");
    for (var mh in danhSach.where((e) => e.soTinChi == maxTc)) {
      mh.xuatThongTin();
    }
  }

  // 6. Tìm kiếm và thêm môn học nếu không có
  print("\nNhap ten mon hoc can tim: ");
  String tenTimKiem = stdin.readLineSync() ?? "";
  var dsTimKiem = danhSach
      .where((e) => e.tenMH.toLowerCase() == tenTimKiem.toLowerCase())
      .toList();

  if (dsTimKiem.isNotEmpty) {
    print("Da tim thay thong tin mon hoc:");
    for (var mh in dsTimKiem) {
      mh.xuatThongTin();
    }
  } else {
    print(
      "Khong tim thay! Vui long nhap them thong tin de bo sung (Mac dinh la mon Ly Thuyet).",
    );
    print("Nhap ma mon hoc: ");
    String ma = stdin.readLineSync() ?? "";
    print("Nhap so tin chi: ");
    int tc = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("Diem tieu luan: ");
    double d1 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("Diem cuoi ky: ");
    double d2 = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    LyThuyet monMoi = LyThuyet(ma, tenTimKiem, tc, d1, d2);
    danhSach.add(monMoi);
    print("Da them thanh cong mon hoc moi vao cuoi danh sach.");
  }

  // 8. Tính số tín chỉ trung bình của các môn học
  if (danhSach.isNotEmpty) {
    double tongTinChi = danhSach.fold(0, (sum, item) => sum + item.soTinChi);
    double trungBinhTinChi = tongTinChi / danhSach.length;
    print(
      "\nSO TIN CHI TRUNG BINH CUA CAC MON HOC LA: " +
          trungBinhTinChi.toStringAsFixed(2),
    );
  }
}
