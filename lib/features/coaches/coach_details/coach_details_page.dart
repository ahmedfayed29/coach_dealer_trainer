import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/coaches/coach_details/widgets/coach_details_header.dart';
import 'package:coach/features/coaches/coach_details/widgets/details_item.dart';
import 'package:coach/features/coaches/coach_details/widgets/major_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_pages.dart';
import 'coach_details_controller.dart';
import 'coach_details_state.dart';

class CoachDetailsPage extends StatelessWidget {
  const CoachDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CoachDetailsController controller = Get.put(CoachDetailsController());
    final CoachDetailsState state = Get.find<CoachDetailsController>().state;
    final List<String> categories = [
      'Gym',
      'Fitness',
      'Kickboxing',
      'Kickboxing',
      'Physical rehabilitation',
      // Add more if needed
    ];
    return Scaffold(
      appBar: CoachDetailsHeader(
        image:
            "https://img.freepik.com/free-photo/fit-cartoon-character-training_23-2151149055.jpg",
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          AppText(
            text: "Mohamed Ahmed",
            fontSize: 20,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
          ).paddingOnly(top: 14, bottom: 5),
          Center(
            child: CustomRatingBar(rating: 3.5, ignoreGestures: true),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/location.svg"),
              SizedBox(width: 5),
              AppText(
                text: "Kuwait City",
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ],
          ).marginSymmetric(vertical: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: categories.map((title) {
              return MajorItem(title: title);
            }).toList(),
          ).paddingSymmetric(horizontal: 10),
          Card(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsItem(title: "25", subTitle: "trainees".tr),
                CustomVerticalDivider(),
                DetailsItem(title: "635", subTitle: "sessions".tr),
                CustomVerticalDivider(),
                DetailsItem(title: "10Y", subTitle: "exp".tr),
              ],
            ).marginSymmetric(horizontal: 30, vertical: 16),
          ),
          AppButton(title: "book_class".tr, onTap: () => Get.toNamed(Routes.BOOK_CLASS)),
          AppText(
            text: "bio".tr,
            fontSize: 20,
          ).marginOnly(top: 16.h),
          DetailsContainer(
            child: AppText(
              text:
                  "A passionate Fitness coach with 5+ years of experience, specializing in enhancing players' skills and performance. Dedicated to providing personalized training for all levels.",
              fontSize: 14,
              maxLines: 200,
              fontWeight: FontWeight.w400,
            ).marginAll(8),
          ),
          AppText(
            text: "gallery".tr,
            fontSize: 20,
          ).marginOnly(top: 16.h),
          SizedBox(
            height: 135.h,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.only(top: 8, bottom: 20),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10.w);
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://www.datocms-assets.com/61076/1707878737-woman-practicing-push-ups-with-trx-straps-in-a-gym-with-trainer.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
