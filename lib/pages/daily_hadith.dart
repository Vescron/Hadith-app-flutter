import 'package:flutter/material.dart';
import 'package:hadith_app/utils/hadith_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class DailyHadith extends StatelessWidget {
  final int index;
  final String book = 'bukhari';

  const DailyHadith({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadith'),
      ),
      body: ListView(
        children: [
          FutureBuilder(future: http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-$book/$index.min.json'))
          , builder: (context, snapshot) {
            if (snapshot.hasData) {
              var response = json.decode(snapshot.data!.body);
              return HadithTile(descSize: 18,opacity:0.3,font: GoogleFonts.notoNaskhArabic().fontFamily,title: '${response['metadata']['name'].toString()} : ${response['hadiths'][0]['hadithnumber'].toString()}',
              description: response['hadiths'][0]['text'].toString());
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
          FutureBuilder(future: http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/eng-$book/$index.min.json'))
          , builder: (context, snapshot) {
            if (snapshot.hasData) {
              var response = json.decode(snapshot.data!.body);
              return HadithTile(hasBorder: true, opacity: 0, font: GoogleFonts.montserrat().fontFamily,title: 'Translation: ',
              description: response['hadiths'][0]['text'].toString());
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
          ),]
      )
    );
  }
}