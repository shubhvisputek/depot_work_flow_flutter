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
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ticket Name"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return loadItem();
        },
      ),
    );
  }

  Widget loadItem() {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(generateRandomNumber(24)),
              const Text(" - "),
              const Text("Lane"),
            ],
          ),
          trailing: Wrap(
            // mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: const [
              // Icon(
              //   Icons.circle,
              //   color: Colors.red,
              //   size: 20,
              //   shadows: [Shadow()],
              // ),
              Text("Completed"),
            ],
          ),
          onTap: () {},
        ),
        const Divider(height: 0),
      ],
    );
  }

  String generateRandomNumber(int size) {
    var randomNum = "";
    var rnd = Random();
    for (var i = 0; i < 6; i++) {
      randomNum = randomNum + rnd.nextInt(9).toString();
    }
    return randomNum;
  }
}
