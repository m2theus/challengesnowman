import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitlesLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      spacing: -20,
      children: <Widget>[
        Text(
          'SNOW',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          'MAN',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontSize: 52,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          'LABS',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontSize: 43,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 40,
        ),
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
