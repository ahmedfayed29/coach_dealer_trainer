import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  const NotificationItem({super.key, required this.title, required this.description, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/notification.svg"),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              AppText(
                text: description,
                fontSize: 14,
                maxLines: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ).marginSymmetric(vertical: 8),
              AppText(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ],
          )
        ],
      ).marginAll(16),
    );
  }
}
