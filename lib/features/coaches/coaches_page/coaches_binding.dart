import 'package:get/get.dart';

import 'coaches_controller.dart';

class CoachesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoachesController());
  }
}
