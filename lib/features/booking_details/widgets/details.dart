import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/networking/responses/booking/booking_model.dart';

class Details extends StatelessWidget {
  final BookingModel item;
  const Details({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.h,
          children: [
            Row(
              children: [
                AppText(
                  text: 'class_type'.tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                AppText(
                  text: ' : ${item.sport.name}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: 'class_date'.tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                AppText(
                  text: ' : ${item.bookingDate}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: 'class_time'.tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                AppText(
                  text: ' : ${item.startTime}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
