import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'tickets_controller.dart';

class TicketsView extends GetView<TicketsController> {
  TicketsView({Key? key}) : super(key: key);

  static const routeName = '/tickets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
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
          title: Text("Lane 7000"),
          subtitle: Text("This request is generated in iSupport"),
          trailing: Wrap(
            // mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: const [
              Icon(
                Icons.circle,
                color: Colors.red,
                size: 20,
                shadows: [Shadow()],
              ),
              Text("High"),
            ],
          ),
          onTap: () {},
        ),
        Divider(height: 0),
      ],
    );
  }
}
