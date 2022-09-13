import 'link_to_ticket_controller.dart';

import 'package:get/get.dart';

class LinkToTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinkToTicketBindingController>(
        () => LinkToTicketBindingController());
  }
}
