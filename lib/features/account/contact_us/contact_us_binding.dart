import 'package:coach/core/networking/repository/settings_repository.dart';
import 'package:get/get.dart';

import 'contact_us_controller.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController(Get.find<SettingsRepository>()));
  }
}
