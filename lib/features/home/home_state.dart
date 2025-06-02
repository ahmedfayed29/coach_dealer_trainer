import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../core/networking/network_state_enum.dart';
import '../../core/networking/responses/booking/booking_model.dart';

class HomeState {
  late RxList<BookingModel> todaySession;
  late Rx<NetworkState> networkState;
  HomeState() {
    todaySession = <BookingModel>[].obs;
    networkState = NetworkState.INITIAL.obs;

    ///Initialize variables
  }
}
