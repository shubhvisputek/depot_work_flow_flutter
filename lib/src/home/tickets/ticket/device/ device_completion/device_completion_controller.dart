import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceCompletionController extends GetxController {
  static DeviceCompletionController get to => Get.find();

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
    // TODO
    update();
  }
}
