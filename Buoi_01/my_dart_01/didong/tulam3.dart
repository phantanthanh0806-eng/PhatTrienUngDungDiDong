import 'dart:io';
import 'dart:math';

// Hàm kiểm tra số nguyên tố
bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  stdout.write('Nhập số lượng phần tử của danh sách: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> list = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Nhập phần tử thứ ${i + 1}: ');
    list.add(int.parse(stdin.readLineSync()!));
  }

  // a. Xuất danh sách vừa nhập
  print('\na. Danh sách vừa nhập: $list');

  // b. Tính tổng các phần tử
  int sum = list.fold(0, (prev, element) => prev + element);
  print('b. Tổng các phần tử: $sum');

  // c. Xuất các số nguyên tố
  List<int> primes = list.where((x) => isPrime(x)).toList();
  print('c. Các số nguyên tố trong danh sách: $primes');

  // d. Tìm kiếm và xử lý giá trị bất kỳ
  stdout.write('\nd. Nhập một giá trị cần tìm: ');
  int x = int.parse(stdin.readLineSync()!);

  int index = list.indexOf(x);
  if (index != -1) {
    print('Giá trị $x có trong danh sách tại vị trí (index): $index');
  } else {
    list.insert(0, x);
    print(
      'Giá trị $x không có trong danh sách. Đã thêm vào đầu danh sách: $list',
    );
  }
}
