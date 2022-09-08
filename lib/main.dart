import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traveller/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveller',
      theme: ThemeData(),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginPage();
          }
          return HomePagee(user: user);
        });
  }
}
