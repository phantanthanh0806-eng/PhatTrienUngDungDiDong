import 'package:flutter/material.dart';

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông Tin Nhóm'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue[50],
              elevation: 3,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NHÓM ỨNG DỤNG',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Mã nhóm: sfsdfsdf', style: TextStyle(fontSize: 16)),
                    Text('Số lượng thành viên: 3', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Danh sách thành viên:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildMemberItem(
              mssv: '2001240001',
              name: 'Nguyễn Văn A',
              role: 'Nhóm trưởng',
              isLeader: true,
            ),
            _buildMemberItem(
              mssv: '2001240002',
              name: 'Trần Thị B',
              role: 'Thành viên',
              isLeader: false,
            ),
            _buildMemberItem(
              mssv: '2001240003',
              name: 'Phan Tấn Thành',
              role: 'Thành viên',
              isLeader: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberItem({
    required String mssv,
    required String name,
    required String role,
    required bool isLeader,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isLeader ? Colors.orange : Colors.grey,
          child: Icon(
            isLeader ? Icons.star : Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('MSSV: $mssv'),
        trailing: Text(
          role,
          style: TextStyle(
            color: isLeader ? Colors.red : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}