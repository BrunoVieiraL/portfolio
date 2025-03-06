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
    scaffoldBackgroundColor: Color(0xFFFBFBFE),
    textTheme: lightTextTheme,
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 34,
      color: Color(0xFFF4511E),
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 34,
      color: Color(0xFFF4511E),
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 24,
      color: Color(0xFF050316),
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 20,
      color: Color(0xFF050316),
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 16,
      color: Color(0xFF050316),
      fontWeight: FontWeight.w400,
    ),
  );
}
