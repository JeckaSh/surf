import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/domain/bottom_sheet/bottom_sheet_view.dart';
import 'package:surf_flutter_courses_template/core/domain/model/base_widget_model.dart';

class ProfileWidgetModel extends BaseWidgetModel {
  ProfileWidgetModel();

  @override
  void init() {}

  @override
  void dispose() {}

  void openThemeChangerBottomSheet(BuildContext context) {
    ThemeChangerBottomSheet(context: context).showBottomSheet();
    // ignore: avoid_print
    print('open bottom sheet');
  }
}
