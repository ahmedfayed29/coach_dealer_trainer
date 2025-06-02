import 'package:get/get.dart';

import '../../core/caching/preference_manager.dart';
import '../../core/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  navigate() {
    final preferenceManager = Get.find<PreferenceManager>();
    if (preferenceManager.isFirstTime()) {
      Get.offAllNamed(Routes.CHOOSE_LANG);
    } else {
      if (!preferenceManager.isLoggedIn()) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        // Get.offAllNamed(Routes.MAIN_PAGE);
        Get.offAllNamed(Routes.CHOOSE_LANG);
      }
    }
  }
}
