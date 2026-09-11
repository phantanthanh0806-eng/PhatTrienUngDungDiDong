import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0046A0),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Chi Tiết Sản Phẩm', style: TextStyle(color: Colors.white, fontSize: 18)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hình ảnh sản phẩm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductBox(Icons.phone_iphone, const Color(0xFF1E88E5), const Color(0xFFE3F2FD)),
                _buildProductBox(Icons.smartphone, const Color(0xFFFB8C00), const Color(0xFFFFF3E0)),
                _buildProductBox(Icons.mobile_friendly, const Color(0xFF43A047), const Color(0xFFE8F5E9)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'iPhone 15 Pro Max 256GB',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5)),
            ),
            const SizedBox(height: 10),
            _buildInfoText('Mã sản phẩm: ', 'SP-IP15PM'),
            _buildInfoText('Nhà sản xuất: ', 'Apple Inc.'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: const [
                  Text('Giá bán: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    '29.990.000 VNĐ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFFE53935)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text('Mô tả sản phẩm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 6),
            const Text(
              'Khung vỏ Titanium siêu bền, chip Apple A17 Pro đỉnh cao hiệu năng, nút Hành động tùy chỉnh và hệ thống camera chuyên nghiệp 48MP zoom quang học 5x.',
              style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text('THÊM VÀO GIỎ HÀNG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3D00),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductBox(IconData icon, Color iconColor, Color bgColor) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withOpacity(0.5), width: 1.5),
      ),
      child: Center(child: Icon(icon, size: 45, color: iconColor)),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(value, style: const TextStyle(fontSize: 15, color: Colors.black87)),
        ],
      ),
    );
  }
}