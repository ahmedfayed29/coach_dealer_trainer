import 'package:coach/features/notifications/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../art_core/widgets/text/app_text.dart';
import 'notifications_controller.dart';
import 'notifications_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsController controller = Get.put(NotificationsController());
    final NotificationsState state = Get.find<NotificationsController>().state;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "notifications".tr,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => NotificationItem(
                title: "New Notification",
                date: "3 Hours Ago",
                description: "Your Book no. #564633 Done Successfully",
              )),
    );
  }
}
