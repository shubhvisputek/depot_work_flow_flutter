import 'dart:async';
import 'dart:math';

import 'package:depotworkflow/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  static DeviceController get to => Get.find();

  var items = [].obs;
  var selectedIndex = 0.obs;

  Timer? timer;
  ScrollController scroll_controller = ScrollController();

  @override
  // TODO: implement initialized
  bool get initialized => super.initialized;

  @override
  void onInit() {
    super.onInit();
  }

  void onNextBtnTapped() {
    Get.toNamed(Routes.DEVICE_COMPLETION);
    update();
  }
}
