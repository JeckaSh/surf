import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/extension/text_style_extension.dart';

class ProfileAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleTextStyle =
        theme.textTheme.customTitle.copyWith(color: theme.colorScheme.tertiary);

    return AppBar(
      centerTitle: true,
      titleTextStyle: titleTextStyle,
      backgroundColor: theme.colorScheme.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          Icons.keyboard_backspace,
          color: theme.colorScheme.primary,
          size: 22,
        ),
      ),
      title: const Text(AppStrings.profileAppBarTitle),
      actions: [
        _AppBarActionButton(
          callback: () {},
          title: AppStrings.saveAppBarAction,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarActionButton extends StatelessWidget {
  final VoidCallback callback;

  final String title;

  const _AppBarActionButton({
    required this.callback,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle =
        theme.textTheme.customButton.copyWith(color: theme.colorScheme.primary);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: callback,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
