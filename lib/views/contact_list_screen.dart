import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './add_new_contact.dart';
import '../data/contscts.dart';
import '../controller/contact_controller.dart';
import 'contact_list.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  var contacts = Contacts.contactList;
  ContactController contactController = Get.put(ContactController());

  void setData() {
    setState(() {
      contacts = Contacts.contactList;
    });
  }

  void deleteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    void startAddContact(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewContact(setData),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Contacts List")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContactList(contacts, deleteContact),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            contactController.name.clear();
            contactController.number.clear();
            startAddContact(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
