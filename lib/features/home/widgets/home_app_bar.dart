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
    print("USER IMAGE IN HOME APP BAR ${user.image}");
    return AppBar(
      leadingWidth: 70.w,
      leading: GestureDetector(
        onTap: () => Get.toNamed(Routes.ACCOUNT),
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                user.image ?? "",
              ),
            ),
          ),
        ),
      ),
      title: AppText(
        text: "${"welcome".tr} ${user.name}",
        color: AppColors.primaryColor,
        fontSize: 18,
      ).marginSymmetric(horizontal: 0.w),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
