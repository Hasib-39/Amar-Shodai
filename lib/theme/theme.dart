import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    // section titles
    titleLarge: GoogleFonts.robotoMono(
      color: Colors.red.shade600,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
  //   category circle avatar
    labelMedium: GoogleFonts.robotoMono(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    // card title, footer titles
    titleSmall: GoogleFonts.robotoMono(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.robotoMono(
      color: Colors.black,
      fontSize: 14
    )
  )
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xff1e2939),
  scaffoldBackgroundColor: Color(0xff0a0a0a),
  textTheme: TextTheme(
    // section titles
      titleLarge: GoogleFonts.robotoMono(
        color: Colors.red.shade600,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      //   category circle avatar
      labelMedium: GoogleFonts.robotoMono(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      // card title, footer titles
      titleSmall: GoogleFonts.robotoMono(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      // footer body
      bodySmall: GoogleFonts.robotoMono(
          color: Colors.white,
          fontSize: 14
      )
  ),
);