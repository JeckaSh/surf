import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/theme/app_themes.dart';
import 'package:surf_flutter_courses_template/assets/theme/color_schemes.dart';
import 'package:surf_flutter_courses_template/di/theme_inherited.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = ThemeInherited.of(context);

    // void setDarkTheme() {
    //   theme.setThemeMode(ThemeMode.dark);
    // }

    // void setLightTheme() {
    //   theme.setThemeMode(ThemeMode.light);
    // }

    // void setSystemTheme() {
    //   theme.setThemeMode(ThemeMode.system);
    // }

    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...appThemes.map(
              (e) {
                // bool isSelectedTheme =
                //     e.mode == ThemeInherited.of(context).setThemeMode(e.mode);
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ThemeInherited.of(context).setThemeMode(e.mode);
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(e.title),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    e.mode == ThemeMode.light
                        ? const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ColoredBox(
                                    color: Colors.black,
                                    child: SizedBox.square(
                                      dimension: 100,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    e.mode == ThemeMode.dark
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...appColorSchemes.map(
                                    (e) {
                                      return Row(
                                        children: [
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     ThemeInherited.of(context)
                                          //         .setColorScheme(
                                          //             e.colorScheme); // e.colorScheme error
                                          //   },
                                          //   child: ),
                                          ColoredBox(
                                            color: e.titleColor,
                                            child: SizedBox.square(
                                              dimension: 100,
                                              child:
                                                  Center(child: Text(e.title)),
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  // ColoredBox(
                                  //   color: Colors.black,
                                  //   child: SizedBox.square(
                                  //     dimension: 50,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                );
              },
            ),
            // GestureDetector(
            //   onTap: setSystemTheme,
            //   child: Container(
            //     height: 50,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.black.withOpacity(0.5),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Center(
            //       child: Text('System'),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // GestureDetector(
            //   onTap: setDarkTheme,
            //   child: Container(
            //     height: 50,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.black.withOpacity(0.5),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Center(
            //       child: Text('Dark'),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // GestureDetector(
            //   onTap: setLightTheme,
            //   child: Container(
            //     height: 50,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.black.withOpacity(0.5),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Center(
            //       child: Text('Light'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
