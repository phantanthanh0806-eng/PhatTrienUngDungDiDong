import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0046A0),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Thông Tin Đề Tài Đồ Án', style: TextStyle(color: Colors.white, fontSize: 18)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.shade100, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'ĐỀ TÀI KHÓA LUẬN TỐT NGHIỆP',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE53935)),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 0.8),
              const SizedBox(height: 10),
              _buildSectionTitle('Mã đề tài:'),
              _buildSectionContent('DT202601'),
              _buildSectionTitle('Tên đề tài:'),
              _buildSectionContent('Xây dựng ứng dụng quản lý học tập đa nền tảng bằng Flutter'),
              _buildSectionTitle('Số lượng SV tối đa:'),
              _buildSectionContent('02 Sinh viên'),
              _buildSectionTitle('Chuyên ngành:'),
              _buildSectionContent('Công nghệ Phần mềm'),
              _buildSectionTitle('Giảng viên hướng dẫn:'),
              _buildSectionContent('ThS. Vũ Văn Vinh'),
              _buildSectionTitle('Yêu cầu đề tài:'),
              const Text(
                '- Hiểu rõ lập trình Flutter & Dart.\n'
                '- Sử dụng cơ sở dữ liệu Firebase / RESTful API.\n'
                '- Giao diện thân thiện, chuẩn Material Design.\n'
                '- Hoàn thành báo cáo đúng thời hạn.',
                style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 18),
                  label: const Text('Đăng Ký Đề Tài', style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0046A0),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF2979FF)),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}