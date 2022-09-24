import 'package:get/get.dart';

import '../controllers/create_username_controller.dart';

class CreateUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUsernameController>(
      () => CreateUsernameController(),
    );
  }
}
