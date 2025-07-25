import 'package:coach/features/auth/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/routes/app_pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              text: "login_to_your_account".tr,
              fontSize: 20.h,
              fontWeight: FontWeight.w700,
            ),
            AppText(
              text: "enter_phone_number_to_login".tr,
              fontSize: 16.h,
              color: AppColors.textSecondary,
              height: 1.5,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 31.h),
            Obx(() {
              return AppTextField(
                label: "phone_number".tr,
                hint: "000 000 000",
                onChanged: controller.updatePhone,
                errorText: controller.state.errorPhone.value,
                textInputType: TextInputType.phone,
                prefixIcon: controller.state.countriesNetworkState.value == NetworkState.LOADING
                    ? CupertinoActivityIndicator()
                    : GestureDetector(
                        onTap: () {
                          showSelectCountryBottomSheet(controller.state.countries.value, (index) {
                            controller.updateCountry(controller.state.countries.value[index]);
                            Get.back();
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/ar.svg",
                              height: 24.h,
                              width: 24.h,
                            ),
                            SizedBox(width: 6.w),
                            AppText(
                              text: controller.state.country.value.countryCode!,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ).marginSymmetric(horizontal: 16),
                      ),
              );
            }),
            SizedBox(height: 24.h),
            Obx(() {
              return AppButton(
                title: "login".tr,
                onTap: () => controller.login(),
                loading: controller.state.networkState.value == NetworkState.LOADING,
              );
            }),
            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.REGISTER),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "${"not_have_account".tr} ",
                    fontWeight: FontWeight.w300,
                  ),
                  AppText(
                    text: "create_account".tr,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ).marginSymmetric(horizontal: 20.w),
      ),
    );
  }
}
