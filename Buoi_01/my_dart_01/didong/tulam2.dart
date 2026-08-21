import 'dart:io';

void main() {
  stdout.write('Nhập số nguyên dương (> 10): ');
  String input = stdin.readLineSync()!;
  int n = int.parse(input);

  if (n <= 10) {
    print('Số nhập vào phải lớn hơn 10!');
    return;
  }

  // a. Đếm số chữ số
  int countDigits = input.length;
  print('a. Số lượng chữ số: $countDigits');

  // b. Tính tổng các chữ số & c. Kiểm tra có chữ số lẻ hay không
  int sum = 0;
  bool hasOdd = false;

  for (int i = 0; i < input.length; i++) {
    int digit = int.parse(input[i]);
    sum += digit;
    if (digit % 2 != 0) {
      hasOdd = true;
    }
  }

  print('b. Tổng các chữ số: $sum');
  print('c. Có chứa chữ số lẻ không: ${hasOdd ? "Có" : "Không"}');
}
