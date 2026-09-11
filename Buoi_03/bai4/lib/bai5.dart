import 'package:flutter/material.dart';

class DepartmentInfoScreen extends StatelessWidget {
  const DepartmentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0046A0),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Giới Thiệu Ngành Học - HUIT', style: TextStyle(color: Colors.white, fontSize: 18)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'KHOA CÔNG NGHỆ THÔNG TIN\nTRƯỜNG ĐH CÔNG THƯƠNG TP.HCM',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5), height: 1.3),
            ),
            const SizedBox(height: 20),
            _buildMajorCard(
              icon: Icons.computer,
              title: '1. NGÀNH CÔNG NGHỆ THÔNG TIN',
              titleColor: const Color(0xFF3F51B5),
              tongQuan: 'Ngành Công nghệ Thông tin đào tạo sinh viên kiến thức chuyên sâu về phát triển phần mềm, quản trị hệ thống, trí tuệ nhân tạo và xử lý dữ liệu.',
              coHoi: 'Lập trình viên, Chuyên viên phân tích hệ thống, Quản trị cơ sở dữ liệu, Kiểm thử phần mềm.',
            ),
            const SizedBox(height: 16),
            _buildMajorCard(
              icon: Icons.security,
              title: '2. NGÀNH AN TOÀN THÔNG TIN',
              titleColor: const Color(0xFFE53935),
              tongQuan: 'Ngành An toàn Thông tin trang bị kỹ năng bảo mật hệ thống, phòng chống tấn công mạng, mật mã học và ứng cứu sự cố an ninh mạng.',
              coHoi: 'Chuyên viên an ninh mạng, Chuyên viên kiểm thử bảo mật (Pentester), Quản trị bảo mật hệ thống.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMajorCard({
    required IconData icon,
    required String title,
    required Color titleColor,
    required String tongQuan,
    required String coHoi,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: titleColor, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: titleColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 0.8),
          const SizedBox(height: 6),
          const Text('Tổng quan:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(tongQuan, style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.3)),
          const SizedBox(height: 10),
          const Text('Cơ hội nghề nghiệp:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(coHoi, style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.3)),
        ],
      ),
    );
  }
}