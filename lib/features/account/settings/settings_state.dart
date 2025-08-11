import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SettingsState {
  late RxBool isNotificationsEnabled;
  SettingsState() {
    ///Initialize variables
    isNotificationsEnabled = false.obs;
  }
}
