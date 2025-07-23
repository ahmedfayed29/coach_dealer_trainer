import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/networking/responses/booking/booking_model.dart';

class Price extends StatelessWidget {
  final BookingModel item;
  const Price({super.key, required this.item});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "${'class_booking_fees'.tr} : ",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.borderColor,
                ),
                AppText(
                  text: item.classPrice,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.borderColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "${'discount'.tr} : ",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.borderColor,
                ),
                AppText(
                  text: item.discount,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.borderColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Divider(
                color: AppColors.secondaryColor,
                height: 1.h,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "${'total'.tr} : ",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.borderColor,
                ),
                AppText(
                  text: item.grandTotal,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
