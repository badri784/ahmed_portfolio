import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppText {
  static TextStyle display(double size, {Color color = AppColors.ink}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: size,
        fontWeight: FontWeight.w800,
        height: 1.0,
        letterSpacing: -size * 0.03,
        color: color,
      );

  static TextStyle body(
    double size, {
    Color color = AppColors.ink,
    FontWeight weight = FontWeight.w400,
  }) =>
      GoogleFonts.dmSans(fontSize: size, height: 1.55, color: color, fontWeight: weight);
}
