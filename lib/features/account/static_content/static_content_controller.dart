import 'package:coach/core/networking/repository/settings_repository.dart';
import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';
import 'static_content_state.dart';

class StaticContentController extends GetxController {
  final SettingsRepository settingsRepository;
  final StaticContentState state = StaticContentState();

  StaticContentController(this.settingsRepository);

  void getContent({bool isPrivacyPolicy = false}) async {
    state.networkState.value = NetworkState.LOADING;
    final content = await settingsRepository.getSettings();
    if (content.isRequestSuccess) {
      state.networkState.value = NetworkState.SUCCESS;
      if (isPrivacyPolicy) {
        state.content.value = content.body.data!.privacy!;
      } else {
        state.content.value = content.body.data!.terms!;
      }
    } else {
      state.networkState.value = NetworkState.ERROR;
    }
  }
}
