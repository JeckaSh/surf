import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/domain/theme/theme_provider.dart';
import 'package:surf_flutter_courses_template/presentation/pages/homepage.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/theme_switcher.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(
      const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (c, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.selectedThemeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: themeProvider.selectedPrimaryColor,
              primarySwatch: AppColors.getMaterialColorFromColor(
                  themeProvider.selectedPrimaryColor),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: themeProvider.selectedPrimaryColor,
              primarySwatch: AppColors.getMaterialColorFromColor(
                  themeProvider.selectedPrimaryColor),
            ),
            home: const Scaffold(
              body: Homepage(),
            ),
          );
        },
      ),
    );
  }
}
