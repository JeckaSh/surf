import 'package:intl/intl.dart';

/// Класс вспомогательных методов для работы со строками
class StringUtils {
  /// Формат эл. почты для валидации
  static final emailFormat =
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}");

  /// Конвертировать дату из объекта [DateTime] в строку в формате "dd.MM.yyyy"
  static String dateFormat(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  /// Конвертировать дату из строки в формате "dd.MM.yyyy" в объект [DateTime]
  static DateTime dateReformat(String date) {
    final numbers = date.split('.').map((e) => int.parse(e)).toList();
    return DateTime(numbers[2], numbers[1], numbers[0]);
  }
}
