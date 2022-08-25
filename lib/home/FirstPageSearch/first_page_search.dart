import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class FirstPageSearch extends StatelessWidget {
  const FirstPageSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bck.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                margin: (const EdgeInsets.all(20.0)),
                color: const Color.fromARGB(195, 78, 77, 74),
                child: const TextField(
                  decoration: InputDecoration(hintText: 'Choose country'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.transparent),
                child: const Text('Draw random'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
