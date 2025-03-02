import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF112331),
    textTheme: darkTextTheme,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inknutAntiqua(
      fontSize: 48,
      color: Color(0xFFF4511E),
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.inknutAntiqua(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.inknutAntiqua(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.inknutAntiqua(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inknutAntiqua(
      fontSize: 48,
      color: Color(0xFFF4511E),
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.inknutAntiqua(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.inknutAntiqua(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.inknutAntiqua(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
}
