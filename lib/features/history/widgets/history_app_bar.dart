import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: AppText(
        text: "bookings_history".tr,
        color: AppColors.primaryColor,
        fontSize: 18,
      ).marginSymmetric(horizontal: 0.w),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
