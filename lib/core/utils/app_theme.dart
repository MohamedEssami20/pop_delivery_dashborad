
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_theme_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.whiteLight,
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          // Primary
          primary100: AppColors.primary100Light,
          primary200: AppColors.primary200Light,
          primary300: AppColors.primary300Light,
          primary400: AppColors.primary400Light,
          primary500: AppColors.primary500Light,
          primary600: AppColors.primary600Light,
          primary700: AppColors.primary700Light,
          // Typography
          typography100: AppColors.typography100Light,
          typography200: AppColors.typography200Light,
          typography300: AppColors.typography300Light,
          typography400: AppColors.typography400Light,
          typography500: AppColors.typography500Light,
          // Grey
          grey0: AppColors.grey0Light,
          grey50: AppColors.grey50Light,
          grey100: AppColors.grey100Light,
          grey200: AppColors.grey200Light,
          grey300: AppColors.grey300Light,
          grey400: AppColors.grey400Light,
          grey500: AppColors.grey500Light,
          // Other
          red: AppColors.redLight,
          yellow: AppColors.yellowLight,
          blue: AppColors.blueLight,
          green: AppColors.greenLight,
          orange: AppColors.orangeLight,
          // Transparent
          grey500_6: AppColors.grey500_6Light,
          grey0_92: AppColors.grey0_92Light,
          primary600_24: AppColors.primary600_24Light,
          backgroundBlur: AppColors.backgroundBlurLight,
          // Gradient
          gradientStart: AppColors.gradientLightStart,
          gradientEnd: AppColors.gradientLightEnd,
          // Base
          white: AppColors.whiteLight,
          black: AppColors.blackLight,
        ),
      ],
      textTheme: _textTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.blackDark,
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          // Primary
          primary100: AppColors.primary100Dark,
          primary200: AppColors.primary200Dark,
          primary300: AppColors.primary300Dark,
          primary400: AppColors.primary400Dark,
          primary500: AppColors.primary500Dark,
          primary600: AppColors.primary600Dark,
          primary700: AppColors.primary700Dark,
          // Typography
          typography100: AppColors.typography100Dark,
          typography200: AppColors.typography200Dark,
          typography300: AppColors.typography300Dark,
          typography400: AppColors.typography400Dark,
          typography500: AppColors.typography500Dark,
          // Grey
          grey0: AppColors.grey0Dark,
          grey50: AppColors.grey50Dark,
          grey100: AppColors.grey100Dark,
          grey200: AppColors.grey200Dark,
          grey300: AppColors.grey300Dark,
          grey400: AppColors.grey400Dark,
          grey500: AppColors.grey500Dark,
          // Other
          red: AppColors.redDark,
          yellow: AppColors.yellowDark,
          blue: AppColors.blueDark,
          green: AppColors.greenDark,
          orange: AppColors.orangeDark,
          // Transparent
          grey500_6: AppColors.grey500_6Dark,
          grey0_92: AppColors.grey0_92Dark,
          primary600_24: AppColors.primary600_24Dark,
          backgroundBlur: AppColors.backgroundBlurDark,
          // Gradient
          gradientStart: AppColors.gradientDarkStart,
          gradientEnd: AppColors.gradientDarkEnd,
          // Base
          white: AppColors.whiteDark,
          black: AppColors.blackDark,
        ),
      ],
      textTheme: _textTheme(),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: AppTextStyles.poppins32Bold,
      displayMedium: AppTextStyles.poppins32BoldAlt,
      displaySmall: AppTextStyles.roboto24SemiBold,
      headlineLarge: AppTextStyles.poppins17Bold,
      headlineMedium: AppTextStyles.poppins17SemiBold,
      headlineSmall: AppTextStyles.poppins15Bold,
      titleLarge: AppTextStyles.poppins17Regular,
      titleMedium: AppTextStyles.poppins15SemiBold,
      titleSmall: AppTextStyles.poppins15Regular,
      bodyLarge: AppTextStyles.roboto17Bold,
      bodyMedium: AppTextStyles.roboto15SemiBold,
      bodySmall: AppTextStyles.roboto12SemiBold,
      labelLarge: AppTextStyles.poppins12Bold,
      labelMedium: AppTextStyles.poppins12Medium,
      labelSmall: AppTextStyles.poppins12Regular,
    );
  }
}
