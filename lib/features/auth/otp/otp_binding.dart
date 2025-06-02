import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import 'otp_controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OTPController(Get.find<AuthRepository>()));
  }
}
