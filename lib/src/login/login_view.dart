import 'dart:async';

import 'package:depotworkflow/src/home/home_view.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'login_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../sample_feature/sample_item_list_view.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.

const users = {
  'Aurus': 'Talent_123',
  'svispute@aurusinc.com': 'Talent_123',
};

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  // @override
  // Widget build(BuildContext context) {
  //   return LoginScreen();
  // }

  final TextEditingController nameController =
      TextEditingController(text: "svispute@aurusinc.com");
  final TextEditingController passwordController =
      TextEditingController(text: "Talent_123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            width: 256.0,
            height: 256.0,
            image: AssetImage(
              'assets/images/aurus_pay_logo.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 5),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 5, 50, 30),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (!users.containsKey(nameController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User not exists')));
                }
                if (users[nameController.text] != passwordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password does not match')));
                }
                Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeView.routeName,
                  (Route<dynamic> route) => false,
                );
                // Navigator.of(context).pushReplacementNamed(SettingsView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
        Navigator.of(context)
            .pushReplacementNamed(SampleItemListView.routeName);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
