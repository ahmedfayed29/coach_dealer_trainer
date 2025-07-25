import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/network_state_enum.dart';
import 'otp_controller.dart';

class OTPPage extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;
  final bool isRegister;

  const OTPPage({super.key, required this.phoneNumber, required this.countryCode, required this.isRegister});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OTPController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
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
              text: "phone_verification".tr,
              fontSize: 20.h,
              fontWeight: FontWeight.w700,
            ),
            AppText(
              text: "enter_otp_code".tr,
              fontSize: 16.h,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w300,
              height: 1.5,
            ),
            AppText(
              text: "+$countryCode$phoneNumber",
              fontSize: 16.h,
              color: AppColors.primaryColor,
              height: 1.5,
            ),
            SizedBox(height: 8.h),
            PinCodeTextField(
              length: 4,
              obscureText: false,
              autoDismissKeyboard: true,
              animationType: AnimationType.fade,
              textStyle: const TextStyle(
                fontSize: 24,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 70.h,
                fieldWidth: 70.h,
                activeFillColor: AppColors.primaryColor.withOpacity(0.2),
                inactiveFillColor: AppColors.white,
                selectedFillColor: AppColors.primaryColor.withOpacity(0.2),
                inactiveColor: AppColors.textPrimary.withOpacity(0.2),
                activeColor: AppColors.primaryColor.withOpacity(0.2),
                selectedColor: AppColors.primaryColor.withOpacity(0.2),
                borderWidth: 1,
                inactiveBorderWidth: 1,
              ),
              cursorColor: AppColors.primaryColor,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (v) {
                controller.sendOTP(phone: phoneNumber, countryCode: countryCode, isRegister: isRegister);
              },
              onChanged: controller.updateOTP,
              appContext: context,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18.h),
            Obx(() {
              return AppButton(
                title: "confirm".tr,
                onTap: () => controller.sendOTP(phone: phoneNumber, countryCode: countryCode, isRegister: isRegister),
                loading: controller.state.networkState.value == NetworkState.LOADING,
              );
            }),
            SizedBox(height: 31.h),
            GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "${"didnt_receive_code".tr} ",
                    fontWeight: FontWeight.w300,
                  ),
                  AppText(
                    text: "resend_code".tr,
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
