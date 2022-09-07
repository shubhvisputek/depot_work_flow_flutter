import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class TicketController extends GetxController {
  static TicketController get to => Get.find();

  var items = [].obs;
  var selectedIndex = 0.obs;

  Timer? timer;
  ScrollController scroll_controller = ScrollController();

  @override
  // TODO: implement initialized
  bool get initialized => super.initialized;

  @override
  void onInit() {
    addScrollListenerWithTimer();
    super.onInit();
  }

  void addScrollListenerWithTimer() {
    scroll_controller.addListener(() {
      //scroll_controller.jumpTo(items.length.toDouble());
      update();
    });
  }

  void onCompletedBtnTapped() {
    // TODO
    update();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;

    Get.toNamed(Routes.DEVICE);

    update();
  }

  void onAddItemTapped(String data) {
    items.add(data);
    if (timer != null) {
      timer!.cancel();
      timer = Timer(Duration(milliseconds: 500), () {
        timer = null;
        update();
      });
    } else {
      timer = Timer(Duration(milliseconds: 500), () {
        timer = null;
        update();
      });
    }
    _scrollDown();
    update();
  }

  // This is what you're looking for!
  void _scrollDown() {
    scroll_controller.jumpTo(scroll_controller.position.maxScrollExtent + 56);
    // scroll_controller.animateTo(
    //   scroll_controller.position.maxScrollExtent,
    //   duration: Duration(seconds: 1),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  void onRemovedItemTapped(int index) {
    items.removeAt(index);
    update();
  }

  String generateRandomNumber(int size) {
    var randomNum = "";
    var rnd = Random();
    for (var i = 0; i < size; i++) {
      randomNum = randomNum + rnd.nextInt(9).toString();
    }
    return randomNum;
  }
}
