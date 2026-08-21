import 'dart:io';

void main() {
  // Nhập số lượng que kem
  stdout.write('Nhập số que kem cần mua (> 0): ');
  int quantity = int.parse(stdin.readLineSync()!);

  if (quantity <= 0) {
    print('Số que kem phải lớn hơn 0!');
    return;
  }

  // Nhập đơn giá
  stdout.write('Nhập giá tiền 1 que kem: ');
  double price = double.parse(stdin.readLineSync()!);

  // Tính tổng tiền gốc
  double total = quantity * price;

  // Xét các mức giảm giá
  if (quantity > 10) {
    total *= 0.90; // Giảm 10%
  } else if (quantity >= 5) {
    total *= 0.95; // Giảm 5%
  }

  print('Số tiền phải trả: $total VNĐ');
}
