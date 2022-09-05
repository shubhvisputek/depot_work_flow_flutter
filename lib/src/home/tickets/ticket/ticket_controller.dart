import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    //addScrollListenerWithTimer();
    super.onInit();
  }

  void addScrollListenerWithTimer() {
    scroll_controller.addListener(() {
      if (timer != null) {
        timer!.cancel();
        timer = Timer(Duration(milliseconds: 300), () {
          timer = null;
          update();
        });
      } else {
        timer = Timer(Duration(milliseconds: 300), () {
          timer = null;
          update();
        });
      }
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
    update();
  }

  void onAddItemTapped(String data) {
    items.add(data);
    update();
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
