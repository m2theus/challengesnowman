import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    @required this.onTap,
    @required this.label,
    @required this.width,
    this.heigth,
    this.margin,
    this.color,
    this.colorLabel
  });

  final VoidCallback onTap;
  final double width;
  final String label;
  final double heigth;
  final EdgeInsetsGeometry margin;
  final Color color;
  final Color colorLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:  this.width,
        height: heigth,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              label,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color:colorLabel,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
