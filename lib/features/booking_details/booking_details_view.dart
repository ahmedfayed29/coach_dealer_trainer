import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/booking_details/widgets/details.dart';
import 'package:coach/features/booking_details/widgets/header.dart';
import 'package:coach/features/booking_details/widgets/price.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/networking/responses/booking/booking_model.dart';
import 'booking_details_logic.dart';
import 'booking_details_state.dart';

class BookingDetailsPage extends StatelessWidget {
  final BookingModel item;

  const BookingDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final BookingDetailsLogic logic = Get.put(BookingDetailsLogic());
    final BookingDetailsState state = Get.find<BookingDetailsLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'booking_details'.tr),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        children: [
          Header(item: item),
          AppText(
              text: 'class_details'.tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary),
          SizedBox(height: 8.h),
          Details(
            item: item,
          ),
          AppText(
              text: 'price_summary'.tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary),
          SizedBox(height: 8.h),
          Price(
            item: item,
          )
        ],
      ),
    );
  }
}
