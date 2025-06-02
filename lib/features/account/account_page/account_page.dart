import 'package:coach/art_core/art_core.dart';
import 'package:coach/core/routes/app_pages.dart';
import 'package:coach/features/account/account_page/widgets/account_header.dart';
import 'package:coach/features/account/account_page/widgets/menu_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/caching/preference_manager.dart';
import 'account_controller.dart';
import 'account_state.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.put(AccountController());
    final AccountState state = Get.find<AccountController>().state;
    final user = Get.find<PreferenceManager>().getUser();
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "account".tr,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          AccountHeader(
            name: user.name!,
            phone: "+${user.fullPhone!}",
            image: user.image!,
          ),
          DetailsContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuItem(
                  title: "booking_and_subscriptions".tr,
                  onTap: () {},
                ),
                MenuItem(
                  title: "store_orders".tr,
                  onTap: () {},
                ),
                MenuItem(
                  title: "favorites".tr,
                  onTap: () {},
                ),
                MenuItem(
                  title: "my_address".tr,
                  onTap: () => Get.toNamed(Routes.MY_ADDRESSES),
                ),
                MenuItem(
                  title: "settings".tr,
                  onTap: () => Get.toNamed(Routes.SETTINGS),
                ),
                MenuItem(
                  title: "rules_and_condition".tr,
                  onTap: () => Get.toNamed(Routes.STATIC_CONTENT, arguments: "rules_and_condition"),
                ),
                MenuItem(
                  title: "contact_us".tr,
                  onTap: () => Get.toNamed(Routes.CONTACT_US),
                ),
                MenuItem(
                  title: "privacy_policy".tr,
                  hasDivider: false,
                  onTap: () => Get.toNamed(Routes.STATIC_CONTENT, arguments: "privacy_policy"),
                ),
              ],
            ),
          ).marginSymmetric(vertical: 16),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/logout.svg"),
                SizedBox(width: 8),
                AppText(
                  text: "logout".tr,
                  color: AppColors.red,
                )
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
