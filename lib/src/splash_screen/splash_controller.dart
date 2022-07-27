import 'dart:async';

import 'package:flutter/material.dart';

import '../login/login_view.dart';
import 'splash_service.dart';
import 'package:get/get.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SplashController
/// uses the SplashService to store and retrieve user settings.
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SplashController(this._splashService);

  // Make SplashService a private variable so it is not used directly.
  final SplashService _splashService;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();

    Timer(Duration(seconds: 2), () => Get.to(LoginView()));
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
