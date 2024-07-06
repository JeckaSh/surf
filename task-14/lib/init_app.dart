import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/di/injection.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/storage/storage_interface.dart';
import 'package:surf_flutter_courses_template/core/ui/themes/system_theme.dart';

/// Предварительная настройка приложения перед запуском
class InitApp {
  static Future<void> init() async {
    final saveTheme = injector.get<StorageInterface>().getByKey<String>(
          AppStrings.prefsThemeKey,
        );

    final state = injector.get<AppStateModel>();

    if (saveTheme == null || saveTheme.isEmpty) {
      state.currentTheme = SystemTheme();
    } else {
      state.currentTheme = AppThemeModel.fromString(saveTheme);
    }
  }
}
