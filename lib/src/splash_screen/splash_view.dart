import 'package:flutter/material.dart';

import 'splash_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          width: 256.0,
          height: 256.0,
          image: AssetImage(
            'assets/images/process_logo.png',
          ),
        ),
      ),
    );
  }
}
