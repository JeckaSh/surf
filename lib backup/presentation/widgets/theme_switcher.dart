import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/data/app_themes.dart';
import 'package:surf_flutter_courses_template/domain/theme/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) => SizedBox(
        height: 200,
        child: GridView.count(
          crossAxisCount: appThemes.length,
          crossAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            appThemes.length,
            (i) {
              bool isSelectedTheme =
                  appThemes[i].mode == themeProvider.selectedThemeMode;
              return GestureDetector(
                onTap: isSelectedTheme
                    ? null
                    : () => themeProvider.setSelectedThemeMode(
                          appThemes[i].mode,
                        ),
                child: AnimatedContainer(
                  height: 100,
                  duration: const Duration(microseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelectedTheme
                        ? theme.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: theme.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.cardColor.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(appThemes[i].title),
                        ],
                      ),
                    ),
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
