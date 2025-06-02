import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MajorItem extends StatelessWidget {
  final String title;

  const MajorItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.shade500, borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.all(8),
      child: AppText(
        text: title,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
    );
  }
}
