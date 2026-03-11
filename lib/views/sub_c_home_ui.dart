import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final String cleanPhone = phoneNumber.replaceAll('-', '');
    final Uri launchUri = Uri(scheme: 'tel', path: cleanPhone);
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
            Text('สายด่วน\nธนาคาร', textAlign: TextAlign.center, style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/mb-bk.jpg',
              height: 120,
              errorBuilder: (context, error, stackTrace) => Container(height: 120, width: 200, color: Colors.grey[200], child: const Icon(Icons.image)),
            ),
            const SizedBox(height: 20),
            
            _buildPhoneCard('ธนาคารกรุงไทย', '0-2111-1111', 'KT.png'),
            _buildPhoneCard('ธนาคารกรุงเทพ', '1333', 'BB.jpg'),
            _buildPhoneCard('ธนาคารกรุงศรีอยุธยา', '1572', 'ks.png'),
            _buildPhoneCard('ธนาคารกสิกรไทย', '0-2888-8888', 'kb.jpg'),
            _buildPhoneCard('ธนาคารไทยพาณิชย์', '0-2777-7777', 'scb.jpg'),
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