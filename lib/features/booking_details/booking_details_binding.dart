import 'package:get/get.dart';

import 'booking_details_logic.dart';

class BookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailsLogic());
  }
}
