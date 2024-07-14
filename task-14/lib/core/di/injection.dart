import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/storage/shared_preferences_storage.dart';
import 'package:surf_flutter_courses_template/core/storage/storage_interface.dart';

final injector = GetIt.instance;

Future configInjection() async {
  // внедряем основной стейт приложения
  injector.registerSingleton<AppStateModel>(AppStateModel());

  // внедряем экземпляр локального хранилища
  injector.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

  // внедряем реализацию нашего локального хранилища
  injector.registerSingletonWithDependencies<StorageInterface>(
    () => SharedPreferencesStorage(
      injector.get<SharedPreferences>(),
    ),
    dependsOn: [SharedPreferences],
  );
  await injector.allReady();
}
