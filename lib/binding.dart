import 'package:coach/core/networking/repository/settings_repository.dart';
import 'package:get/get.dart';

import 'core/caching/preference_manager.dart';
import 'core/networking/network_handler.dart';
import 'core/networking/repository/auth/auth_repository.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreferenceManager(), permanent: true);
    Get.put(NetworkHandler(), permanent: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => SettingsRepository(), fenix: true);
  }
}
