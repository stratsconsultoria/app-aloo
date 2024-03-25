import 'package:flutter/material.dart';

import 'colors.dart';

ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: AppColors.secondColor,
  primaryContainer: AppColors.accentColor,
  onPrimaryContainer: AppColors.accentColor,
  secondary: AppColors.primaryColor,
  onSecondary: AppColors.backgroundColor,
  secondaryContainer: AppColors.primaryColor,
  onSecondaryContainer: AppColors.primaryColor,
  error: AppColors.errorColor,
  errorContainer: AppColors.errorColor,
  onError: AppColors.errorColor,
  onErrorContainer: AppColors.errorColor,
  background: AppColors.backgroundColor,
  onBackground: AppColors.primaryColor,
  surface: AppColors.backgroundColor,
  onSurface: AppColors.primaryColor,
  surfaceVariant: AppColors.backgroundColor,
  onSurfaceVariant: AppColors.primaryColor,
  outline: AppColors.backgroundColor,
  onInverseSurface: AppColors.backgroundColor,
  inverseSurface: AppColors.backgroundColor,
  inversePrimary: AppColors.primaryColor,
  shadow: AppColors.primaryColor,
  surfaceTint: AppColors.primaryColor,
);
