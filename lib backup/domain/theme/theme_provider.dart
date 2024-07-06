import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.system;
  Color selectedPrimaryColor = AppColors.primaryColor[0];

  setSelectedThemeMode(ThemeMode themeMode) {
    selectedThemeMode = themeMode;
    notifyListeners();
  }

  setSelectedPrimaryColor(Color color) {
    selectedPrimaryColor = color;
    notifyListeners();
  }
}
