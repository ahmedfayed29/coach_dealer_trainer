import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:coach/core/networking/responses/countries/country_model.dart';
import 'package:coach/core/routes/app_pages.dart';
import 'package:coach/features/auth/register/register_state.dart';
import 'package:get/get.dart';

import '../../../art_core/widgets/custom_snackbar.dart';
import '../../../core/networking/network_state_enum.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;
  final RegisterPageState state = RegisterPageState();

  RegisterController(this.authRepository);

  @override
  void onReady() {
    getCountries();
    // PreferenceManager().saveAuthToken('');
  }

  void updateName(String name) {
    state.name.value = name;
  }

  void updatePhone(String phone) {
    state.phone.value = phone;
  }

  void updateCountry(CountryModel country) {
    state.country.value = country;
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

  bool validatePhone() {
    if (!GetUtils.isPhoneNumber(state.phone.value)) {
      state.errorPhone.value = "phone_number_validator".tr;
      return false;
    } else {
      state.errorPhone.value = '';
      return true;
    }
  }

  bool isValidForm() => validateName() && validatePhone();

  void register() async {
    validateName();
    validatePhone();
    try {
      if (isValidForm()) {
        state.networkState.value = NetworkState.LOADING;
        final response = await authRepository.register(
          name: state.name.value,
          phone: state.phone.value,
          countryCode: state.country.value.countryCode!,
        );
        if (response.isRequestSuccess) {
          state.networkState.value = NetworkState.SUCCESS;
          Get.toNamed(Routes.OTP,
              arguments: [state.phone.value, state.country.value.countryCode, true]);
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

  void getCountries() async {
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
