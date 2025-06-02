import 'package:coach/core/networking/network_state_enum.dart';
import 'package:coach/core/networking/responses/countries/country_model.dart';
import 'package:get/get.dart';

import '../../../art_core/widgets/custom_snackbar.dart';
import '../../../core/networking/repository/auth/auth_repository.dart';
import '../../../core/routes/app_pages.dart';
import 'login_state.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;

  final LoginPageState state = LoginPageState();

  LoginController(this.authRepository);

  @override
  Future<void> onInit() async {
    await getCountries();
    super.onInit();
  }

  @override
  void onReady() async {
    // await getCountries();
    // PreferenceManager().saveAuthToken('');
  }

  void updatePhone(String phone) {
    state.phone.value = phone;
  }

  void updateCountry(CountryModel country) {
    state.country.value = country;
  }

  bool validatePhone() {
    if (!GetUtils.isPhoneNumber(state.phone.value)) {
      state.errorPhone.value = "phone_number_validator".tr;
      return false;
    } else {
      state.errorPhone.value = '';
      return true;
    }
  }

  void login() async {
    try {
      if (validatePhone()) {
        state.networkState.value = NetworkState.LOADING;
        final response = await authRepository.login(
            phone: state.phone.value, countryCode: state.country.value.countryCode!);
        if (response.isRequestSuccess) {
          state.networkState.value = NetworkState.SUCCESS;
          Get.toNamed(Routes.OTP,
              arguments: [state.phone.value, state.country.value.countryCode, false]);
        } else {
          state.networkState.value = NetworkState.ERROR;
          showCustomSnackBar(response.errorMessage, isError: true);
        }
      }
    } catch (e, s) {
      state.networkState.value = NetworkState.ERROR;
      showCustomSnackBar("something_went_wrong".tr, isError: true);
    }
  }

  Future<void> getCountries() async {
    state.countriesNetworkState.value = NetworkState.LOADING;
    final response = await authRepository.countries();
    if (response.isRequestSuccess) {
      state.countriesNetworkState.value = NetworkState.SUCCESS;
      state.countries.value = response.body.data ?? [];
      state.country.value = response.body.data!.first;
    } else {
      state.countriesNetworkState.value = NetworkState.ERROR;
      showCustomSnackBar(response.errorMessage, isError: true);
    }
  }
}
