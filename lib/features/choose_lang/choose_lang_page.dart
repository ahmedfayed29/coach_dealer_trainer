import 'package:coach/features/choose_lang/widgets/lang_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../art_core/art_core.dart';

class ChooseLangPage extends StatelessWidget {
  const ChooseLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 160.h,
                width: 160.h,
              ),
            ),
            SizedBox(height: 30.h),
            AppText(
              text: "welcome_text".tr,
              fontSize: 20.h,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 12.h),
            AppText(
              text: "choose_language".tr,
              fontSize: 16.h,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 48.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LangItem(
                    langCode: "en",
                    langName: "English",
                    langFlag: "assets/icons/en.svg",
                  ),
                ),
                Expanded(
                  child: LangItem(
                    langCode: "ar",
                    langName: "العربية",
                    langFlag: "assets/icons/ar.svg",
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 16.w)
          ],
        ));
  }
}
