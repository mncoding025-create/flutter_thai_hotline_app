import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('สายด่วน THAILAND', style: GoogleFonts.kanit(color: Colors.black87, fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ผู้จัดทำ', style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            Image.asset(
              'assets/icon/uni-logo.png', 
              height: 100,
              errorBuilder: (context, error, stackTrace) => Container(height: 100, width: 100, color: Colors.grey[200], child: const Icon(Icons.school, color: Colors.grey, size: 50)),
            ),
            const SizedBox(height: 10),
            Text('มหาวิทยาลัยเอเชียอาคเนย์ ', style: GoogleFonts.kanit(fontSize: 16)),
            const SizedBox(height: 30),

            ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(width: 120, height: 120, color: Colors.grey[300], child: const Icon(Icons.person, size: 60, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),

            Text('รหัสนักศึกษา: 6752410026', style: GoogleFonts.kanit(fontSize: 16)),
            Text('ชื่อ-สกุลนักศึกษา: นายชาคริต บุญช่วย', style: GoogleFonts.kanit(fontSize: 16)),
            Text('อีเมลนักศึกษา: s6752410026@gmail.com', style: GoogleFonts.kanit(fontSize: 16)),
            Text('สาขาวิชา: สาขาวิชาเทคโนโลยีดิจิทัลและนวัตกรรม', style: GoogleFonts.kanit(fontSize: 16)),
            Text('คณะ: คณะศิลปศาสตร์และวิทยาศาสตร์', style: GoogleFonts.kanit(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}