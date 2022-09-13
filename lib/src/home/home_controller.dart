import 'package:flutter/material.dart';

import '../routes/app_pages.dart';
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

  var linkToTicketBtnSwitch = false.obs;

  int? groupValue = 0;

  final TextEditingController searchController = TextEditingController();

  final TextEditingController poController = TextEditingController();

  final TextEditingController ticketController = TextEditingController();

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  void onSegmentTapped(int? value) {
    groupValue = value;
    update();
  }

  void onSearchSubmitTapped() {
    if (searchController.text.isNotEmpty) {
      //Process Data
      Get.back();
    } else {
      Get.snackbar("Validation Error", "Enter data into search field",
          backgroundColor: Colors.grey);
    }
  }

  void onLinkToTicketSubmitTapped() {
    if (poController.text.isNotEmpty && ticketController.text.isNotEmpty) {
      Get.back();
      Get.toNamed(Routes.LINK_TO_TICKET);
    } else {
      Get.snackbar("Validation Error", "Enter data into all field",
          backgroundColor: Colors.grey);
    }
  }

  void onAddToNewTicketTapped() {
    Get.back();
    Get.toNamed(Routes.LINK_TO_TICKET);
  }

  void onLinkToTicketBtnSwitch(bool value) {
    linkToTicketBtnSwitch.value = value;
    update();
  }
}
