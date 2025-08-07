import 'package:get/get.dart';

import '../../core/networking/network_state_enum.dart';
import '../../core/networking/responses/booking/booking_model.dart';

class HistoryState {
  late RxList<BookingModel> todaySession;
  late Rx<NetworkState> networkState;
  late Rx<String> filter;
  HistoryState() {
    todaySession = <BookingModel>[].obs;
    networkState = NetworkState.INITIAL.obs;
    filter = ''.obs;

    ///Initialize variables
  }
}
