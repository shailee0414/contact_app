import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/contact_controller.dart';
import 'contact_list_screen.dart';

class EditContact extends StatelessWidget {
  ContactController contactController = Get.put(ContactController());
  final contact;
  EditContact(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Edit Contact")),
        body: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  focusNode: FocusNode(),
                  keyboardType: TextInputType.text,
                  controller: contactController.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  focusNode: FocusNode(),
                  decoration: InputDecoration(labelText: 'Number'),
                  controller: contactController.number,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      contactController.onPressEdit(contact.id);
                      Get.to(() => ContactListScreen());

                      // setData();
                    },
                    child: const Text(
                      'Edit Contact',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
