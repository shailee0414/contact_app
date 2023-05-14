import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/contscts.dart';
import '../models/contact_model.dart';

class ContactController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  Rx<Contacts> contactLists = Contacts().obs;
  @override
  void onClose() {
    super.onClose();
    name.dispose();
    number.dispose();
  }

  void onPressSubmit(context) async {
    if (name.text != null && number.text != null) {
      Contacts.contactList.add(ContactModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name.text.toString(),
        number: number.text.toString(),
      ));
      // if (name.text != null && number.text != null)
    }
  }

  void onPressEdit(id) {
    final contactIndex =
        Contacts.contactList.indexWhere((element) => element.id == id);
    final updatedContact = ContactModel(
      id: id,
      name: name.text.toString(),
      number: number.text.toString(),
    );
    Contacts.contactList[contactIndex] = updatedContact;
  }
}
