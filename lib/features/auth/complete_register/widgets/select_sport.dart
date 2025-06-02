import 'package:get/get.dart';

import '../../../../art_core/art_core.dart';
import '../../../../core/networking/responses/sports/sports_model.dart';

void showSelectSportBottomSheet<T>(List<SportsModel> data, Function onSelectItem) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: Get.context!,
      builder: (context) {
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TextButton(
                onPressed: () {
                  onSelectItem(index);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(data[index].image!),
                    AppText(
                      text: "${data[index].name}",
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length);
      });
}
