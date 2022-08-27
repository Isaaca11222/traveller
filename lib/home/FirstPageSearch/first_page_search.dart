import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class FirstPageSearch extends StatelessWidget {
  const FirstPageSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller;
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
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(136, 122, 117, 117),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search by country ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
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
