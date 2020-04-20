import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitlesLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(

      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      spacing: -16,
      children: <Widget>[
        Text(
          'SNOW',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          'MAN',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 52,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          'LABS',
          style: GoogleFonts.rubik(
            textStyle: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 43,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(height: 40,),
        Text(
          'Challenge',
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: 23,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }
}
