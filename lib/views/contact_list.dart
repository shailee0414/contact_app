import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/contact_controller.dart';
import '../models/contact_model.dart';
import 'edit_contact.dart';

class ContactList extends StatelessWidget {
  ContactController contactController = Get.put(ContactController());
  final List<ContactModel> contacts;
  final deleteContact;
  ContactList(  this.contacts, this.deleteContact, {super.key});

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? Center(
            child: Container(
                margin: EdgeInsets.only(top: 100),
                child: Text('There is no Contacts')),
          )
        : Column(
            children: contacts.reversed.map((contact) {
              return InkWell(
                onTap: () {
                  contactController.name.text = contact.name;

                  contactController.number.text = contact.number;
                  Get.to(() => EditContact(contact));
                },
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.account_circle_sharp,
                        color: Colors.indigo,
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      contact.name,
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      color: Color.fromARGB(255, 228, 106, 78),
                      iconSize: 30,
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteContact(contact.id);
                      },
                    ),
                    subtitle: Text(contact.number),
                  ),
                ),
              );
            }).toList(),
          );
  }
}
