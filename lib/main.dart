import 'package:flutter/material.dart';
import 'package:traveller/app/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traveller/app/home/home_page.dart';

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

class HomePagee extends StatelessWidget {
  const HomePagee({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jestes zalogowany jako ${user.email}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Wyloguj'),
            ),
          ],
        ),
      ),
    );
  }
}
