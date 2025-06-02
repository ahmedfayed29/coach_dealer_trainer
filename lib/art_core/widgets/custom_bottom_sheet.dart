import 'package:coach/art_core/art_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void showCustomSelectBottomSheet<T>(List<String> data, Function onSelectItem, {String? emptyText}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: Get.context!,
      builder: (context) {
        if (data.isEmpty) {
          return Column(
            children: [
              SvgPicture.asset("assets/images/empty_view_image.svg"),
              AppText(text: emptyText ?? ""),
            ],
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    onSelectItem(index);
                  },
                  child: AppText(
                    text: data[index],
                  )),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data.length);
        }
      });
}

void showCustomBottomSheet<T>({required Widget child}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: Get.context!,
      builder: (context) {
        return child;
      });
}
