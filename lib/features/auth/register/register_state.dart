import 'package:coach/core/networking/network_state_enum.dart';
import 'package:get/get.dart';

import '../../../core/networking/responses/countries/country_model.dart';

class RegisterPageState {
  late RxString name;
  late RxString phone;
  late RxString errorName;
  late RxString errorPhone;
  late Rx<CountryModel> country;
  late Rx<List<CountryModel>> countries;
  late Rx<NetworkState> networkState;
  late Rx<NetworkState> countriesNetworkState;

  RegisterPageState() {
    ///Initialize variables
    name = ''.obs;
    phone = ''.obs;
    errorName = ''.obs;
    errorPhone = ''.obs;
    networkState = NetworkState.INITIAL.obs;
    countriesNetworkState = NetworkState.INITIAL.obs;
    country = CountryModel().obs;
    countries = Rx<List<CountryModel>>([]);
  }
}
