import 'package:coach/features/auth/login/login_controller.dart';
import 'package:get/get.dart';

import '../../../core/networking/repository/auth/auth_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find<AuthRepository>()));
  }
}
