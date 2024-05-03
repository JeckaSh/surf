import 'package:surf_flutter_courses_template/style/app_strings.dart';

/// enum для удобного отображения
enum RgbType {
  red(AppString.red),
  green(AppString.green),
  blue(AppString.blue);

  final String name;

  const RgbType(this.name);
}
