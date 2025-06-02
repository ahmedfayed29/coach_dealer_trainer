import 'package:get/get.dart';

import 'my_addresses_controller.dart';

class MyAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressesController());
  }
}
