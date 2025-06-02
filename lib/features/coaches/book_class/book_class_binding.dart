import 'package:get/get.dart';

import 'book_class_controller.dart';

class BookClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookClassController());
  }
}
