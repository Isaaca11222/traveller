import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class SecondPageList extends StatelessWidget {
  const SecondPageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Your destinaton List',
          ),
          backgroundColor: Color.fromARGB(167, 38, 83, 128)),
      body: const ListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListBody extends StatelessWidget {
  const ListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bckb.jpg'), fit: BoxFit.cover),
          ),
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              height: 180,
              child: ListView(
                children: [Text("data")],
              )),
        ),
      ],
    );
  }
}
