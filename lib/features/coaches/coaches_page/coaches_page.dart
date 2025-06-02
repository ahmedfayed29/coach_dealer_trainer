import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/home/widgets/coach_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../art_core/widgets/category_item.dart';
import 'coaches_controller.dart';
import 'coaches_state.dart';

class CoachesPage extends StatelessWidget {
  const CoachesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CoachesController controller = Get.put(CoachesController());
    final CoachesState state = Get.find<CoachesController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "coaches".tr,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    name: "all_coaches".tr,
                    isSelected: index == 0,
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemBuilder: (context, index) => CoachItem(
                imageUrl:
                    "https://img.freepik.com/free-photo/fit-cartoon-character-training_23-2151149055.jpg",
                name: "Mohamed Ahmed",
                description: "Gym - Fitness - kickboxing",
                rate: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
