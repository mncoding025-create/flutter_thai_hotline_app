import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_d_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const SubAHomeUI(),
    const SubBHomeUI(),
    const SubCHomeUI(),
    const SubDHomeUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text('สายด่วน THAILAND', style: GoogleFonts.kanit(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUI()));
            },
            icon: const Icon(Icons.info_outline, color: Colors.black87),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'การเดินทาง'),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'ฉุกเฉิน'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
          BottomNavigationBarItem(icon: Icon(Icons.tungsten), label: 'สาธารณูปโภค'),
        ],
      ),
    );
  }
}