import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFieldLabel extends StatelessWidget {
  const LoginFieldLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF60655C),
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
