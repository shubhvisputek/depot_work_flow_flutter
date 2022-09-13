import 'dart:async';

import 'package:depotworkflow/src/home/CustomSwitchButton.dart';
import 'package:depotworkflow/src/home/home_controller.dart';
import 'package:depotworkflow/src/home/home_service.dart';
import 'package:depotworkflow/src/home/inventory/inventory_view.dart';
import 'package:depotworkflow/src/home/tickets/tickets_view.dart';
import 'package:depotworkflow/src/login/login_view.dart';
import 'package:depotworkflow/src/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
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
          actions: [
            controller.selectedIndex.value == 1
                ? IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      getTicketDialog();
                    },
                  )
                : Container(),
            controller.selectedIndex.value == 1
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      getSearchDialog();
                      // showSearchAlertDialog(context);
                    },
                  )
                : Container(),
          ],
        ),
        body: Center(
          child: controller.selectedIndex.value == 0
              ? TicketsView()
              : InventoryView(),
        ),
        bottomNavigationBar: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Future<dynamic> getSearchDialog() {
    return Get.defaultDialog(
      title: 'Search',
      content: getSearchDialogDesign(true),
      radius: 10.0,
    );
  }

  showSearchAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget launchButton = TextButton(
      child: const Text("Submit"),
      onPressed: controller.onSearchSubmitTapped,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("Notice"),
      content: getSearchDialogDesign(false),
      actions: [
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [alert],
        );
      },
    );
  }

  Widget getSearchDialogDesign(bool showActionBtns) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Column(
        children: [
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          getSegmentedControl(),
          const SizedBox(height: 10.0),
          showActionBtns
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.onSearchSubmitTapped,
                      child: const Text("Submit"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget getSegmentedControl() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: Color.fromARGB(255, 152, 64, 64),
        thumbColor: CupertinoColors.activeGreen,
        padding: EdgeInsets.all(0),
        groupValue: controller.groupValue,
        children: {
          0: buildSegment("PO#"),
          1: buildSegment("SBOM"),
          2: buildSegment("CorpID"),
          3: buildSegment("Customer Name"),
          4: buildSegment("Ticket#"),
        },
        onValueChanged: controller.onSegmentTapped,
      ),
    );
  }

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<dynamic> getTicketDialog() {
    return Get.defaultDialog(
      title: 'Select an option below',
      content: getTicketDialogDesign(),
      radius: 10.0,
    );
  }

  Widget getTicketDialogDesign() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Column(
        children: [
          const SizedBox(height: 10.0),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: controller.linkToTicketBtnSwitch.value
                        ? MaterialStateProperty.all(Colors.grey)
                        : MaterialStateProperty.all(Colors.blue)),
                onPressed: () => controller.onLinkToTicketBtnSwitch(
                    !controller.linkToTicketBtnSwitch.value),
                child: const Text("Link To Ticket"),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: controller.onAddToNewTicketTapped,
                child: const Text("Add New Ticket"),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          controller.linkToTicketBtnSwitch.value
              ? getLinkToTicketWidget()
              : Container(),
        ],
      ),
    );
  }

  Widget getLinkToTicketWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextField(
              controller: controller.poController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'PO#',
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextField(
              controller: controller.ticketController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Ticket',
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.onLinkToTicketSubmitTapped,
                child: const Text("Submit"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  controller.onLinkToTicketBtnSwitch(false);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
