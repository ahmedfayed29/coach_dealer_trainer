import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/auth/profile/widgets/profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';
import 'profile_controller.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final ProfileState state = Get.find<ProfileController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "edit_profile".tr,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (state.networkState.value == NetworkState.LOADING) {
          return AppLoading();
        } else if (state.networkState.value == NetworkState.ERROR) {
          return Center(
            child: AppText(
              text: state.errorMessage.value,
              color: AppColors.red,
            ),
          );
        }
        return Form(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              Center(
                child: ProfileImage(
                  image: state.image.value,
                ),
              ),
              AppTextField(
                label: "name".tr,
                initialText: state.name.value,
                onChanged: controller.updateName,
              ),
              AppTextField(
                  label: "phone_number".tr,
                  initialText: state.phone.value,
                  onChanged: controller.updatePhone,
                  // errorText: controller.state.errorPhone.value,
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
                        )),
              AppTextField(
                label: "weight".tr,
                initialText: state.weight.value,
                onChanged: controller.updateWeight,
              ),
              AppTextField(
                label: "tall".tr,
                initialText: state.tall.value,
                onChanged: controller.updateTall,
              ),
              // AppTextField(
              //   label: "gender".tr,
              //   hint: state.gender.value.tr,
              //   isSelectable: true,
              //   readOnly: true,
              //   onTap: () => showCustomSelectBottomSheet(['male'.tr, "female".tr], (index) {
              //     controller.updateGender(index == 0 ? "male" : "female");
              //     Get.back();
              //   }),
              // ),
              AppTextField(
                label: "age".tr,
                initialText: state.age.value,
                onChanged: controller.updateAge,
              ),
              AppTextField(
                label: "health_problems".tr + "if_exists".tr,
                initialText: state.healthProblems.value,
                maxLines: 2,
                onChanged: controller.updateHealthProblems,
              ),
              SizedBox(height: 16),
              AppButton(title: "save_changes".tr, onTap: () => controller.updateProfile()),
            ],
          ),
        );
      }),
    );
  }
}
