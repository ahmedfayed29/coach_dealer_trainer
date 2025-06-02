import 'package:coach/art_core/art_core.dart';
import 'package:coach/core/networking/repository/settings_repository.dart';
import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';
import 'contact_us_state.dart';

class ContactUsController extends GetxController {
  final SettingsRepository settingsRepository;
  final ContactUsState state = ContactUsState();

  ContactUsController(this.settingsRepository);

  @override
  void onInit() {
    super.onInit();
    getSettings();
  }

  void updateName(String name) {
    state.name.value = name;
  }

  void updateEmail(String email) {
    state.email.value = email;
  }

  void updateMessage(String message) {
    state.message.value = message;
  }

  bool validateName() {
    if (state.name.value.isEmpty || state.name.value.length < 3) {
      state.errorName.value = "name_validator".tr;
      return false;
    } else {
      state.errorName.value = '';
      return true;
    }
  }

  bool validateEmail() {
    if (!GetUtils.isEmail(state.email.value)) {
      state.errorEmail.value = "email_validator".tr;
      return false;
    } else {
      state.errorEmail.value = '';
      return true;
    }
  }

  bool validateMessage() {
    if (state.message.value.isEmpty || state.message.value.length < 10) {
      state.errorMessage.value = "message_validator".tr;
      return false;
    } else {
      state.errorMessage.value = '';
      return true;
    }
  }

  bool isValidForm() => validateName() && validateEmail() && validateMessage();

  void sendContactUs() async {
    if (isValidForm()) {
      state.networkState.value = NetworkState.LOADING;
      final response = await settingsRepository.sendContactUs(
        name: state.name.value,
        email: state.email.value,
        message: state.message.value,
      );
      if (response.isRequestSuccess) {
        state.networkState.value = NetworkState.SUCCESS;
        Get.back();
        showCustomSnackBar(response.body.message!);
      } else {
        state.networkState.value = NetworkState.ERROR;
        showCustomSnackBar(response.errorMessage, isError: true);
      }
    }
  }

  void getSettings() async {
    state.networkState.value = NetworkState.LOADING;
    final response = await settingsRepository.getSettings();
    if (response.isRequestSuccess) {
      state.networkState.value = NetworkState.SUCCESS;
      state.phoneNumber.value = response.body.data!.phone!;
      state.xLink.value = response.body.data!.twitter!;
      state.tikTokLink.value = response.body.data!.tiktok!;
      state.instagramLink.value = response.body.data!.instagram!;
    } else {
      state.networkState.value = NetworkState.ERROR;
    }
  }
}
