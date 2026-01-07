import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  // ---------------- Poppins ----------------

  static TextStyle poppins32Bold = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.0,
  );

  static TextStyle poppins32BoldAlt = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.0,
  );

  static TextStyle poppins17Regular = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins17SemiBold = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins17Bold = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.5,
  );

  static TextStyle poppins15Regular = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins15SemiBold = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins15Bold = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Regular = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Medium = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.7,
  );

  static TextStyle poppins12Bold = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.7,
  );

  // ---------------- Roboto ----------------
  static TextStyle roboto24SemiBold = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -2,
    height: 1.0,
  );

  static TextStyle roboto17Bold = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.3,
  );

  static TextStyle roboto15SemiBold = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static TextStyle roboto12SemiBold = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  AppTextStyles._();
}
