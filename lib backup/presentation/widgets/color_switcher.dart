import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/domain/theme/theme_provider.dart';

class ColorSwitcher extends StatelessWidget {
  const ColorSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (c, themeProvider, _) => SizedBox(
        height: 200,
        child: GridView.count(
          crossAxisCount: AppColors.primaryColor.length,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          children: List.generate(
            AppColors.primaryColor.length,
            (i) {
              bool isSelectedColor = AppColors.primaryColor[i] ==
                  themeProvider.selectedPrimaryColor;

              return GestureDetector(
                onTap: isSelectedColor
                    ? null
                    : themeProvider.setSelectedPrimaryColor(
                        AppColors.primaryColor[i],
                      ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor[i],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isSelectedColor ? 1 : 0,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
