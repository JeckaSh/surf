import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/colors.dart';

abstract class MyAppTestStyles {
  static const titleBigFold = TextStyle(
    color: MyAppColors.textColor,
    fontFamily: 'Sora',
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const dateTimeStyle = TextStyle(
    color: MyAppColors.dateTimeTextColor,
    fontFamily: 'Sora',
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const defaultTextStyle = TextStyle(
      color: MyAppColors.textColor,
      fontFamily: 'Sora',
      fontSize: 12,
      fontWeight: FontWeight.w400);

  static const categoryTitle = TextStyle(
    color: MyAppColors.textColor,
    fontFamily: 'Sora',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const priceStyle = TextStyle(
      color: MyAppColors.textColor,
      fontFamily: 'Sora',
      fontSize: 12,
      fontWeight: FontWeight.w700);

  static const redPriceStyle = TextStyle(
      color: MyAppColors.discountPriceColor,
      fontFamily: 'Sora',
      fontSize: 12,
      fontWeight: FontWeight.w700);

  static const discountPriceStyle = TextStyle(
      decoration: TextDecoration.lineThrough,
      color: MyAppColors.fullDiscountPriceColor,
      fontFamily: 'Sora',
      fontSize: 12,
      fontWeight: FontWeight.w700);

  static const sortDoneButtonStyle = TextStyle(
    fontFamily: 'Sora',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const sortCategoryName = TextStyle(
    color: MyAppColors.textColor,
    fontFamily: 'Sora',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const sortTitle = TextStyle(
    color: MyAppColors.textColor,
    fontFamily: 'Sora',
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
