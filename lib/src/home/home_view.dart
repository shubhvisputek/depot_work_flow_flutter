import 'dart:async';

import 'package:depotworkflow/src/home/home_controller.dart';
import 'package:depotworkflow/src/home/home_service.dart';
import 'package:depotworkflow/src/home/inventory/inventory_view.dart';
import 'package:depotworkflow/src/home/tickets/tickets_view.dart';
import 'package:depotworkflow/src/login/login_view.dart';
import 'package:depotworkflow/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  // @override
  // final HomeController controller =

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          title: controller.selectedIndex.value == 0
              ? const Text("Tickets")
              : const Text("Inventory"),
          // leading: IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () {
          //     AuthService.to.logout();
          //     Get.offAllNamed(LoginView.routeName);
          //   },
          // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          // child: Obx(() => Text("Clicks: ${controller.selectedIndex}")),
          // child: Text("Page ${HomeController.to.selectedIndex}"), //New
          child: controller.selectedIndex.value == 0
              ? TicketsView()
              : InventoryView(),
        ),
        bottomNavigationBar: Container(
          // padding: EdgeInsets.all(0.0),
          // color: Color(0xFF313131).withOpacity(0.7),
          //   height: 50,
          //   width: double.maxFinite,
          child: Row(
            // alignment: Alignment.center,
            // fit: StackFit.passthrough,

            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(195, 48),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    backgroundColor: controller.selectedIndex.value == 0
                        ? MaterialStateProperty.all(Colors.blue)
                        : MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () => controller.onItemTapped(0),
                  child: const Text("Tickets"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(195, 48),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    backgroundColor: controller.selectedIndex.value == 1
                        ? MaterialStateProperty.all(Colors.blue)
                        : MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () => controller.onItemTapped(1),
                  child: const Text("Inventory"),
                ),
              ),
            ],
            // ),
          ),
        ),
      ),
    );
  }
}
