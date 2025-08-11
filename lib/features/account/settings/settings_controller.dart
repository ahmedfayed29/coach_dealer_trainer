import 'package:get/get.dart';

import '../../../art_core/widgets/custom_snackbar.dart';
import '../../../art_core/widgets/dialogs/loading_dialog.dart';
import '../../../core/caching/preference_manager.dart';
import '../../../core/networking/repository/auth/auth_repository.dart';
import 'settings_state.dart';

class SettingsController extends GetxController {
  final SettingsState state = SettingsState();
  final authRepository = Get.find<AuthRepository>();

  final preferenceManager = Get.find<PreferenceManager>();

  @override
  void onInit() {
    final user = preferenceManager.getUser();
    state.isNotificationsEnabled.value = user.isNotificationsAllowed;
    super.onInit();
  }

  void updateNotificationSettings(bool value) async {
    try {
      showLoadingDialog();
      final response = await authRepository.updateSettings(isNotificationsEnabled: value);
      Get.back();
      if (response.isRequestSuccess) {
        preferenceManager.saveUser(response.body.data!);
        state.isNotificationsEnabled.value = response.body.data!.isNotificationsAllowed;
      } else {
        showCustomSnackBar(response.errorMessage, isError: true);
      }
    } catch (e) {
      Get.back();
      showCustomSnackBar("something_went_wrong", isError: true);
    }
  }
}
