import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        const SizedBox(width: 8),
        Text(
          "Popo Delivery Dashboard",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFB6B8B5),
          ),
        ),
        const SizedBox(width: 8),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: const Color(0xFF54A312).withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
