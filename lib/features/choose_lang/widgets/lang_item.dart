import 'package:coach/art_core/widgets/text/app_text.dart';
import 'package:coach/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/caching/preference_manager.dart';

class LangItem extends StatelessWidget {
  final String langCode;
  final String langName;
  final String langFlag;

  const LangItem(
      {super.key, required this.langCode, required this.langName, required this.langFlag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.updateLocale(Locale(langCode));
        Get.find<PreferenceManager>().saveLanguage(langCode);
        Get.find<PreferenceManager>().saveIsFirstTime(false);
        Get.offAllNamed(Routes.LOGIN);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              langFlag,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 12.h),
            AppText(text: langName)
          ],
        ).marginSymmetric(vertical: 50.h),
      ),
    );
  }
}
