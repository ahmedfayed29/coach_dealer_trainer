import 'package:coach/core/networking/responses/countries/country_model.dart';
import 'package:get/get.dart';

import '../art_core.dart';

void showSelectCountryBottomSheet<T>(List<CountryModel> data, Function onSelectItem) {
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
                      text: "+${data[index].countryCode!}",
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length);
      });
}
