import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:traveller/app/features/add/add_page.dart';
import 'package:traveller/app/features/pages/CountriesList/countries.dart';

class CountryPage extends StatelessWidget {
  final Country country;

  const CountryPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.title),
      ),
      body: Image.network(
        country.urlImage,
        width: double.infinity,
        height: 1000,
        fit: BoxFit.cover,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
