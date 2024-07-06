import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/core/storage/storage_interface.dart';

/// Реализация работы интерфейса с локальным хранилищем
class SharedPreferencesStorage implements StorageInterface {
  /// Получение экземпляра SharedPreferences
  final SharedPreferences _prefs;

  SharedPreferencesStorage(
    SharedPreferences prefs,
  ) : _prefs = prefs;

  @override
  T? getByKey<T>(String key) {
    final result = _prefs.get(key);

    try {
      return (result as T?);
    } catch (_) {
      throw Exception(
        'Incorrect value format',
      );
    }
  }

  @override
  void set<T>(String key, T value) {
    _prefs.setString(key, value.toString());
  }
}
