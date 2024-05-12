import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith_app/pages/book.dart';

void main() {
  runApp(const BookSelection());
}

class BookSelection extends StatelessWidget {
  const BookSelection({super.key});

  static const Map<String,String> books = {'abudawud':'Sunan Abu Dawud','bukhari': 'Sahih al-Bukhari','dehlawi': 'Forty Hadith of Shah Waliullah Dehlawi','ibnmajah': 'Sunan Ibn-Majah','malik':'Muwatta Malik','muslim':'Sahih Muslim','nasai':'Sunan an Nasa\'i','nawawi': 'Forty Hadith of an-Nawawi','qudsi':'Forty Hadith Qudsi','tirmidhi':'Jami\' At Tirmidhi'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editions'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body:ListView.builder( 
          //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 10,
          itemBuilder: (context, index){
            if (index == 0) {
              return Center(
              heightFactor: 3,
              child:Text('Select a Book',
                style: TextStyle(
                  fontFamily: GoogleFonts.bebasNeue().fontFamily,
                  fontSize: 35,
                  )
                  )
                );
            }
            else{
            return GestureDetector(
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookPage(book: books.keys.elementAt(index-1),bookTitle: books.values.elementAt(index-1))));
                },
            child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.2)),
                ),
                child: Center(
                  child: Text(books.values.elementAt(index-1),
                    style: const TextStyle(
                      fontSize: 17,
                      shadows: [Shadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                                ),
                ),
            ),
          );}
          },
          ),
    );
  }
}