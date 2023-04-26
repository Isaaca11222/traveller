import 'dart:math';

import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    var list = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
    final random = Random();
    var result = list[random.nextInt(list.length)];

    return Scaffold(
      appBar: AppBar(
        title: result == 'a'
            ? const Text('Afryka,Park Narodowy Serengeti, Tanzania, ')
            : result == 'b'
                ? const Text('Australia,Tasman National Park ')
                : result == 'c'
                    ? const Text('Chile,Park Narodowy Torres del Paine ')
                    : result == 'd'
                        ? const Text('Hiszpania,Park Narodowy Picos de Europa ')
                        : result == "e"
                            ? const Text('Japonia,Park Narodowy Oze ')
                            : result == "f"
                                ? const Text(
                                    'Kanada,Park Narodowy Waterton Lakes ')
                                : result == "g"
                                    ? const Text(
                                        'Kostaryka,Park Narodowy Arenal ')
                                    : result == "h"
                                        ? const Text(
                                            'Tajlandia,Park Narodowy Erawan ')
                                        : result == "i"
                                            ? const Text(
                                                'Usa,Park Narodowy Acadia, Maine ')
                                            : const Text(
                                                'Włochy,Park krajobrazowy Tre Cime di Lavaredo '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (result == 'a')
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXDYCJ.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == 'b')
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAKlNiA.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == 'c')
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCrct.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == 'd')
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1a2Kh4.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "e")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAWasH9.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "f")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCvWG.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "g")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAYOMbN.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "h")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCaak.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "i")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAOo7ln.img?h=768&w=1080&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            if (result == "j")
              Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAU9T6R.img?h=768&w=1366&m=6&q=60&o=f&l=f',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
