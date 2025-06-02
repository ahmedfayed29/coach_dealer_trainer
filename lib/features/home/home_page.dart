import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/home/widgets/coach_item.dart';
import 'package:coach/features/home/widgets/home_app_bar.dart';
import 'package:coach/features/home/widgets/home_club_item.dart';
import 'package:coach/features/home/widgets/home_store_item.dart';
import 'package:coach/features/home/widgets/title_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../art_core/widgets/image_slider.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final HomeState state = Get.find<HomeController>().state;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: HomeAppBar(),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          children: [
            ImageSlider(
              height: 140.h,
              images: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEXPRpW90TFYiy3FA3TFbI5xoC6SMrOXzSBw&s",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhS7qltUs0In2W3lbZA4CoWjHY_yc3jVSXGA&s",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhS7qltUs0In2W3lbZA4CoWjHY_yc3jVSXGA&s"
              ],
            ),
            AppTextField(
              hint: "search".tr,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: AppColors.textSecondary,
              ),
            ).marginSymmetric(vertical: 16.h),
            TitleItem(
              title: "store_offers".tr,
              onTap: () {},
            ),
            SizedBox(
              height: 220.h,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => HomeStoreItem(
                        isFavorite: false,
                        imageUrl: "https://m.media-amazon.com/images/I/61fpX07rWuL.jpg",
                        name: "PVC Yoga Mat With Carrying Bag - 10 MM - Green",
                        price: "4.000 KD",
                        offerPrice: "3.000 KD",
                      )),
            ),
            TitleItem(
              title: "new_coaches".tr,
              onTap: () {},
            ).marginOnly(top: 16.h),
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CoachItem(
                  imageUrl:
                      "https://img.freepik.com/free-photo/fit-cartoon-character-training_23-2151149055.jpg",
                  name: "Mohamed Ahmed",
                  description: "Gym - Fitness - kickboxing",
                  rate: 4.0,
                ),
              ),
            ),
            TitleItem(
              title: "new_clubs".tr,
              onTap: () {},
            ).marginOnly(top: 16.h),
            SizedBox(
              height: 215.h,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => HomeClubItem(
                  imageUrl:
                      "https://artimg.gympik.com/articles/wp-content/uploads/2019/10/Featured1.jpg",
                  name: "Yarmouk Sports Club",
                  description: "Padel - Tennis - Swimming - Gym",
                  rate: 4.0,
                  location: 'Hawalli',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
