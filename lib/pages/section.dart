import 'package:flutter/material.dart';
import 'package:hadith_app/pages/hadith_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Section extends StatelessWidget {
  final int sectionNumber;
  final String book;
  const Section({super.key,required this.book,required this.sectionNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section $sectionNumber'),
      ),
    
      backgroundColor: Theme.of(context).colorScheme.background,
      body:FutureBuilder(
          future: http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/eng-$book/sections/$sectionNumber.min.json')),
          builder:(context,snapshot){
            if (snapshot.hasData){
              var response = json.decode(snapshot.data!.body);
              return Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HadithPage(sectionNumber: sectionNumber,book: book, hadith: response['hadiths'][index]['text'].toString(),index: index)));
                        },
                      contentPadding: const EdgeInsets.all(10),
                      leading: const Icon(Icons.bookmark_border_rounded),
                      title: Text('${response['metadata']['section'][sectionNumber.toString()].toString()} : ${response['hadiths'][index]['hadithnumber'].toString()}' ),
                      subtitle: Text(maxLines: 5,overflow: TextOverflow.fade,response['hadiths'][index]['text'].toString() ),
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