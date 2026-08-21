import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Nhập số lượng phần tử cần tạo: ');
  int n = int.parse(stdin.readLineSync()!);

  // Tạo danh sách ngẫu nhiên trong khoảng [5, 100]
  Random rng = Random();
  List<int> list = List.generate(n, (_) => 5 + rng.nextInt(96));

  // a. Xuất danh sách
  print('\na. Danh sách phần tử: $list');

  // b. Trung bình cộng các số lẻ
  List<int> oddNumbers = list.where((x) => x % 2 != 0).toList();
  if (oddNumbers.isEmpty) {
    print('b. Danh sách không có số lẻ.');
  } else {
    double avgOdd = oddNumbers.reduce((a, b) => a + b) / oddNumbers.length;
    print('b. Trung bình cộng các số lẻ: $avgOdd');
  }

  // c. Kiểm tra danh sách đối xứng
  bool isSymmetric = true;
  for (int i = 0; i < list.length ~/ 2; i++) {
    if (list[i] != list[list.length - 1 - i]) {
      isSymmetric = false;
      break;
    }
  }
  print('c. Danh sách đối xứng: ${isSymmetric ? "Có" : "Không"}');

  // d. Kiểm tra danh sách tăng dần
  bool isAscending = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      isAscending = false;
      break;
    }
  }
  print('d. Danh sách được sắp xếp tăng dần: ${isAscending ? "Có" : "Không"}');

  // e. Phần tử lớn nhất
  int maxVal = list.reduce(max);
  print('e. Phần tử lớn nhất: $maxVal');

  // f. Phần tử chẵn lớn nhất
  List<int> evenNumbers = list.where((x) => x % 2 == 0).toList();
  if (evenNumbers.isEmpty) {
    print('f. Danh sách không có số chẵn.');
  } else {
    int maxEven = evenNumbers.reduce(max);
    print('f. Phần tử chẵn lớn nhất: $maxEven');
  }

  // g. Tìm và xóa giá trị
  stdout.write('\ng. Nhập giá trị cần tìm: ');
  int x = int.parse(stdin.readLineSync()!);

  if (list.contains(x)) {
    list.removeWhere((element) => element == x);
    print('Đã tìm thấy $x và xóa khỏi danh sách. Danh sách mới: $list');
  } else {
    print('Không tìm thấy.');
  }
}
