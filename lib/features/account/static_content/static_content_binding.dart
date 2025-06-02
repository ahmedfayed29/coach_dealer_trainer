import 'package:coach/core/networking/repository/settings_repository.dart';
import 'package:get/get.dart';

import 'static_content_controller.dart';

class StaticContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StaticContentController(Get.find<SettingsRepository>()));
  }
}
