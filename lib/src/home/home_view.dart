import 'dart:async';

import 'package:depotworkflow/src/home/home_controller.dart';
import 'package:depotworkflow/src/home/home_service.dart';
import 'package:depotworkflow/src/home/inventory/inventory_view.dart';
import 'package:depotworkflow/src/home/tickets/tickets_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  // @override
  // final HomeController controller =

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Demo'),
      ),
      body: Center(
        // child: Obx(() => Text("Clicks: ${controller.selectedIndex}")),
        child: Text("Page ${HomeController.to.selectedIndex}"), //New
        // child: controller.selectedIndex.value == 0
        //     ? TicketsView()
        //     : InventoryView(),
      ),
      bottomNavigationBar: Row(
        // alignment: Alignment.center,
        // fit: StackFit.passthrough,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
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
              child: Text("Tickets"),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
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
              child: Text("Inventory"),
            ),
          ),
        ],
      ),
    );
  }
}
