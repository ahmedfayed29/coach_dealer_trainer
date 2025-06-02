import 'package:coach/core/networking/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../art_core/widgets/custom_snackbar.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/networking/responses/countries/country_model.dart';
import 'profile_state.dart';

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  final ProfileState state = ProfileState();

  ProfileController(this.authRepository);

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getCountries();
  }

  void updateImage(String image) {
    state.image.value = image;
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

  void updateWeight(String weight) {
    state.weight.value = weight;
  }

  void updateTall(String tall) {
    state.tall.value = tall;
  }

  void updateGender(String gender) {
    state.gender.value = gender;
  }

  void updateAge(String age) {
    state.age.value = age;
  }

  void updateHealthProblems(String healthProblems) {
    state.healthProblems.value = healthProblems;
  }

  void updateProfile() async {
    try {
      state.networkState.value = NetworkState.LOADING;
      final response = await authRepository.updateProfile(
        name: state.name.value,
        phone: state.phone.value,
        countryCode: state.country.value.countryCode!,
        weight: state.weight.value.toString(),
        tall: state.tall.value.toString(),
        age: state.age.value.toString(),
        gender: state.gender.value,
        healthProblems: state.healthProblems.value,
      );
      if (response.isRequestSuccess) {
        state.networkState.value = NetworkState.SUCCESS;
        showCustomSnackBar("profile_updated_successfully".tr);
      } else {
        state.networkState.value = NetworkState.ERROR;
        showCustomSnackBar(response.errorMessage, isError: true);
      }
    } catch (e, s) {
      state.networkState.value = NetworkState.ERROR;
      showCustomSnackBar("something_went_wrong".tr, isError: true);
    }
  }

  void getProfile() async {
    try {
      state.networkState.value = NetworkState.LOADING;
      final response = await authRepository.getProfile();
      if (response.isRequestSuccess) {
        state.networkState.value = NetworkState.SUCCESS;
        // state.name.value = response.body.data!.name!;
        // state.phone.value = response.body.data!.phone!;
        // state.country.value = response.body.data!.country!;
        // state.tall.value = response.body.data!.tall ?? "";
        // state.weight.value = response.body.data!.weight ?? '';
        // state.age.value = response.body.data!.age ?? "";
        // state.gender.value = response.body.data!.gender ?? "";
        // state.healthProblems.value = response.body.data!.healthProblems ?? "";
        // state.image.value = response.body.data!.image!;
      } else {
        state.networkState.value = NetworkState.ERROR;
        state.errorMessage.value = response.errorMessage;
      }
    } catch (e) {
      print(e.toString());
      state.networkState.value = NetworkState.ERROR;
      state.errorMessage.value = "something_went_wrong".tr;
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
