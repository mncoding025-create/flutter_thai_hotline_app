import 'package:flutter/material.dart';
// Import หน้า Splash Screen ที่เราทำไว้เป็นหน้าแรก
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart'; 

// ฟังก์ชัน main() ที่ระบบตามหา!
void main() {
  runApp(const ThaiHotlineApp());
}

class ThaiHotlineApp extends StatelessWidget {
  const ThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดป้ายคาด Debug สีแดงมุมขวาบน
      title: 'Thai Hotline App',
      home: SplashScreenUI(), // กำหนดให้หน้าแรกสุดวิ่งไปเปิด Splash Screen
    );
  }
}