import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/data/theme/theme_repository.dart';
import 'package:surf_flutter_courses_template/data/theme/themes_data.dart';
import 'package:surf_flutter_courses_template/di/theme_builder.dart';
import 'package:surf_flutter_courses_template/di/theme_inherited.dart';
import 'package:surf_flutter_courses_template/domain/theme_controller.dart';
import 'package:surf_flutter_courses_template/presentation/pages/homepage.dart';
import 'package:surf_flutter_courses_template/storage/theme/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(
    prefs: prefs,
  );
  final themeRepository = ThemeRepository(
    themeStorage: themeStorage,
  );
  final themeController = ThemeController(
    themeRepository: themeRepository,
  );

  runApp(
    App(
      themeController: themeController,
    ),
  );
}

class App extends StatelessWidget {
  final ThemeController themeController;

  const App({
    super.key,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: themeController,
      child: ThemeBuilder(builder: (_, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          home: const Homepage(),
        );
      }),
    );
  }
}
