import 'dart:io';

import 'package:coach/art_core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../complete_register_logic.dart';

class CompleteProfileImage extends StatelessWidget {
  const CompleteProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CompleteRegisterLogic>();
    return SizedBox(
      height: 150.h,
      child: Stack(
        children: [
          InkWell(
            onTap: () => logic.updateImage(),
            child: Container(
              height: 140.h,
              width: 140.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textShade.withOpacity(.1),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                  image: DecorationImage(
                      image: FileImage(
                        File(logic.state.image.value),
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: SvgPicture.asset("assets/icons/edit.svg"),
          ),
        ],
      ),
    );
  }
}
