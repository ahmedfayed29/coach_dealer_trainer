import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../core/caching/preference_manager.dart';
import '../../../core/routes/app_pages.dart';
import 'account_state.dart';

class AccountController extends GetxController {
  final AccountState state = AccountState();

  Future<void> logout() async {
    final res = await AuthRepository().logout();
    if (res.isRequestSuccess) {
      Get.find<PreferenceManager>().logout();
      Get.offAllNamed(Routes.LOGIN);
    } else {}
  }
}
