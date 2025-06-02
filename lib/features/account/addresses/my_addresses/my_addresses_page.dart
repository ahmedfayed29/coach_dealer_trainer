import 'package:coach/art_core/art_core.dart';
import 'package:coach/features/account/addresses/my_addresses/widgets/address_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import 'my_addresses_controller.dart';
import 'my_addresses_state.dart';

class MyAddressesPage extends StatelessWidget {
  const MyAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyAddressesController controller = Get.put(MyAddressesController());
    final MyAddressesState state = Get.find<MyAddressesController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "my_address".tr,
        ),
        centerTitle: true,
      ),
      floatingActionButton: AppButton(
        title: "+ ${"add_new_address".tr}",
        onTap: () => Get.toNamed(Routes.ADD_ADDRESS),
        horizontalPadding: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
          itemCount: 20,
          padding: EdgeInsets.only(top: 10, bottom: 100.h),
          itemBuilder: (context, index) => AddressItem(
                title: "kuwait , Huwalli",
                description: "St. 14 - block 1 - Building no. 3",
              )),
    );
  }
}
