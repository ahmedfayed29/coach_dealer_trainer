import 'package:coach/features/auth/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/network_state_enum.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
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
                text: "create_account".tr,
                fontSize: 20.h,
                fontWeight: FontWeight.w700,
              ),
              AppText(
                text: "register_subtitle".tr,
                fontSize: 16.h,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
              SizedBox(height: 31.h),
              AppTextField(
                label: "name".tr,
                hint: "name_hint".tr,
                onChanged: controller.updateName,
                errorText: controller.state.errorName.value,
              ),
              AppTextField(
                label: "phone_number".tr,
                hint: "000 000 000",
                onChanged: controller.updatePhone,
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
                errorText: controller.state.errorPhone.value,
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 18.h),
              AppButton(
                title: "verify".tr,
                onTap: () => controller.register(),
                loading: controller.state.networkState.value == NetworkState.LOADING,
              ),
              SizedBox(height: 31.h),
              GestureDetector(
                onTap: () => Get.back(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "${"already_have_account".tr} ",
                      fontWeight: FontWeight.w300,
                    ),
                    AppText(
                      text: "login".tr,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ).marginSymmetric(horizontal: 20.w),
        );
      }),
    );
  }
}
