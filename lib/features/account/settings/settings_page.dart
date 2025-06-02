import 'package:coach/art_core/art_core.dart';
import 'package:coach/core/caching/preference_manager.dart';
import 'package:get/get.dart';

import '../account_page/widgets/menu_item.dart';
import 'settings_controller.dart';
import 'settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    final SettingsState state = Get.find<SettingsController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "settings".tr,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.secondaryBorderColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                MenuItem(
                  title: "notifications".tr,
                  trailing: SizedBox(
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch.adaptive(
                        value: true,
                        onChanged: (val) {},
                        activeColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                MenuItem(
                  title: "language".tr,
                  onTap: () {
                    final langCode = Get.locale!.languageCode == "ar" ? "en" : "ar";
                    Get.updateLocale(Locale(langCode));
                    Get.find<PreferenceManager>().saveLanguage(langCode);
                  },
                  hasDivider: false,
                  trailing: AppText(
                    text: Get.locale!.languageCode.toUpperCase(),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
