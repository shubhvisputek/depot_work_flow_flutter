import 'device_completion_controller.dart';

import 'package:get/get.dart';

class DeviceCompletionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceCompletionController>(() => DeviceCompletionController());
  }
}
