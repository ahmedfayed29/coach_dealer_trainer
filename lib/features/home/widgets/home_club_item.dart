import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../art_core/theme/app_colors.dart';
import '../../../art_core/widgets/custom_rating_bar.dart';
import '../../../art_core/widgets/text/app_text.dart';

class HomeClubItem extends StatelessWidget {
  final String name;
  final double rate;
  final String imageUrl;
  final String description;
  final String location;

  const HomeClubItem({
    super.key,
    required this.name,
    required this.rate,
    required this.imageUrl,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: name,
                  fontSize: 14,
                ),
                AppText(
                  text: description,
                  fontSize: 14,
                  maxLines: 3,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textSecondary,
                ).marginSymmetric(vertical: 3.h),
                CustomRatingBar(
                  rating: rate,
                  ignoreGestures: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/location.svg"),
                    SizedBox(width: 4),
                    AppText(
                      text: location,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ).marginOnly(top: 8.h)
              ],
            ).marginSymmetric(horizontal: 14.w, vertical: 12.h)
          ],
        ),
      ),
    );
  }
}
