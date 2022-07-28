import 'package:flutter/material.dart';

import 'home_service.dart';
import 'package:get/get.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SplashController
/// uses the SplashService to store and retrieve user settings.
class HomeController extends GetxController {
  // HomeController();

  // // Make SplashService a private variable so it is not used directly.
  // final HomeService _homeService;

  static HomeController get to => Get.find();

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }
}
