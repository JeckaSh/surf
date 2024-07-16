import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_images.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/extensions/text_extension.dart';
import 'package:surf_flutter_courses_template/presentation/pages/magic_ball_page/magic_ball_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/magic_ball/magic_ball_widget.dart';

class MagicBallView extends StatefulWidget {
  const MagicBallView({super.key});

  @override
  State<MagicBallView> createState() => _MagicBallViewState();
}

class _MagicBallViewState extends State<MagicBallView> {
  /// Получить доступ к модели виджета через provider
  MagicBallWidgetModel get widgetModel => context.read<MagicBallWidgetModel>();

  /// Детектор, считывающий встряску телефона
  late ShakeDetector shakeDetector;

  @override
  void initState() {
    super.initState();
    shakeDetector =
        ShakeDetector.waitForStart(onPhoneShake: widgetModel.getPrediction)
          ..startListening();
  }

  @override
  void dispose() {
    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: AppColors.appBackground),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: height / 2 - 280,
                  child: const ShadowBallWidget(),
                ),
                const Positioned(
                  bottom: 40,
                  child: HintWidget(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MagicBallWidget(
                      onTap: widgetModel.getPrediction,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShadowBallWidget extends StatelessWidget {
  const ShadowBallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Image.asset(ImagePath.shadowBall),
    );
  }
}

class HintWidget extends StatelessWidget {
  const HintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: [
          Text(
            AppStrings.hintFirstPart,
            style: textStyle.hintTheme,
          ),
          Text(
            AppStrings.hintSecondPart,
            style: textStyle.hintTheme,
          ),
        ],
      ),
    );
  }
}
