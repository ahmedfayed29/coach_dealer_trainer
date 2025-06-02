import 'package:get/get.dart';

import '../../../core/networking/repository/auth/auth_repository.dart';
import 'complete_register_logic.dart';

class CompleteRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteRegisterLogic(Get.find<AuthRepository>()));
  }
}
