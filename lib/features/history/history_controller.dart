import 'package:get/get.dart';

import '../../core/networking/network_state_enum.dart';
import '../../core/networking/repository/booking_repository.dart';
import 'history_state.dart';

class HistoryController extends GetxController {
  final HistoryState state = HistoryState();

  @override
  void onInit() {
    super.onInit();
    getTodaySession();
  }

  Future<void> getTodaySession() async {
    state.networkState.value = NetworkState.LOADING;
    final res = await BookingRepository().todayBooking();
    if (res.isRequestSuccess) {
      state.todaySession.value = res.body.data!;
      state.networkState.value = NetworkState.SUCCESS;
    } else {
      state.networkState.value = NetworkState.ERROR;
      Get.snackbar('Error', res.errorMessage ?? 'An error occurred');
    }
  }
}
