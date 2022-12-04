import 'dart:async';

import 'package:get/get.dart';

class ProgressController extends GetxController {
  double firstTextPosition = 100;
  double firstTextOpacity = 0;

  double secondTextPosition = 50;
  double secondTextOpacity = 1;

  double thirdTextPosition = 0;
  double thirdTextOpacity = 0;

  var centerText = "SecondText";

  bool get isFirstTextInTop => centerText == 'SecondText';

  bool get isFirstTextInCenter => centerText == 'FirstText';

  bool get isFirstTextInBottom => centerText == 'ThirdText';

  moveFistTextToBottom() async {
    centerText = "ThirdText";

    secondTextPosition = 100;
    secondTextOpacity = 0;

    thirdTextPosition = 50;
    thirdTextOpacity = 1;

    firstTextPosition = 0;
    firstTextOpacity = 0;
    update();
  }

  moveFistTextToCenter() async {
    centerText = "FirstText";

    thirdTextPosition = 100;
    thirdTextOpacity = 0;

    firstTextPosition = 50;
    firstTextOpacity = 1;

    secondTextPosition = 0;
    secondTextOpacity = 0;
    update();
  }

  moveFistTextToTop() async {
    centerText = "SecondText";

    firstTextPosition = 100;
    firstTextOpacity = 0;

    secondTextPosition = 50;
    secondTextOpacity = 1;

    thirdTextPosition = 0;
    thirdTextOpacity = 0;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (isFirstTextInTop) {
        moveFistTextToBottom();
        return;
      }
      if (isFirstTextInCenter) {
        moveFistTextToTop();
        return;
      }

      if (isFirstTextInBottom) {
        moveFistTextToCenter();
        return;
      }
    });
  }
}
