import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/networking/network_state_enum.dart';

class StaticContentState {
  late RxString content;
  late Rx<NetworkState> networkState;
  StaticContentState() {
    ///Initialize variables
    content = ''.obs;
    networkState = NetworkState.INITIAL.obs;
  }
}
