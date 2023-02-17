import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/lodka.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 146, 138, 138).withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You are logged in as ${user.email}',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
