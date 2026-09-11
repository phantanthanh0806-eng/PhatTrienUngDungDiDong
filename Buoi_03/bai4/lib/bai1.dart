import 'package:flutter/material.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0046A0),
        leading: const Icon(Icons.home, color: Colors.white),
        title: const Text('Thông tin sinh viên', style: TextStyle(color: Colors.white, fontSize: 18)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=12'),
            ),
            const SizedBox(height: 25),
            _buildRow('Họ và tên:', ' Nguyễn Văn A', valColor: const Color(0xFF003366), isBold: true),
            _buildRow('MSSV:', ' 2001221234', valColor: const Color(0xFFD32F2F), isBold: true),
            _buildRow('Lớp:', ' 13DHTH02', valColor: const Color(0xFF6D4C41)),
            _buildRow('Khóa:', ' 13 Đại học', valColor: const Color(0xFFD32F2F), isBold: true),
            _buildRow('Ngành:', ' Công nghệ thông tin', valColor: const Color(0xFFD32F2F), isBold: true),
            _buildRow('Trường:', ' Đại học Công Thương Thành phố Hồ Chí Minh', valColor: const Color(0xFFD32F2F), isBold: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEEEEEE),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Trở về', style: TextStyle(color: Colors.black87, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {required Color valColor, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: valColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}