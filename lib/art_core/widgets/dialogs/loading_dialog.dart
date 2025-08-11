import 'dart:ui';

import 'package:get/get.dart';

import '../../art_core.dart';

showLoadingDialog() {
  showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), child: const AppLoading());
      });
}
