import 'package:flutter/material.dart';

class AppColors {
  static List<Color> primaryColor = const [
    Color.fromRGBO(109, 217, 2, 1),
    Color.fromRGBO(82, 97, 235, 1),
    Color.fromRGBO(255, 122, 0, 1),
  ];

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }

  // MaterialColor getMaterialColor(Color color) {
  //   final int red = color.red;
  //   final int green = color.green;
  //   final int blue = color.blue;

  //   final Map<int, Color> shades = {
  //     50: Color.fromRGBO(red, green, blue, .1),
  //     100: Color.fromRGBO(red, green, blue, .2),
  //     200: Color.fromRGBO(red, green, blue, .3),
  //     300: Color.fromRGBO(red, green, blue, .4),
  //     400: Color.fromRGBO(red, green, blue, .5),
  //     500: Color.fromRGBO(red, green, blue, .6),
  //     600: Color.fromRGBO(red, green, blue, .7),
  //     700: Color.fromRGBO(red, green, blue, .8),
  //     800: Color.fromRGBO(red, green, blue, .9),
  //     900: Color.fromRGBO(red, green, blue, 1),
  //   };

  //   return MaterialColor(color.value, shades);
  // }
}
