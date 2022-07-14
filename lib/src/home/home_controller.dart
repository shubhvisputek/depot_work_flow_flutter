import 'package:flutter/material.dart';

import 'home_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SplashController
/// uses the SplashService to store and retrieve user settings.
class HomeController with ChangeNotifier {
  HomeController(this._homeService);

  // Make SplashService a private variable so it is not used directly.
  final HomeService _homeService;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    // setState(() {
      selectedIndex = index;
    // });
    notifyListeners();
  }
}
