import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/history/widgets/filter.dart';
import 'package:coach/features/history/widgets/history_app_bar.dart';
import 'package:coach/features/home/widgets/book_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/networking/network_state_enum.dart';
import 'history_controller.dart';
import 'history_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    final HistoryState state = Get.find<HistoryController>().state;

    return Scaffold(
      appBar: HistoryAppBar(),
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
            InkWell(
              onTap: () {
                showSelectFilter(["last_week", "last_month", "last_3_month", "last_year"],
                    (filter) => controller.setFilter(filter));
              },
              child: AppText(
                text: (state.filter.value == "" ? 'see_all' : state.filter.value).tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
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
