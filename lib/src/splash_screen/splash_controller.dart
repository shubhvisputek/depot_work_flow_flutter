import 'package:flutter/material.dart';

import 'splash_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SplashController
/// uses the SplashService to store and retrieve user settings.
class SplashController with ChangeNotifier {
  SplashController(this._splashService);

  // Make SplashService a private variable so it is not used directly.
  final SplashService _splashService;

  
}
