import 'package:flutter/material.dart';
import 'package:hadith_app/pages/section.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class BookPage extends StatelessWidget {
  final String book;
  final String bookTitle;
  const BookPage({super.key, required this.book, this.bookTitle=' '});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(bookTitle),
      ),
      
      backgroundColor: Theme.of(context).colorScheme.background,
      body:FutureBuilder(
          future: http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/eng-$book.min.json')),
          builder:(context,snapshot){
            if (snapshot.hasData){
              var response = json.decode(snapshot.data!.body);
              return Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: (response['metadata']['sections'].length-1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Section(book:book, sectionNumber: index+1,)));
                        },
                      shape: Border(
                        bottom: BorderSide(color: Theme.of(context).colorScheme.secondary,width: 0.1),
                        //borderRadius: BorderRadius.circular(10)
                        ),
                      contentPadding: const EdgeInsets.all(2),
                      leading: Text('${index+1}.'),
                      titleTextStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 14,height: 1.2),
                      title: Text(response['metadata']['sections'][(index+1).toString()].toString()),//${response['metadata']['section']['1'].toString()} : ${response['hadiths'][index]['hadithnumber'].toString()}
                      trailing: Text('${response['metadata']['section_details'][(index+1).toString()]['hadithnumber_first'].toString()} - ${response['metadata']['section_details'][(index+1).toString()]['hadithnumber_last'].toString()}' ),
                    );
                  },
                ),
            );
            }
            else if (snapshot.hasError){
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
      );
  }
  
}