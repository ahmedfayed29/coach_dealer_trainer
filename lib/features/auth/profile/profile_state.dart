import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';
import '../../../core/networking/responses/countries/country_model.dart';

class ProfileState {
  late RxString name;
  late RxString errorName;
  late RxString phone;
  late RxString errorPhone;
  late Rx<CountryModel> country;
  late Rx<List<CountryModel>> countries;
  late RxString weight;
  late RxString tall;
  late RxString gender;
  late RxString age;
  late RxString healthProblems;
  late RxString image;
  late RxString errorMessage;
  late Rx<NetworkState> networkState;
  late Rx<NetworkState> countriesNetworkState;

  ProfileState() {
    ///Initialize variables
    name = ''.obs;
    errorName = ''.obs;
    phone = ''.obs;
    errorPhone = ''.obs;
    country = CountryModel().obs;
    countries = Rx<List<CountryModel>>([]);
    weight = ''.obs;
    tall = ''.obs;
    healthProblems = ''.obs;
    age = ''.obs;
    gender = ''.obs;
    image = ''.obs;
    errorMessage = ''.obs;
    networkState = NetworkState.INITIAL.obs;
    countriesNetworkState = NetworkState.INITIAL.obs;
  }
}
