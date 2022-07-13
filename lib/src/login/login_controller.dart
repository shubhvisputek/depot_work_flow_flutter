import 'package:flutter/material.dart';

import 'login_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SplashController
/// uses the SplashService to store and retrieve user settings.
class LoginController with ChangeNotifier {
  LoginController(this._loginService);

  // Make SplashService a private variable so it is not used directly.
  final LoginService _loginService;
}
