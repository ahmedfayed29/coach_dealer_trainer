import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../art_core/art_core.dart';
import 'add_address_controller.dart';
import 'add_address_state.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddAddressController controller = Get.put(AddAddressController());
    final AddAddressState state = Get.find<AddAddressController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "add_new_address".tr,
        ),
        centerTitle: true,
      ),
      floatingActionButton: AppButton(
        title: "add".tr,
        onTap: () {},
        horizontalPadding: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          AppTextField(
            label: "location".tr,
            hint: "location_hint".tr,
            readOnly: true,
            suffixIcon: SvgPicture.asset("assets/icons/location.svg").marginAll(15),
            onTap: () {},
          ),
          AppTextField(
            label: "city".tr,
            hint: "select_city".tr,
            isSelectable: true,
            readOnly: true,
            onTap: () {},
          ),
          AppTextField(
            label: "region".tr,
            hint: "select_region".tr,
            isSelectable: true,
            readOnly: true,
            onTap: () {},
          ),
          AppTextField(
            label: "block".tr,
            hint: "block_hint".tr,
          ),
          AppTextField(
            label: "street_name".tr,
            hint: "street_name_hint".tr,
          ),
          AppTextField(
            label: "building_no".tr,
            hint: "building_number_hint".tr,
          ),
        ],
      ),
    );
  }
}
