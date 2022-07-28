import 'dart:async';

import 'package:depotworkflow/src/home/home_view.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.

const users = {
  'Aurus': 'Talent_123',
  'svispute@aurusinc.com': 'Talent_123',
};

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

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

                Get.offAllNamed(HomeView.routeName);

                // Navigator.of(context).pushNamedAndRemoveUntil(
                //   HomeView.routeName,
                //   (Route<dynamic> route) => false,
                // );
                // Navigator.of(context).pushReplacementNamed(SettingsView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
