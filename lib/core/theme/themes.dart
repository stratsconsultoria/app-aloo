import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'colors.dart';

TextStyle appBarTextStyle = const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

TextStyle defaultText = const TextStyle();

TextStyle bodySmall = const TextStyle(
  fontSize: 10,
);

TextStyle bodyMedium = const TextStyle(
  fontSize: 12,
);

TextStyle bodyLarge = const TextStyle(
  fontSize: 14,
);

TextStyle title = const TextStyle(
  fontSize: 20,
);

TextStyle titleSmall = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

TextStyle titleLarge = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardColor: AppColors.surfaceColor,
    dialogBackgroundColor: AppColors.surfaceColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceColor,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      titleMedium: title,
      titleLarge: titleLarge,
      titleSmall: titleSmall,
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      displayLarge: appBarTextStyle,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      labelStyle: TextStyle(
        color: AppColors.primaryColor,
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.surfaceColor,
      shadowColor: AppColors.backgroundColor,
      rangePickerBackgroundColor: AppColors.backgroundColor,
      rangeSelectionBackgroundColor: AppColors.accentColor,
    ),
    colorScheme: lightColorScheme,
  );
}
