import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_address_controller.dart';
import 'edit_address_state.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditAddressController controller = Get.put(EditAddressController());
    final EditAddressState state = Get.find<EditAddressController>().state;

    return Container();
  }
}
