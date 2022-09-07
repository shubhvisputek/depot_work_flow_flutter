import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../routes/app_pages.dart';
import 'device_completion_controller.dart';

class DeviceCompletionView extends GetView<DeviceCompletionController> {
  const DeviceCompletionView({Key? key}) : super(key: key);

  static const routeName = '/devicecompletion';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeviceCompletionController>(
      init: DeviceCompletionController(),
      builder: (controller) => Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Device Completion"),
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
        // SizedBox(height: 50),
        Expanded(
          child: Text("Shubham ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(backgroundColor: Colors.red)),
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
