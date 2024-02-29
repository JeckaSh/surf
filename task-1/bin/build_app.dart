import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_dart_courses_template;

/// Скрипт для сборки приложения.
/// Обязательно принимает параметры в указанном порядке:
/// <os> - Платформа, для которой будет выполнена сборка приложения. Может принимать значения `ios` или `android`
/// <buildType> - Тип сборки приложения. Может принимать значения `qa` или `release`
void main(List<String> arguments) {
  if (arguments.length < 3) {
    print('Количество обязательных параметров 3, найдено ${arguments.length}');
    return;
  }

  final os = arguments[0];
  final company = arguments[1];
  final buildType = arguments[2];

  if (os != 'ios' && os != 'android') {
    print(
        'Не удалось выполнить операцию - не удалось распознать ОС $os. Параметр может принимать только значения `android` или `ios`');
    return;
  }

  if (company != 'google' && company != 'apple') {
    print(
        'Не удалось выполнить операцию - не удалось распознать компанию $company. Параметр может принимать только значения `google` или `apple`');
    return;
  }

  if (buildType != 'qa' && buildType != 'release') {
    print(
        'Не удалось выполнить операцию - не удалось распознать тип сборки $buildType. Параметр может принимать только значения `qa` или `release`');
    return;
  }

  /// Если все ок, собираем сборку тут
  /// (на самом деле, не собираем. Собирать сборку мы научимся позднее 🥴)
  print(
      'Сборка собрана! Первый аргумент: $os - операционная система, второй: $company - компания разработчик, третий: $buildType - тип сборки (тестовый/релиз)');
}
