import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.overflow,
      this.fontWeight,
      this.color,
      this.height,
      this.textAlign,
      this.fontStyle,
      this.textDecoration,
      this.maxLines})
      : super(key: key);
  final String text;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.spaceGrotesk(
          textStyle: TextStyle(
              fontStyle: fontStyle,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: overflow,
              color: color,
              decoration: textDecoration),
        ));
  }
}
