import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('สายด่วน\nการเดินทาง', textAlign: TextAlign.center, style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/gps.png',
              height: 120,
              errorBuilder: (context, error, stackTrace) => Container(height: 120, width: 200, color: Colors.grey[200], child: const Icon(Icons.image)),
            ),
            const SizedBox(height: 20),
            
            _buildPhoneCard('ข้อมูลจราจร', '1197', 'traffic_police.jpg'),
            _buildPhoneCard('ตำรวจทางหลวง', '1193', 'highway.png'),
            _buildPhoneCard('ตำรวจท่องเที่ยว', '1155', 'tourist.png'),
            _buildPhoneCard('เส้นทางบนทางด่วน', '1543', 'easy_pass.jpg'),
            _buildPhoneCard('ขสมก.', '1348', 'BMTA.jpg'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneCard(String name, String phone, String imageFileName) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/icon/$imageFileName',
            width: 45, height: 45, fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(width: 45, height: 45, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
          ),
        ),
        title: Text(name, style: GoogleFonts.kanit(fontSize: 16)),
        subtitle: Text(phone, style: GoogleFonts.kanit(fontSize: 14, color: Colors.grey[600])),
        trailing: IconButton(icon: const Icon(Icons.phone, color: Colors.green), onPressed: () => _makePhoneCall(phone)),
      ),
    );
  }
}