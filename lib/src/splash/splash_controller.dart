import 'dart:async';

import 'package:flutter/material.dart';

import 'package:async/async.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationInitilization();
  }

  final memo = AsyncMemoizer<void>();
  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  Future<void> _initFunction() async {
    final t = Timer.periodic(
      Duration(milliseconds: 500),
      (t) => {},
    );
    //simulate some long running operation
    await Future.delayed(Duration(seconds: 2));
    //cancel the timer once we are done
    t.cancel();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
}
