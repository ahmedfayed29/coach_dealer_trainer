import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeItem extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isAvailable;

  const TimeItem(
      {super.key,
      required this.time,
      this.isSelected = false,
      required this.onTap,
      this.isAvailable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          onTap();
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.transparent),
            color: isSelected
                ? AppColors.primaryColor.shade500
                : isAvailable
                    ? AppColors.containerBackground
                    : AppColors.containerBackground.withOpacity(0.4)),
        child: AppText(
          text: time,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          textDecoration: !isAvailable ? TextDecoration.lineThrough : null,
          color: isSelected
              ? AppColors.primaryColor
              : isAvailable
                  ? AppColors.textSecondary
                  : Color(0xFFCDCDCD),
        ),
      ),
    );
  }
}
