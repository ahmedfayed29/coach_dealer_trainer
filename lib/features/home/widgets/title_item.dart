import 'package:get/get.dart';

import '../../../art_core/art_core.dart';

class TitleItem extends StatelessWidget {
  final String title;

  final VoidCallback onTap;

  const TitleItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: title, fontSize: 18, fontWeight: FontWeight.bold),
        GestureDetector(onTap: onTap, child: AppText(text: "see_all".tr, fontSize: 14, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
