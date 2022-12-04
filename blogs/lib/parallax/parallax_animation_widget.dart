import 'dart:async';

import 'package:blogs/utility.dart';
import 'package:flutter/material.dart';

class ParallaxAnimationWidget extends StatefulWidget {
  final Widget child;

  const ParallaxAnimationWidget({required this.child, super.key});

  @override
  State<ParallaxAnimationWidget> createState() => _WidgetState();
}

class _WidgetState extends State<ParallaxAnimationWidget> {
  Duration animationDuration = const Duration(seconds: 15);
  final initialDelay = Future.delayed(const Duration(seconds: 1));
  final parallaxWidthPercent = 20;
  final childKey = GlobalKey();

  late Widget childWithKey;
  Timer? animationTimer;
  double? childBaseWidth;
  double? totalAdditionalParallaxWidth;
  double? rightPosition;
  double maxEndPosition = 0;
  double maxStartPosition = 0;

  @override
  void initState() {
    super.initState();
    setLightStatusBarTheme();
    childWithKey = SizedBox(key: childKey, child: widget.child);
    fetchChildWidth();
    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    animationTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          right: rightPosition,
          duration: animationDuration,
          child: SizedBox(
            width:
                (childBaseWidth != null && totalAdditionalParallaxWidth != null)
                    ? (childBaseWidth! + totalAdditionalParallaxWidth!)
                    : null,
            child: childWithKey,
          ),
        ),
      ],
    );
  }

  initTimer() async {
    animationTimer?.cancel();
    await initialDelay;
    updateChildPosition();
    animationTimer = Timer.periodic(
      animationDuration,
      (_) => updateChildPosition(),
    );
  }

  updateChildPosition() async {
    if (rightPosition == 0) {
      rightPosition = maxEndPosition;
    } else if (rightPosition == maxEndPosition) {
      rightPosition = maxStartPosition;
    } else if (rightPosition == maxStartPosition) {
      rightPosition = maxEndPosition;
    } else {
      rightPosition = maxEndPosition;
    }
    setState(() {});
  }

  fetchChildWidth() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final RenderBox renderBoxRed =
            childKey.currentContext?.findRenderObject() as RenderBox;
        final childSize = renderBoxRed.size;
        childBaseWidth = childSize.width;
        initChildPosition();
      },
    );
  }

  initChildPosition() {
    totalAdditionalParallaxWidth = childBaseWidth! * parallaxWidthPercent / 100;
    rightPosition = -totalAdditionalParallaxWidth! / 2;
    maxEndPosition = -childBaseWidth! + totalAdditionalParallaxWidth!;
    maxStartPosition = totalAdditionalParallaxWidth!;
    setState(() {});
  }
}
