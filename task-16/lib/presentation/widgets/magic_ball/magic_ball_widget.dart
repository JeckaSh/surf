import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_images.dart';
import 'package:surf_flutter_courses_template/assets/duration_time.dart';
import 'package:surf_flutter_courses_template/core/domain/widget_status_model/widget_status_model.dart';
import 'package:surf_flutter_courses_template/presentation/pages/magic_ball_page/magic_ball_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/prediction/prediction_widget.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/progress_dots_indicator/progress_dots_indicator.dart';

class MagicBallWidget extends StatefulWidget {
  /// Коллбэк обработчик нажатия на магический шар
  final VoidCallback onTap;

  const MagicBallWidget({
    super.key,
    required this.onTap,
  });

  @override
  State<MagicBallWidget> createState() => _MagicBallWidgetState();
}

class _MagicBallWidgetState extends State<MagicBallWidget> {
  @override
  Widget build(BuildContext context) {
    final widgetModel = context.read<MagicBallWidgetModel>();
    const defaultSize = 1.0;
    const zoomSize = 10.0;

    return SizedBox.square(
      dimension: 300,
      child: GestureDetector(
        onTap: widget.onTap,
        child: StreamBuilder<WidgetStatusModel>(
          stream: widgetModel.widgetStatusController,
          builder: (context, snapshot) {
            return AnimatedScale(
              duration: DurationTime.extend,
              scale: widgetModel.widgetStatus == WidgetStatusModel.loading
                  ? zoomSize
                  : defaultSize,
              child: CircleAvatar(
                backgroundImage: const AssetImage(ImagePath.ball),
                child: MagicBallContentWrapper(
                  status: widgetModel.widgetStatus,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Виджет обёртка магического шара для плавной смены предсказаний
class MagicBallContentWrapper extends StatefulWidget {
  final WidgetStatusModel status;

  const MagicBallContentWrapper({
    super.key,
    required this.status,
  });

  @override
  State<MagicBallContentWrapper> createState() =>
      _MagicBallContentWrapperState();
}

class _MagicBallContentWrapperState extends State<MagicBallContentWrapper> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        duration: DurationTime.base,
        child: LayoutBuilder(
          key: ValueKey('layoutBldr-${widget.status.name}'),
          builder: (context, constraints) {
            return SizedBox.square(
              dimension: constraints.maxHeight - 10,
              child: MagicBallContentWidget(
                status: widget.status,
              ),
            );
          },
        ),
      ),
    );
  }
}

class MagicBallContentWidget extends StatelessWidget {
  final WidgetStatusModel status;

  const MagicBallContentWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final widgetModel =
        Provider.of<MagicBallWidgetModel>(context, listen: false);

    switch (status) {
      case WidgetStatusModel.wait:
      case WidgetStatusModel.error:
        {
          return PredictionWidget(
            message: widgetModel.currentPrediction?.message ?? '',
            isErrorMessage: status == WidgetStatusModel.error,
          );
        }
      case WidgetStatusModel.loading:
        {
          return const ProgressDotsIndicator();
        }
      case WidgetStatusModel.init:
      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
