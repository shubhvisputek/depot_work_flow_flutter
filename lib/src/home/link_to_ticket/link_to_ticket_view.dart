import 'package:depotworkflow/src/home/tickets/ticket/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'link_to_ticket_controller.dart';

class LinkToTicketBindingView extends GetView<LinkToTicketBindingController> {
  LinkToTicketBindingView({Key? key}) : super(key: key);

  static const routeName = '/link_to_ticket';

  @override
  Widget build(BuildContext context) {
    Get.put(LinkToTicketBindingController());
    return GetBuilder<LinkToTicketBindingController>(
      init: LinkToTicketBindingController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Link To Ticket"),
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
            onPressed: () => controller.onSubmitBtnTapped(),
            child: const Text("Submit"),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              getAllTextFormField(),
              const SizedBox(height: 5),
              getButtonsField(),
              Expanded(
                child: ListView.builder(
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
                        Get.snackbar('$index deleted', '$index deleted');
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('$index deleted')));
                      },
                      background: Container(color: Colors.red),
                      child: loadItem(index),
                    );

                    //return loadItem(index);
                  },
                ),
              ),
            ],
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
                  : Color.fromRGBO(0, 0, 0, 0),
          minLeadingWidth: 5.0,
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
          onTap: () => controller.onItemTapped(index),
        ),
        const Divider(height: 0),
      ],
    );
  }

  Widget getButtonsField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: controller.onImportInventoryTapped,
          child: const Text("Import Inventory"),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            controller.onScanInventoryTapped();
          },
          child: const Text("Scan Inventory"),
        ),
      ],
    );
  }

  Widget getTextFormField(
      {String initialValue = "",
      String labelText = "",
      Widget? icon,
      void Function(String?)? onSaved,
      String? Function(String?)? validator}) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        // icon: icon,
        labelText: labelText,
      ),
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
    );
  }

  Widget getAllTextFormField() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: getTextFormField(
                initialValue: controller.poNumber.value,
                labelText: 'PO#',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.poNumber.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: getTextFormField(
                initialValue: controller.ticket.value,
                labelText: 'Ticket#',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.ticket.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: getTextFormField(
                initialValue: controller.deviceModel.value,
                labelText: 'Device Model',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.deviceModel.value = value;
                  }
                },
                validator: (String? value) {
                  if (value == null || !value.isNotEmpty) {
                    return 'Please fill this field';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: getTextFormField(
                initialValue: controller.sBOM.value,
                labelText: 'SBOM',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.sBOM.value = value;
                  }
                },
                validator: (String? value) {
                  return (value == null || !value.isNotEmpty)
                      ? 'Please fill this field'
                      : null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: getTextFormField(
                initialValue: controller.part.value,
                labelText: 'Part#',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.part.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: getTextFormField(
                initialValue: controller.storageBin.value,
                labelText: 'Storage Bin',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.storageBin.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: getTextFormField(
                initialValue: controller.corpID.value,
                labelText: 'Corp ID',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.corpID.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: getTextFormField(
                initialValue: controller.corpName.value,
                labelText: 'Corp Name',
                icon: const Icon(Icons.search),
                onSaved: (String? value) {
                  if (value != null || value!.isNotEmpty) {
                    controller.corpName.value = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        getTextFormField(
          initialValue: controller.keys.value,
          labelText: 'Keys',
          icon: const Icon(Icons.search),
          onSaved: (String? value) {
            if (value != null || value!.isNotEmpty) {
              controller.keys.value = value;
            }
          },
          validator: (String? value) {
            return (value != null && value.contains('@'))
                ? 'Do not use the @ char.'
                : null;
          },
        ),
      ],
    );
  }
}
