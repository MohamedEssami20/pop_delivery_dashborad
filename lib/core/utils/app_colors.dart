import 'package:flutter/material.dart';

abstract class AppColors {
  // ---------------- Light Theme ----------------
  // Primary
  static const Color primary100Light = Color(0xFFECF1E8);
  static const Color primary200Light = Color(0xFFDDEFCE);
  static const Color primary300Light = Color(0xFFB7EC8C);
  static const Color primary400Light = Color(0xFF8BDE47);
  static const Color primary500Light = Color(0xFF67BD1F);
  static const Color primary600Light = Color(0xFF54A312);
  static const Color primary700Light = Color(0xFF408308);

  // Typography
  static const Color typography100Light = Color(0xFFB6B8B5);
  static const Color typography200Light = Color(0xFF91958E);
  static const Color typography300Light = Color(0xFF70756B);
  static const Color typography400Light = Color(0xFF60655C);
  static const Color typography500Light = Color(0xFF363A33);

  // Grey
  static const Color grey0Light = Color(0xFFFFFFFF);
  static const Color grey50Light = Color(0xFFF9FAF8);
  static const Color grey100Light = Color(0xFFF4F7F2);
  static const Color grey200Light = Color(0xFFE8EBE6);
  static const Color grey300Light = Color(0xFFA9ADA5);
  static const Color grey400Light = Color(0xFF91958E);
  static const Color grey500Light = Color(0xFF60635E);

  // Other colors
  static const Color redLight = Color(0xFFE25839);
  static const Color yellowLight = Color(0xFFF5AE42);
  static const Color blueLight = Color(0xFF24B5D4);
  static const Color greenLight = Color(0xFF45B733);
  static const Color orangeLight = Color(0xFFE8712E);

  // Transparent
  static  Color grey500_6Light = Color(0xFF60635E).withValues(alpha: 0.06);
  static  Color grey0_92Light = Color(0xFFFFFFFF).withValues(alpha: 0.92);
  static  Color primary600_24Light = Color(0xFF54A312).withValues(alpha: 0.24);
  static  Color backgroundBlurLight = Color(0xFF9FA19E).withValues(alpha: 0.8);

  // Gradient
  static const Color gradientLightStart = Color(0xFF5EAD1D);
  static const Color gradientLightEnd = Color(0xFF54A312);

  // Base
  static const Color whiteLight = Color(0xFFFFFFFF);
  static const Color blackLight = Color(0xFF232522);

  // ---------------- Dark Theme ----------------
  // Primary
  static const Color primary100Dark = Color(0xFF3B3F38);
  static const Color primary200Dark = Color(0xFF3E532D);
  static const Color primary300Dark = Color(0xFF436923);
  static const Color primary400Dark = Color(0xFF5D9E26);
  static const Color primary500Dark = Color(0xFF6CB231);
  static const Color primary600Dark = Color(0xFF70BA32);
  static const Color primary700Dark = Color(0xFF88CD4E);

  // Typography
  static const Color typography100Dark = Color(0xFF7F7F7E);
  static const Color typography200Dark = Color(0xFF888A87);
  static const Color typography300Dark = Color(0xFF9FA19E);
  static const Color typography400Dark = Color(0xFFC8C9C7);
  static const Color typography500Dark = Color(0xFFEEF0ED);

  // Grey
  static const Color grey0Dark = Color(0xFF262725);
  static const Color grey50Dark = Color(0xFF2D2E2C);
  static const Color grey100Dark = Color(0xFF313330);
  static const Color grey200Dark = Color(0xFF3D3D3D);
  static const Color grey300Dark = Color(0xFF7A7A79);
  static const Color grey400Dark = Color(0xFF989998);
  static const Color grey500Dark = Color(0xFFD5D6D3);

  // Other colors
  static const Color redDark = Color(0xFFFB6A57);
  static const Color yellowDark = Color(0xFFFBB650);
  static const Color blueDark = Color(0xFF6FBDCE);
  static const Color greenDark = Color(0xFF8CEC7D);
  static const Color orangeDark = Color(0xFFE48047);

  // Transparent
  static  Color grey500_6Dark = Color(0xFFD5D6D3).withValues(alpha: 0.06);
  static  Color grey0_92Dark = Color(0xFF262725).withValues(alpha: 0.92);
  static  Color primary600_24Dark = Color(0xFF70BA32).withValues(alpha: 0.24);
  static  Color backgroundBlurDark = Color(0xFF262725).withValues(alpha: 0.8);

  // Gradient
  static const Color gradientDarkStart = Color(0xFF6CB231);
  static const Color gradientDarkEnd = Color(0xFF6CB231);

  // Base
  static const Color whiteDark = Color(0xFFFFFFFF);
  static const Color blackDark = Color(0xFFF0EFED);
}
