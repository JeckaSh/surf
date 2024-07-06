import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/core/di/injection.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/ui/pages/profile/profile_page.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/system_theme.dart';
import 'package:surf_flutter_courses_template/init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Ожидания DI приложения
  await configInjection();

  /// Загрузка данных о теме
  await InitApp.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => injector.get<AppStateModel>(),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final appState = injector.get<AppStateModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// Подписываемся на изменение системной темы устройства
  /// и меняем тему приложения только если выбрана системная тема
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    if (appState.currentTheme.id == 0) {
      appState.currentTheme = SystemTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (_, state, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state.currentTheme.getThemeDataFromTheme(context),
        home: const ProfilePage(),
      );
    });
  }
}
