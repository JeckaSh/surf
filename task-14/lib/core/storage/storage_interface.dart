/// Абстрактный класс интерфейса для работы с хранилищем Ключ-Значение
abstract class StorageInterface {
  /// Получить значение из хранилища по ключу [key]
  T? getByKey<T>(String key);

  /// Сохранить значение [value] в хранилище по ключу [key]
  void set<T>(String key, T value);
}
