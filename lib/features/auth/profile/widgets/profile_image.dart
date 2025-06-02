import 'package:coach/art_core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  final String image;

  const ProfileImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        children: [
          Container(
            height: 140.h,
            width: 140.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                image: DecorationImage(image: NetworkImage(image))),
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
