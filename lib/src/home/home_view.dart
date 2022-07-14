import 'dart:async';

import 'package:depotworkflow/src/home/home_controller.dart';
import 'package:depotworkflow/src/home/home_service.dart';
import 'package:flutter/material.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  final HomeController controller = HomeController(HomeService());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white30,
            onTap: controller.onItemTapped,
            tabs: [
              Tab(text: "Shubham"),
              Tab(text: "Shubham1"),
            ],
          ),
          body: Center(
            child: Text("Page \(controller.selectedIndex)"), //New
          ),
        ),
      ),
    );
  }
}