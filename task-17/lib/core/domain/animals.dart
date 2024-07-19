import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_svg_images.dart';

/// Виды животных
enum Animals {
  dog(
    AppStrings.dog,
    AppSvgImages.dog,
    true,
  ),
  cat(
    AppStrings.cat,
    AppSvgImages.cat,
    true,
  ),
  parrot(
    AppStrings.parrot,
    AppSvgImages.parrot,
    false,
  ),
  hamster(
    AppStrings.hamster,
    AppSvgImages.hamster,
    false,
  );

  final String title;

  final String imagePath;

  final bool canHaveVaccination;

  const Animals(
    this.title,
    this.imagePath,
    this.canHaveVaccination,
  );
}
