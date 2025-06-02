import 'package:coach/core/networking/network_state_enum.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ContactUsState {
  late RxString name;
  late RxString errorName;
  late RxString email;
  late RxString errorEmail;
  late RxString message;
  late RxString errorMessage;
  late RxString xLink;
  late RxString tikTokLink;
  late RxString instagramLink;
  late RxString phoneNumber;

  late Rx<NetworkState> networkState;

  ContactUsState() {
    ///Initialize variables
    name = ''.obs;
    errorName = ''.obs;
    email = ''.obs;
    errorEmail = ''.obs;
    message = ''.obs;
    errorMessage = ''.obs;
    xLink = ''.obs;
    tikTokLink = ''.obs;
    instagramLink = ''.obs;
    phoneNumber = ''.obs;
    networkState = NetworkState.INITIAL.obs;
  }
}
