import 'package:coach/core/networking/responses/countries/country_model.dart';
import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';

class LoginPageState {
  late RxString phone;
  late RxString errorPhone;
  late Rx<NetworkState> networkState;
  late Rx<NetworkState> countriesNetworkState;
  late Rx<CountryModel> country;
  late Rx<List<CountryModel>> countries;

  LoginPageState() {
    ///Initialize variables
    phone = ''.obs;
    errorPhone = ''.obs;
    networkState = NetworkState.INITIAL.obs;
    countriesNetworkState = NetworkState.INITIAL.obs;
    country = CountryModel().obs;
    countries = Rx<List<CountryModel>>([]);
  }
}
