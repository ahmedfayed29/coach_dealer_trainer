import 'package:coach/art_core/art_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';

class AccountHeader extends StatelessWidget {
  final String name;
  final String phone, countryCode;
  final String image;

  const AccountHeader(
      {super.key,
      required this.name,
      required this.phone,
      required this.image,
      required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.COMPLETE_REGISTER, arguments: [
        phone,
        countryCode,
        true,
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: name,
                  color: AppColors.primaryColor,
                  fontSize: 18,
                ),
                AppText(
                  text: phone,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ).marginSymmetric(horizontal: 8),
            Spacer(),
            SvgPicture.asset("assets/icons/edit_profile.svg")
          ],
        ),
      ),
    );
  }
}
