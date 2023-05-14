import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Login());
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text("Contacts App")),
//         body: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ContactListScreen();
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('${snapshot.error}'),
//                 );
//               } else {
//                 return Login();
//               }
//             }),
//       ),
//     );
//   }
// }
