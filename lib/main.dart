import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screens_responsive/views/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//* Todoyalee on Github
//* https://github.com/todoyalee

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpView(),
    );
  }
}
