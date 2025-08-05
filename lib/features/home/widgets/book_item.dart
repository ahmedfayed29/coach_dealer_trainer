import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/networking/responses/booking/booking_model.dart';
import '../../../core/routes/app_pages.dart';

class BookItem extends StatelessWidget {
  final BookingModel item;

  const BookItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.BOOKING_DETAILS, arguments: [item]),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
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
                spacing: 10.w,
                children: [
                  Container(
                    width: 42.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(item.user.image), fit: BoxFit.fill)),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6.h,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              text: item.user.name,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary),
                          AppText(
                            text: item.dateFrom,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8.w,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor.shade500,
                                borderRadius: BorderRadius.circular(8)),
                            alignment: Alignment.center,
                            child: AppText(
                              text: '#${item.id}',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          AppText(
                            text: '${item.sport.name} - ${item.statusText}',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: item.status.toLowerCase() == "completed"
                                ? AppColors.green
                                : AppColors.primaryColor,
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
              Row(
                children: [
                  AppText(
                    text: 'class_date'.tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  AppText(
                    text: ' : ${item.bookingDate} ${item.startTime} - ${item.endTime}',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
