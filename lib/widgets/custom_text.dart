import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/color_constants.dart';

Widget customText(
  String text, {
  double fontSize = 14,
  Color color = AppColors.black,
  FontWeight fontWeight = FontWeight.normal,
  double letterSpacing = 0,
  double tetextScalerValue = 1,
  TextDecoration textDecoration = TextDecoration.none,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    text,
    textAlign: textAlign,
    textScaler: TextScaler.linear(tetextScalerValue),
    style: GoogleFonts.inter(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: textDecoration,
    ),
  );
}
