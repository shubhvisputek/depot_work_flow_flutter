import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'inventory_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryView extends GetView<InventoryController> {
  InventoryView({Key? key}) : super(key: key);

  static const routeName = '/inventory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.add_shopping_cart_outlined,
                size: 60.0,
                color: Colors.lightBlue.shade900,
              ),
              padding: EdgeInsets.all(30.0),
              shape: CircleBorder(),
            ),
            Text(
              'Scan or Add Products',
              style: GoogleFonts.barlowSemiCondensed(
                fontSize: 30,
                color: Colors.lightBlue.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
