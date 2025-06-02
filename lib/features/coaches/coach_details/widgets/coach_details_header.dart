import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../art_core/art_core.dart';

class CoachDetailsHeader extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  const CoachDetailsHeader({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(180.h),
      child: Stack(
        children: [
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.primaryColor.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 70.r,
              backgroundImage: NetworkImage(image!),
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: Get.locale!.languageCode == "ar" ? 20.w : null,
            right: Get.locale!.languageCode == "en" ? 20.w : null,
            child: SvgPicture.asset("assets/icons/whatsapp.svg"),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AppText(
              text: "coach_profile".tr,
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ).marginOnly(top: 65.h),
          Align(
            alignment: Get.locale!.languageCode == "en" ? Alignment.topLeft : Alignment.topRight,
            child: BackButton(
              color: AppColors.white,
            ),
          ).marginOnly(top: 50.h),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(180.h);
}
