import 'package:flutter/material.dart';
import 'package:hadith_app/utils/hadith_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class HadithPage extends StatelessWidget {
  final String hadith;
  final int index;
  final int sectionNumber;
  final String book;

  const HadithPage({super.key,required this.sectionNumber,required this.book,required this.hadith, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadith'),
      ),
      body: ListView(
        children: [
          FutureBuilder(future: http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-$book/sections/$sectionNumber.min.json'))
          , builder: (context, snapshot) {
            if (snapshot.hasData) {
              var response = json.decode(snapshot.data!.body);
              return HadithTile(descSize: 18,opacity:0.3,font: GoogleFonts.notoNaskhArabic().fontFamily,title: '${response['metadata']['name'].toString()} : ${response['hadiths'][index]['hadithnumber'].toString()}',
              description: response['hadiths'][index]['text'].toString());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          ),
          // ListTile(
          //   subtitle: Text(hadith),
          // ),
          HadithTile(hasBorder: true, opacity: 0, font: GoogleFonts.montserrat().fontFamily,title: 'Translation: ', description: hadith),]
      )
    );
  }
}