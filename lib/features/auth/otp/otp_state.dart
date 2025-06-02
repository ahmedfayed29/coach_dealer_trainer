import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';

class OTPPageState {
  late RxString otp;
  late RxString errorOTP;
  late Rx<NetworkState> networkState;

  OTPPageState() {
    ///Initialize variables
    otp = ''.obs;
    errorOTP = ''.obs;
    networkState = NetworkState.INITIAL.obs;
  }
}
