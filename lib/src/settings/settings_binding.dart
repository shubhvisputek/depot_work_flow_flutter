import 'settings_service.dart';
import 'settings_controller.dart';

import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
        () => SettingsController(SettingsService()));
  }
}
