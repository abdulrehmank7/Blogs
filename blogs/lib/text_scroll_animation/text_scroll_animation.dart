import 'package:blogs/text_scroll_animation/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextScrollAnimation extends StatelessWidget {
  const TextScrollAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<ProgressController>(
          init: Get.put(ProgressController()),
          builder: (ctr) {
            return SizedBox(
              height: 100,
              width: 300,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: 300,
                    duration: const Duration(milliseconds: 500),
                    bottom: ctr.firstTextPosition,
                    child: AnimatedOpacity(
                      opacity: ctr.firstTextOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'one is the title name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    width: 300,
                    duration: const Duration(milliseconds: 500),
                    bottom: ctr.secondTextPosition,
                    child: AnimatedOpacity(
                      opacity: ctr.secondTextOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'two is the title name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    width: 300,
                    duration: const Duration(milliseconds: 500),
                    bottom: ctr.thirdTextPosition,
                    child: AnimatedOpacity(
                      opacity: ctr.thirdTextOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'three is the title name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
