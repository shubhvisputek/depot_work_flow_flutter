import 'dart:async';

import 'package:depotworkflow/src/splash_screen/splash_service.dart';
import 'package:flutter/material.dart';

import 'package:depotworkflow/src/login/login_view.dart';
import 'splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  static const routeName = '/splash';

  // @override
  // final SplashController controller =
  //     Get.put(SplashController(SplashService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(SplashService()),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/process_logo.png',
                    width: controller.animation.value * 300,
                    height: controller.animation.value * 300,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
