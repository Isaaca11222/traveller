import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class FourthPageMyAccount extends StatelessWidget {
  const FourthPageMyAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/lodka.jpg'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(200.0),
                margin: const EdgeInsets.all(15.0),
                color: (const Color.fromARGB(195, 78, 77, 74)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Jesteś zalogowany jako ', //${user.email}
                      style: GoogleFonts.lato(
                        fontSize: 15,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Wyloguj'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
