import 'package:flutter/material.dart';

class LecturerInfoScreen extends StatelessWidget {
  const LecturerInfoScreen({super.key});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://img.freepik.com/free-vector/teacher-concept-illustration_114360-1638.jpg',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Giảng viên Trần Thị A',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF003366)),
            ),
            const SizedBox(height: 20),
            _buildRow('Khoa:', ' Công nghệ Thông tin', valColor: const Color(0xFFD32F2F), isBold: true),
            _buildRow('Học hàm:', ' Thạc sỹ', valColor: Colors.black87),
            _buildRow('Chuyên ngành:', ' CNPM', valColor: const Color(0xFF00897B), isBold: true),
            _buildRow(
              'Giảng dạy:',
              ' Nhập môn lập trình, Lập trình windows, Lập trình we...',
              valColor: const Color(0xFF1976D2),
              isBold: true,
            ),
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