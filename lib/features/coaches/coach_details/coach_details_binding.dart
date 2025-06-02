import 'package:get/get.dart';

import 'coach_details_controller.dart';

class CoachDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoachDetailsController());
  }
}
