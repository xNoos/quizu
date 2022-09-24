import 'package:get/get.dart';

import '../controllers/wrong_answer_controller.dart';

class WrongAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrongAnswerController>(
      () => WrongAnswerController(),
    );
  }
}
