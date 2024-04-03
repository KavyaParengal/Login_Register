import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;

  BulletList(this.strings);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: strings.map((str) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: RichText(
            text: TextSpan(
              text: '• ',
              style: TextStyle(color: Colors.black
                  , fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: str,style:
                GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900))),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}