import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';
import '../../../core/caching/preference_manager.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/routes/app_pages.dart';
import 'otp_state.dart';

class OTPController extends GetxController {
  final AuthRepository authRepository;
  final OTPPageState state = OTPPageState();

  OTPController(this.authRepository);

  final preferenceManager = Get.find<PreferenceManager>();

  @override
  void onReady() {
    // PreferenceManager().saveAuthToken('');
  }

  void updateOTP(String otp) {
    state.otp.value = otp;
  }

  bool validateOTP() {
    if (state.otp.value.isEmpty || state.otp.value.length != 4) {
      state.errorOTP.value = "enter_otp".tr;
      return false;
    } else {
      state.errorOTP.value = '';
      return true;
    }
  }

  void sendOTP({
    required String countryCode,
    required String phone,
    required bool isRegister,
  }) async {
    if (validateOTP()) {
      state.networkState.value = NetworkState.LOADING;
      final response = await authRepository.verifyOTP(
        phone: Get.arguments[0],
        otp: state.otp.value,
        countryCode: Get.arguments[1],
      );
      if (response.isRequestSuccess) {
        state.networkState.value = NetworkState.SUCCESS;

        preferenceManager.saveAuthToken(response.body.data!.token!);
        preferenceManager.saveIsLoggedIn(true);
        preferenceManager.saveUser(response.body.data!);
        print("isRegister $isRegister");
        Get.toNamed(isRegister ? Routes.COMPLETE_REGISTER : Routes.HOME,
            arguments: isRegister ? [phone, countryCode, false] : []);
      } else {
        state.networkState.value = NetworkState.ERROR;
        showCustomSnackBar(response.errorMessage, isError: true);
      }
    } else {
      showCustomSnackBar("enter_otp".tr, isError: true);
    }
  }
}
