import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/auth/complete_register/widgets/picked_image.dart';
import 'package:coach/features/auth/complete_register/widgets/profile_image.dart';
import 'package:coach/features/auth/complete_register/widgets/select_sport.dart';
import 'package:coach/features/auth/complete_register/widgets/select_week_day.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/networking/network_state_enum.dart';
import 'complete_register_logic.dart';
import 'complete_register_state.dart';

class CompleteRegisterPage extends StatefulWidget {
  final String phone, countryCode;
  final bool isEdit;

  const CompleteRegisterPage(
      {super.key,
      required this.phone,
      // required this.name,
      required this.countryCode,
      required this.isEdit});

  @override
  State<CompleteRegisterPage> createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  @override
  void initState() {
    final logic = Get.find<CompleteRegisterLogic>();
    // if (isEdit) {
    logic.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CompleteRegisterState state = Get.find<CompleteRegisterLogic>().state;
    final logic = Get.find<CompleteRegisterLogic>();

    return Scaffold(
      appBar: AppBar(
        title: AppText(text: widget.isEdit ? "edit_profile".tr : "complete_profile".tr),
        centerTitle: true,
      ),
      body: Obx(() {
        // else if (state.networkState.value == NetworkState.ERROR) {
        //   return Center(
        //     child: AppText(
        //       text: state.errorMessage.value,
        //       color: AppColors.red,
        //     ),
        //   );
        // }
        return Form(
          key: state.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
            children: [
              Center(
                child: CompleteProfileImage(),
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "name".tr,
                hint: 'enter_your_name'.tr,
                controller: TextEditingController(text: state.name.value),
                onChanged: logic.updateName,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "bio".tr,
                hint: "add_your_bio".tr,
                controller: TextEditingController(text: state.bio.value),
                maxLines: 3,
                textInputType: TextInputType.multiline,
                onChanged: logic.updateBio,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "trainees_numbers".tr,
                hint: "enter_number".tr,
                controller: TextEditingController(text: state.traineeNumbers.value),
                onChanged: logic.updateTraineeNumbers,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "sessions_numbers".tr,
                hint: "enter_number".tr,
                controller: TextEditingController(text: state.sessionNumbers.value),
                onChanged: logic.updateSessionNumbers,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "experience_years".tr,
                hint: "enter_number".tr,
                controller: TextEditingController(text: state.experienceYears.value),
                onChanged: logic.updateExperienceYears,
              ),
              ListView.builder(
                  itemCount: state.experiences.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "experience_in".tr,
                                fontSize: 16.sp,
                              ),
                              if (state.experiences.length > 1)
                                InkWell(
                                  onTap: () => logic.removeExperience(index: index),
                                  child: Icon(
                                    Icons.delete_sweep_outlined,
                                    color: AppColors.red,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            spacing: 12.w,
                            children: [
                              Expanded(
                                  child: AppTextField(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "empty_field".tr;
                                  }
                                  return null;
                                },
                                hint: "select_sport".tr,
                                readOnly: true,
                                controller: state.experiences[index].controller,
                                onTap: () {
                                  showSelectSportBottomSheet(state.sports.value, (position) {
                                    logic.updateExperienceSport(
                                        position: index, selectedIndex: position);
                                    Get.back();
                                  });
                                },
                                // initialText: state.experiences[index].sport.value,
                                onChanged: logic.updateExperienceYears,
                              )),
                              Expanded(
                                  child: AppTextField(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "empty_field".tr;
                                  }
                                  return null;
                                },
                                hint: "enter_session_fees".tr,
                                initialText: state.experiences[index].sessionFee.value,
                                onChanged: (value) =>
                                    logic.updateExperienceSportFee(position: index, value: value),
                              )),
                            ],
                          ),
                        ],
                      )),
              SizedBox(height: 12.h),
              InkWell(
                onTap: logic.addExperience,
                child: AppText(
                  text: "add_sport".tr,
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "working_days".tr,
                hint: "select_working_days".tr,
                isSelectable: true,
                controller: state.weekDaysController,
                readOnly: true,
                onTap: () {
                  showSelectWeekDayBottomSheet(state.weekDays.value, (position) {
                    logic.addWeekDay(index: position);
                    // Get.back();
                  });
                },
                // onChanged: logic.updateWorkingDays,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "empty_field".tr;
                  }
                  return null;
                },
                label: "class_period_in_minutes".tr,
                hint: "enter_class_period_in_minutes".tr,
                controller: TextEditingController(text: state.classPeriod.value),
                onChanged: logic.updateClassPeriod,
              ),
              ListView.builder(
                  itemCount: state.periodShift.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          AppText(
                            text: "first_shift_hours_period".tr,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            spacing: 12.w,
                            children: [
                              Expanded(
                                  child: AppTextField(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      final now = DateTime.now();
                                      final dateTime = DateTime(
                                          now.year, now.month, now.day, value.hour, value.minute);
                                      state.periodShift[index].from.value =
                                          DateFormat('HH:mm').format(dateTime);
                                      state.periodShift[index].fromController.text =
                                          DateFormat('HH:mm').format(dateTime);
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "empty_field".tr;
                                  }
                                  return null;
                                },
                                suffixIcon: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/clock.svg",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                                hint: "from".tr,
                                controller: state.periodShift[index].fromController,
                                // initialText: state.periodShift[index].from.value,
                                onChanged: (v) => state.periodShift[index].from.value = v,
                              )),
                              Expanded(
                                  child: AppTextField(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      final now = DateTime.now();
                                      final dateTime = DateTime(
                                          now.year, now.month, now.day, value.hour, value.minute);

                                      state.periodShift[index].to.value =
                                          DateFormat('HH:mm').format(dateTime);
                                      state.periodShift[index].toController.text =
                                          DateFormat('HH:mm').format(dateTime);
                                    }
                                  });
                                },
                                suffixIcon: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/clock.svg",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "empty_field".tr;
                                  }
                                  return null;
                                },
                                hint: "to".tr,
                                controller: state.periodShift[index].toController,
                                // initialText: state.periodShift[index].to.value,
                                onChanged: (v) => state.periodShift[index].to.value = v,
                              )),
                            ],
                          ),
                          SizedBox(height: 12.h),
                        ],
                      )),
              InkWell(
                onTap: logic.addNewPeriodShift,
                child: AppText(
                  text: "add_shift".tr,
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              AppText(
                text: "gallery_images".tr,
                fontSize: 16.sp,
                color: AppColors.textPrimary,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                spacing: 12.w,
                children: [
                  PickedGalleryImage(
                    onTap: () => logic.addGalleryImage(),
                    index: -1,
                    isEmpty: true,
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 92.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (_, index) => PickedGalleryImage(
                                  onTap: () => logic.removeGalleryImage(index),
                                  index: index,
                                  isEmpty: false,
                                ),
                            separatorBuilder: (_, index) => SizedBox(width: 12.w),
                            itemCount: state.gallery.length)),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Obx(() {
                return AppButton(
                  title: 'save'.tr,
                  loading: state.networkState.value == NetworkState.LOADING,
                  onTap: () =>
                      logic.completeProfile(phone: widget.phone, countryCode: widget.countryCode),
                );
              }),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        );
      }),
    );
  }
}
