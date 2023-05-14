import 'package:flutter/material.dart';
import './contact_list_screen.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => ContactListScreen());
            },
            child: Text("Login with Google")),
      ),
    );
  }
}
