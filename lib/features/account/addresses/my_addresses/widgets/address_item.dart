import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../art_core/art_core.dart';

class AddressItem extends StatelessWidget {
  final String title;
  final String description;

  const AddressItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/location_filled.svg"),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              AppText(
                text: description,
                fontSize: 14,
                maxLines: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset("assets/icons/delete.svg"),
        ],
      ).marginAll(16),
    );
  }
}
