import 'package:coach/features/auth/register/register_controller.dart';
import 'package:get/get.dart';

import '../../../core/networking/repository/auth/auth_repository.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find<AuthRepository>()));
  }
}
