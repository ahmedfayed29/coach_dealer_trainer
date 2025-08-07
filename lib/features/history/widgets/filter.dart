import 'package:get/get.dart';

import '../../../../art_core/art_core.dart';

void showSelectFilter<T>(List<String> data, Function(String value) onSelectFilter) {
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
                  onSelectFilter(data[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(data[index].image!),
                    AppText(
                      text: data[index].tr,
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length);
      });
}
