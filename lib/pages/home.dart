import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage('assets/images/Book.png')),
            Text(
              'Hadith App',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            Text(
              'Version 1.0',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}