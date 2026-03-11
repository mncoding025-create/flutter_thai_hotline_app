import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
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
            Text('สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน', textAlign: TextAlign.center, style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/Ambulance-vecto.jpg',
              height: 120,
              errorBuilder: (context, error, stackTrace) => Container(height: 120, width: 200, color: Colors.grey[200], child: const Icon(Icons.image)),
            ),
            const SizedBox(height: 20),
            
            _buildPhoneCard('เหตุด่วนเหตุร้าย', '191', '191.png'),
            _buildPhoneCard('ศูนย์ปลอดภัยคมนาคม', '1356', '1356.png'),
            _buildPhoneCard('หน่วยแพทย์กู้ชีพ', '1554', '1554.jpg'),
            _buildPhoneCard('ศูนย์เอราวัณ', '1646', '1646.png'),
            _buildPhoneCard('เจ็บป่วยฉุกเฉิน', '1669', '1669.jpg'),
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