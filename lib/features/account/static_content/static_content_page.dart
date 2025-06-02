import 'package:coach/art_core/art_core.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../core/networking/network_state_enum.dart';
import 'static_content_controller.dart';
import 'static_content_state.dart';

class StaticContentPage extends StatelessWidget {
  final String title;

  const StaticContentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final StaticContentController controller = Get.find<StaticContentController>();
    final StaticContentState state = Get.find<StaticContentController>().state;
    controller.getContent(isPrivacyPolicy: title == "privacy_policy");
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: title.tr,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (state.networkState.value == NetworkState.LOADING) {
          return AppLoading();
        } else if (state.networkState.value == NetworkState.ERROR) {
          return Center(
            child: AppText(
              text: "something_went_wrong".tr,
              color: AppColors.red,
            ),
          );
        }

        return DetailsContainer(
          height: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10),
            children: [Html(data: state.content.value)],
          ),
        );
      }).marginOnly(right: 20, left: 20, top: 20, bottom: 40),
    );
  }
}
