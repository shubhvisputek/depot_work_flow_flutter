import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';
import '../services/auth_service.dart';
import '../routes/app_pages.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(Routes.HOME);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(Routes.SETTINGS);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              AuthService.to.logout();
              Get.offAllNamed(LoginView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
