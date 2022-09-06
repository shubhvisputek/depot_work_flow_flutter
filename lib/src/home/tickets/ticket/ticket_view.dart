import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({Key? key}) : super(key: key);

  static const routeName = '/ticket';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TicketController>(
      init: TicketController(),
      builder: (controller) => Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ticket Name"),
          actions: [
            IconButton(
              onPressed: () {
                controller.onAddItemTapped(
                    "${controller.generateRandomNumber(9)} - Lane ${controller.items.length}");
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: controller.items.length,
          controller: controller.scroll_controller,
          itemBuilder: (context, index) {
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: UniqueKey(), //Key(index.toString()),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                controller.onRemovedItemTapped(index);

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$index deleted')));
              },
              background: Container(color: Colors.red),
              child: loadItem(index),
            );

            //return loadItem(index);
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
          color: Color.fromARGB(255, 59, 59, 59).withOpacity(0.7),
          //   height: 50,
          //   width: double.maxFinite,
          child: ElevatedButton(
            style: ButtonStyle(
              // minimumSize: MaterialStateProperty.all<Size>(
              //   Size(195, 48),
              // ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () => controller.onCompletedBtnTapped(),
            child: const Text("Complete Ticket"),
          ),
        ),
      ),
    );
  }

  Widget loadItem(int index) {
    return Column(
      children: [
        ListTile(
          tileColor:
              controller.timer != null && index == controller.items.length - 1
                  ? Colors.green
                  : Colors.transparent,
          minLeadingWidth: 20.0,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text((index + 1).toString()),
            ],
          ),
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              Container(
                height: 48,
                width: 2,
                color: Colors.grey,
              ),
              Text(controller.items[index]),
            ],
          ),
          // title: Text(controller.items[index]),
          trailing: const Text("Completed"),
          onTap: () => controller.onCompletedBtnTapped(),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
