import 'package:coach/art_core/art_core.dart';
import 'package:coach/core/caching/preference_manager.dart';
import 'package:coach/core/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<PreferenceManager>().getUser();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.ACCOUNT),
          child: CircleAvatar(
            radius: 20,
            child: Image.network("${user.image}"),
          ),
        ),
        AppText(
          text: "${"welcome".tr} ${user.name}",
          color: AppColors.primaryColor,
          fontSize: 18,
        ).marginSymmetric(horizontal: 8.w),
        Spacer(),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
          child: SvgPicture.asset("assets/icons/notification.svg"),
        ),
      ],
    ).marginSymmetric(horizontal: 16.w);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
