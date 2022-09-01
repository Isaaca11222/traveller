import 'package:flutter/material.dart';
import 'package:traveller/LoginPage/login_page.dart';

import 'package:traveller/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller',
      theme: ThemeData(),
      home: const LoginPage(),
    );
  }
}
