import 'package:intl/intl.dart';

extension DateTimeToString on DateTime {
  /// перевод строки в вид "2024.04.14 в 22:52"
  String toStringDateAndTime() {
    return DateFormat('y.MM.dd в HH:mm', 'ru').format(this);
  }
}
