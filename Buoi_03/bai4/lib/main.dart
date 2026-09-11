import 'package:flutter/material.dart';
import 'bai1.dart'; // Import file bài 1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentInfoScreen(), // Gọi màn hình từ bai1.dart
    );
  }
}