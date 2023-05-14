import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/contact_controller.dart';

class NewContact extends GetWidget<ContactController> {
  final setData;

  ContactController contactController = Get.put(ContactController());
  NewContact(this.setData, {super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Add Contact",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                focusNode: FocusNode(),
                keyboardType: TextInputType.text,
                controller: contactController.name,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                focusNode: FocusNode(),
                decoration: InputDecoration(labelText: 'Number'),
                controller: contactController.number,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }

                    if (_formKey.currentState!.validate()) {
                      contactController.onPressSubmit(context);
                      setData();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Add Contact',
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
    );
  }
}
