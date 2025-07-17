import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../art_core.dart';

class PaymentMethodItem extends StatelessWidget {
  final String image;
  final String name;
  final bool isSelected;
  final bool isSelectable;

  const PaymentMethodItem(
      {super.key,
      required this.image,
      required this.name,
      this.isSelected = false,
      required this.isSelectable});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
            color: isSelectable
                ? isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.shade500
                : AppColors.white),
      ),
      color: isSelectable
          ? isSelected
              ? AppColors.primaryColor.shade500
              : AppColors.white
          : AppColors.white,
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 8.w),
          AppText(
            text: name,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          Spacer(),
          if (isSelectable)
            if (isSelected) ...[
              SvgPicture.asset("assets/icons/selected_radio.svg"),
            ] else ...[
              SvgPicture.asset("assets/icons/radio.svg"),
            ]
        ],
      ).marginAll(12.h),
    );
  }
}
