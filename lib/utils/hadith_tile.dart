import 'package:flutter/material.dart';

class HadithTile extends StatelessWidget {
  final String title;
  final String description;
  final String? font;
  final double opacity;
  final bool hasBorder;
  final double descSize;

  const HadithTile({super.key,required this.title, required this.description, required this.font, this.opacity=0.5, this.hasBorder=false,
            this.descSize=16.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(opacity),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 0.3,
          style: hasBorder ? BorderStyle.solid : BorderStyle.none,
        )
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              fontFamily: font,
              fontSize: descSize,
            ),
          ),
        ],
      ),
    );
  }
}

// ListTile(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 subtitleTextStyle: TextStyle(fontFamily: GoogleFonts.amiri().fontFamily,fontSize: 19,wordSpacing: 2,height: 2.5),
//                 title: Text('${response['metadata']['name'].toString()} ${response['metadata']['section']['1'].toString()} : ${response['hadiths'][index]['hadithnumber'].toString()}'),
//                 subtitle: Text(response['hadiths'][index]['text'].toString()),
//               )