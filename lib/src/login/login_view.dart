
import 'dart:async';

import 'package:flutter/material.dart';

import 'login_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../sample_feature/sample_item_list_view.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return LoginScreen();

    //   const Scaffold(
    //   body: Center(
    //     child: Image(
    //       width: 256.0,
    //       height: 256.0,
    //       image: AssetImage(
    //         'assets/images/aurus_pay_logo.png',
    //       ),
    //     ),
    //   ),
    // );
  }
}



const users = const {
  'Aurus': 'Talent_123',
  'svispute@aurusinc.com': 'Talent_123',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      hideForgotPasswordButton: true,
      hideProvidersTitle: true,

      // title: 'Aurus',
      logo: AssetImage('assets/images/aurus_pay_logo.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed(SampleItemListView.routeName);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
