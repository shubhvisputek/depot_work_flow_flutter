import 'tickets_controller.dart';

import 'package:get/get.dart';

class TicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsController>(() => TicketsController());
  }
}
