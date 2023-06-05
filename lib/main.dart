import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromARGB(255, 134, 93, 90)),
      title: 'MyNhanTin',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Login_page()),
        GetPage(name: '/2', page: () => Register_page()),
        GetPage(name: '/3', page: () => Home_page()),
      ],
    );
  }
}
