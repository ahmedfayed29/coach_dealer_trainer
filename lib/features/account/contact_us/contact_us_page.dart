import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/utils/url_launcher_util.dart';
import 'contact_us_controller.dart';
import 'contact_us_state.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController controller = Get.find<ContactUsController>();
    final ContactUsState state = Get.find<ContactUsController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "contact_us".tr,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (state.networkState.value == NetworkState.LOADING) {
          return AppLoading();
        } else if (state.networkState.value == NetworkState.ERROR) {
          return Center(
            child: AppText(
              text: "something_went_wrong".tr,
              color: AppColors.red,
            ),
          );
        }
        return Obx(() {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              AppText(
                text: "contact_us_desc".tr,
                fontSize: 22,
                maxLines: 3,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: AppColors.primaryColor,
              ).paddingOnly(top: 10, bottom: 20),
              AppTextField(
                label: "name".tr,
                hint: "name_hint".tr,
                onChanged: controller.updateName,
                errorText: controller.state.errorName.value,
              ),
              AppTextField(
                label: "email".tr,
                hint: "email_hint".tr,
                textInputType: TextInputType.emailAddress,
                onChanged: controller.updateEmail,
                errorText: controller.state.errorEmail.value,
              ),
              AppTextField(
                label: "contact_us_field".tr,
                hint: "contact_us_field_hint".tr,
                onChanged: controller.updateMessage,
                errorText: controller.state.errorMessage.value,
                maxLines: 3,
              ),
              AppButton(title: "send".tr, onTap: () => controller.sendContactUs()).marginSymmetric(vertical: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.secondaryDividerColor,
                      thickness: 0.5,
                    ),
                  ),
                  AppText(
                    text: "or".tr,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryDividerColor,
                  ).paddingSymmetric(horizontal: 10),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.secondaryDividerColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => launchUrlOrPhone(state.phoneNumber.value),
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor.shade500,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/contact_us_phone.svg"),
                      SizedBox(width: 10),
                      AppText(
                        text: state.phoneNumber.value,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset("assets/icons/x.svg"),
                    onTap: () => launchUrlOrPhone(state.xLink.value),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      "assets/icons/insta.svg",
                      height: 45,
                      width: 45,
                    ),
                    onTap: () => launchUrlOrPhone(state.instagramLink.value),
                  ).marginSymmetric(horizontal: 24),
                  GestureDetector(
                    child: SvgPicture.asset("assets/icons/tiktok.svg"),
                    onTap: () => launchUrlOrPhone(state.tikTokLink.value),
                  ),
                ],
              )
            ],
          );
        });
      }),
    );
  }
}
