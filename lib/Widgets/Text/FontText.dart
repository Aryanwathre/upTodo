import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uptodo/app/theam/AppColors.dart';

Text FontText({
  required BuildContext context,
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign textAlign = TextAlign.center,
  Color? color,
  TextDecoration? decoration,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColor.DarktextColor,
      decoration: decoration,
    ),
    textAlign: textAlign,
  );
}
