import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/model/app_state_model.dart';
import 'package:surf_flutter_courses_template/core/domain/profile_app_bar_widget/profile_app_bar_widget.dart';
import 'package:surf_flutter_courses_template/core/domain/profile_widget/profile_widget_model.dart';
import 'package:surf_flutter_courses_template/core/extension/button_style_extension.dart';
import 'package:surf_flutter_courses_template/core/extension/text_style_extension.dart';

class ProfileWidgetView extends StatelessWidget {
  const ProfileWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ProfileWidgetModel>(context, listen: false);

    final theme = Theme.of(context);

    void openBottomSheet() {
      widgetModel.openThemeChangerBottomSheet(context);
    }

    return SafeArea(
      child: Scaffold(
        appBar: const ProfileAppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  const _AvatarWidget(
                    radius: 40,
                    image: NetworkImage(AppStrings.avatarUrlAddress),
                  ),
                  const _AwardsWidget(
                    medals: [
                      _MedalWidget(medal: AppStrings.medalGold),
                      _MedalWidget(medal: AppStrings.medalGold),
                      _MedalWidget(medal: AppStrings.medalBronze),
                      _MedalWidget(medal: AppStrings.medalSilver),
                      _MedalWidget(medal: AppStrings.medalBronze),
                    ],
                  ),
                  const _ProfileInfoContainer(
                    title: AppStrings.nameContainerTitle,
                    data: AppStrings.nameContainerData,
                  ),
                  const _ProfileInfoContainer(
                    title: AppStrings.emailContainerTitle,
                    data: AppStrings.emailContainerData,
                  ),
                  const _ProfileInfoContainer(
                    title: AppStrings.birthdayContainerTitle,
                    data: AppStrings.birthdayContainerData,
                  ),
                  _ProfileInfoContainer(
                    title: AppStrings.teamContainerTitle,
                    data: AppStrings.teamContainerData,
                    callback: () {},
                  ),
                  _ProfileInfoContainer(
                    title: AppStrings.positionContainerTitle,
                    data: AppStrings.positionContainerData,
                    callback: () {},
                  ),
                  Consumer<AppStateModel>(
                    builder: (_, state, child) {
                      return _ProfileInfoContainer(
                        title: AppStrings.bottomSheetTitle,
                        data: state.currentTheme.getThemeTypeName,
                        callback: openBottomSheet,
                      );
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: theme.textButtonTheme.mainButton.style,
                      child: const Text(
                        AppStrings.exitButtonName,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет аватара
class _AvatarWidget extends StatelessWidget {
  final double radius;

  final ImageProvider image;
  const _AvatarWidget({
    required this.radius,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircleAvatar(
          radius: radius,
          backgroundImage: image,
          child: Center(
            child: Text(
              AppStrings.editButtonName,
              style: theme.textTheme.customCaption,
            ),
          ),
        ),
      ),
    );
  }
}

/// Виджет списка наград
class _AwardsWidget extends StatelessWidget {
  final List<Widget> medals;

  const _AwardsWidget({required this.medals});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.customNormal
        .copyWith(color: theme.colorScheme.tertiary);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.awardsTitle,
            style: textStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 224,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: medals,
            ),
          )
        ],
      ),
    );
  }
}

/// Виджет медали
class _MedalWidget extends StatelessWidget {
  final String medal;

  const _MedalWidget({
    required this.medal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      medal,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    );
  }
}

class _ProfileInfoContainer extends StatelessWidget {
  final String title;

  final String data;

  /// Обработка нажатия на коллбэк.
  /// Если коллбэк указан в параметрах то будет отображаться стрелка
  /// в правой части контейнера
  final VoidCallback? callback;

  const _ProfileInfoContainer({
    required this.title,
    required this.data,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleTextStyle = theme.textTheme.customNormal
        .copyWith(color: theme.colorScheme.secondary);

    final dataTextStyle = theme.textTheme.customNormal
        .copyWith(color: theme.colorScheme.tertiary);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: callback,
        behavior: HitTestBehavior.opaque,
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: theme.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: titleTextStyle,
                      ),
                      Text(
                        data,
                        style: dataTextStyle,
                      ),
                    ],
                  ),
                ),
                if (callback != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    child: SizedBox.square(
                      dimension: 24,
                      child: Center(
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
