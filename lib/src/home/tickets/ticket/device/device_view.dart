import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../routes/app_pages.dart';
import 'device_controller.dart';

class DeviceView extends GetView<DeviceController> {
  const DeviceView({Key? key}) : super(key: key);

  static const routeName = '/device';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeviceController>(
      init: DeviceController(),
      builder: (controller) => Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Device"),
        ),
        body: pageBody(),
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
            onPressed: () => controller.onNextBtnTapped(),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }

  Widget pageBody() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'assets/images/lane_7000.png',
                // scale: 1.09,
                // width: 300,
                // height: 300,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Dummy TID"),
                      ),
                      Expanded(
                        child: Text(": 59821212"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Store ID"),
                      ),
                      Expanded(
                        child: Text(": 00111"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Zip Code"),
                      ),
                      Expanded(
                        child: Text(": 62705"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Lane No."),
                      ),
                      Expanded(
                        child: Text(": 99"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Container(
          child: QrImage(
            data: "59821212~00111~62705~99",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ],
    );
  }
}
