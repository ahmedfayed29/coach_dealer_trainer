import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/home/widgets/book_item.dart';
import 'package:coach/features/home/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/networking/network_state_enum.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final HomeState state = Get.find<HomeController>().state;

    return Scaffold(
      appBar: HomeAppBar(),
      body: Obx(() {
        if (state.networkState.value == NetworkState.LOADING) {
          return AppLoading();
        }
        if (state.todaySession.isEmpty) {
          return Center(
            child: AppText(
              text: 'no_bookings'.tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          );
        }
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
          children: [
            AppText(
              text: 'todays_bookings'.tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.h),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => BookItem(
                      item: state.todaySession[index],
                    ),
                separatorBuilder: (_, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount: state.todaySession.length)
          ],
        );
      }),
    );
  }
}
