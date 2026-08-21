import 'dart:io';

void main() {
  // a. Nhập chuỗi và xuất ra màn hình
  stdout.write('Nhập vào 1 chuỗi: ');
  String s = stdin.readLineSync() ?? '';
  print('\na. Chuỗi vừa nhập: $s');

  // b. Đếm số ký tự là nguyên âm
  final vowels = 'ueoaiUEOAI';
  int vowelCount = 0;
  for (int i = 0; i < s.length; i++) {
    if (vowels.contains(s[i])) {
      vowelCount++;
    }
  }
  print('b. Số ký tự là nguyên âm: $vowelCount');

  // c. Đếm số từ
  List<String> words = s
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();
  print('c. Số từ trong chuỗi: ${words.length}');

  // d. Kiểm tra chuỗi đối xứng
  String reversedS = s.split('').reversed.join('');
  print('d. Chuỗi đối xứng: ${s == reversedS ? "Có" : "Không"}');

  // e. Đảo ngược các từ trong chuỗi
  String reversedWords = words.reversed.join(' ');
  print('e. Đảo ngược từ trong chuỗi: $reversedWords');
}
