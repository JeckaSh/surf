import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/bottom_sheet/bottom_sheet_model_view.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_theme_model.dart';
import 'package:surf_flutter_courses_template/core/domain/theme_radio_button/custom_theme_radio_button.dart';
import 'package:surf_flutter_courses_template/core/extension/text_style_extension.dart';

class ThemeChangerBottomSheet {
  final BuildContext context;

  ThemeChangerBottomSheet({required this.context});

  void showBottomSheet() {
    final theme = Theme.of(context);
    final appState = Provider.of<AppStateModel>(
      context,
      listen: false,
    );
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: theme.colorScheme.surfaceVariant,
      context: context,
      builder: (c) => Provider<ThemeChangerBottomSheetModel>(
        create: (_) => ThemeChangerBottomSheetModel(state: appState)..init(),
        dispose: (_, widgetModel) => widgetModel.dispose(),
        child: Material(
          elevation: 20,
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24.0),
          ),
          child: const Column(
            children: [
              _BottomSheetAppBarWidget(),
              _ThemeList(),
              _ApplyButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

/// ios style верхушка шторки, название модального окна и кнопка закрытия
class _BottomSheetAppBarWidget extends StatelessWidget {
  const _BottomSheetAppBarWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.customTitle.copyWith(
      color: theme.colorScheme.tertiary,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 4,
              width: 24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceTint,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.bottomSheetTitle,
                style: textStyle,
              ),
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Виджет списка типов тем приложения
class _ThemeList extends StatefulWidget {
  const _ThemeList();

  @override
  State<_ThemeList> createState() => __ThemeListState();
}

class __ThemeListState extends State<_ThemeList> {
  late ThemeChangerBottomSheetModel bottomSheetModel;

  @override
  void initState() {
    super.initState();
    bottomSheetModel =
        Provider.of<ThemeChangerBottomSheetModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    void onSchemeTap(AppThemeModel scheme) {
      setState(() {
        bottomSheetModel.onSchemeTap(scheme);
      });
    }

    void onThemeTypeTap(int index) {
      setState(() {
        bottomSheetModel.onThemeTypeTap(index);
      });
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: bottomSheetModel.themeTypes.length,
      itemBuilder: (BuildContext context, int index) =>
          CustomThemeRadioButtonWidget(
        title: bottomSheetModel.themeTypes[index].title,
        isSelected: bottomSheetModel.themeTypes[index].isSelected,
        schemes: bottomSheetModel.themeTypes[index].schemes,
        onSchemeTap: onSchemeTap,
        onThemeTypeTap: () => onThemeTypeTap(index),
      ),
    );
  }
}

/// Виджет кнопки 'Принять' для сохранения выбранной темы
class _ApplyButtonWidget extends StatelessWidget {
  const _ApplyButtonWidget();

  @override
  Widget build(BuildContext context) {
    final bottomSheetModel = Provider.of<ThemeChangerBottomSheetModel>(
      context,
      listen: false,
    );

    final theme = Theme.of(context);

    final elevatedButtonStyle = theme.elevatedButtonTheme.style?.copyWith(
      backgroundColor: MaterialStateProperty.all(theme.colorScheme.primary),
      side: MaterialStateProperty.all(
        BorderSide(width: 1, color: theme.colorScheme.primary),
      ),
    );

    void onTap() {
      bottomSheetModel.saveTheme();
      Navigator.of(context).pop();
      // ignore: avoid_print
      print('accept button was pressed');
    }

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: onTap,
              child: const Text(
                AppStrings.acceptButtonName,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
