import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/coaches/book_class/widgets/book_coach_item.dart';
import 'package:coach/features/coaches/book_class/widgets/time_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'book_class_controller.dart';
import 'book_class_state.dart';

class BookClassPage extends StatelessWidget {
  const BookClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BookClassController controller = Get.put(BookClassController());
    final BookClassState state = Get.find<BookClassController>().state;

    List<String> times = [
      "10:00 AM",
      "11:00 AM",
      "12:00 PM",
      "1:00 PM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
      "5:00 PM",
    ];

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "book_class".tr,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          BookCoachItem(
            image:
                "https://img.freepik.com/free-photo/fit-cartoon-character-training_23-2151149055.jpg",
            name: "Mohamed Ahmed",
            rating: 4.0,
          ),
          AppTextField(
            label: "class_category".tr,
            hint: "class_category_hint".tr,
            isSelectable: true,
            readOnly: true,
            onTap: () {},
          ),
          AppText(
            text: "select_date".tr,
            fontSize: 16.h,
          ).marginOnly(top: 16.h, bottom: 8.h),
          DetailsContainer(
            height: 280.h,
            child: Theme(
              data: Theme.of(context).copyWith(
                datePickerTheme: DatePickerThemeData(
                  backgroundColor: AppColors.white,
                  todayBorder: BorderSide.none,
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateChanged: (date) {},
              ),
            ),
          ),
          AppText(
            text: "select_time".tr,
            fontSize: 16.h,
          ).marginOnly(top: 16.h, bottom: 8.h),
          DetailsContainer(
            child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.5),
                itemCount: times.length,
                itemBuilder: (BuildContext context, int index) {
                  return TimeItem(
                    time: times[index],
                    isSelected: index == 0,
                    isAvailable: index % 2 == 0,
                    onTap: () {},
                  );
                }),
          ),
          AppButton(title: "confirm_booking".tr, onTap: () {}).marginSymmetric(vertical: 16)
        ],
      ),
    );
  }
}
