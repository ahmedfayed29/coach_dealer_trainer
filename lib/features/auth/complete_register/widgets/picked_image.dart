import 'dart:io';

import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../complete_register_logic.dart';

class PickedGalleryImage extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final bool isEmpty;

  const PickedGalleryImage(
      {super.key, required this.onTap, required this.index, this.isEmpty = false});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CompleteRegisterLogic>();
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 92.w,
        height: 92.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.secondaryBorderColor),
            image: isEmpty
                ? null
                : DecorationImage(
                    image: !logic.state.gallery[index].startsWith("http")
                        ? FileImage(File(logic.state.gallery[index]))
                        : NetworkImage(logic.state.gallery[index]),
                    fit: BoxFit.cover)),
        child: isEmpty
            ? Column(
                spacing: 6.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.textSecondary,
                  ),
                  AppText(
                    text: 'add_images'.tr,
                    color: AppColors.textSecondary,
                    fontSize: 12.sp,
                  )
                ],
              )
            : Icon(
                Icons.delete_sweep_outlined,
                size: 40,
              ),
      ),
    );
  }
}
