import 'package:coach/art_core/art_core.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String text, {bool isError = false}) {
  Get.showSnackbar(GetSnackBar(
    messageText: AppText(text: text, color: AppColors.white, maxLines: 4),
    backgroundColor: isError ? Colors.red : AppColors.primaryColor,
    borderRadius: 10,
    isDismissible: true,
    margin: const EdgeInsets.symmetric(horizontal: 40),
    snackPosition: SnackPosition.BOTTOM,
    animationDuration: const Duration(milliseconds: 700),
    duration: const Duration(seconds: 5),
  ));
}
