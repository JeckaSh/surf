import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

extension ThemeExtension on ThemeData {
  ///
  /// Светлые темы
  ///
  ThemeData get lightGreenTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.light,
                background: AppColors.appGreenLightBackground,
                surface: AppColors.appSecondaryLight,
                surfaceVariant:
                    AppColors.appSecondaryDarkGreen.withOpacity(0.6),
                surfaceTint:
                    AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
                onSurface: AppColors.appGreenLightOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryGreen,
                secondary: AppColors.appDarkGrey,
                tertiary: AppColors.appSecondaryDarkGreen),
        useMaterial3: true,
      );

  ThemeData get lightBlueTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.light,
                background: AppColors.appBlueLightBackground,
                surface: AppColors.appSecondaryLight,
                surfaceVariant: AppColors.appSecondaryDarkBlue.withOpacity(0.6),
                surfaceTint:
                    AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
                onSurface: AppColors.appBlueLightOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryBlue,
                secondary: AppColors.appDarkGrey,
                tertiary: AppColors.appSecondaryDarkBlue),
        useMaterial3: true,
      );

  ThemeData get lightOrangeTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.light,
                background: AppColors.appOrangeLightBackground,
                surface: AppColors.appSecondaryLight,
                surfaceVariant:
                    AppColors.appSecondaryDarkOrange.withOpacity(0.6),
                surfaceTint:
                    AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
                onSurface: AppColors.appOrangeLightOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryOrange,
                secondary: AppColors.appDarkGrey,
                tertiary: AppColors.appSecondaryDarkOrange),
        useMaterial3: true,
      );

  ///
  /// Тёмные темы
  ///
  ThemeData get darkGreenTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.dark,
                background: AppColors.appGreenDarkBackground,
                surface: AppColors.appSecondaryDarkGreen,
                surfaceVariant:
                    AppColors.appGreenDarkBackground.withOpacity(0.8),
                surfaceTint:
                    AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
                onSurface: AppColors.appGreenDarkOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryGreen,
                secondary: AppColors.appLightGrey,
                tertiary: AppColors.appWhite),
        useMaterial3: true,
      );

  ThemeData get darkBlueTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.dark,
                background: AppColors.appBlueDarkBackground,
                surface: AppColors.appSecondaryDarkBlue,
                surfaceVariant:
                    AppColors.appBlueDarkBackground.withOpacity(0.8),
                surfaceTint:
                    AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
                onSurface: AppColors.appBlueDarkOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryBlue,
                secondary: AppColors.appLightGrey,
                tertiary: AppColors.appWhite),
        useMaterial3: true,
      );

  ThemeData get darkOrangeTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)
            .copyWith(
                brightness: Brightness.dark,
                background: AppColors.appOrangeDarkBackground,
                surface: AppColors.appSecondaryDarkOrange,
                surfaceVariant:
                    AppColors.appOrangeDarkBackground.withOpacity(0.8),
                surfaceTint:
                    AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
                onSurface: AppColors.appOrangeDarkOnSurface,
                error: AppColors.appError,
                primary: AppColors.appPrimaryOrange,
                secondary: AppColors.appLightGrey,
                tertiary: AppColors.appWhite),
        useMaterial3: true,
      );
}
