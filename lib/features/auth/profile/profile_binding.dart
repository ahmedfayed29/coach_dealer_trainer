import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(Get.find<AuthRepository>()));
  }
}
