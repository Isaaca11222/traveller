import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:traveller/app/features/widgets/CountriesList/countries.dart';
import 'package:traveller/app/features/widgets/CountryPage/country_page.dart';

import 'package:traveller/app/features/widgets/RandomPage/random_page.dart';

class FirstPageSearch extends StatefulWidget {
  const FirstPageSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageSearch> createState() => _FirstPageSearchState();
}

class _FirstPageSearchState extends State<FirstPageSearch> {
  final controller = TextEditingController();
  var countries = allCountries;

  @override
  Widget build(BuildContext context) {
    final style = controller.text.isEmpty
        ? const TextStyle(color: Colors.black54)
        : const TextStyle(color: Colors.black);

    return Scaffold(
      body: Center(
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
                      suffixIcon: controller.text.isNotEmpty
                          ? GestureDetector(
                              child: Icon(Icons.close, color: style.color),
                              onTap: () {
                                controller.clear();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                searchCountry('');
                              },
                            )
                          : null,
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: searchCountry,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      final country = countries[index];

                      return Container(
                        color: const Color.fromARGB(110, 231, 228, 228),
                        child: ListTile(
                          leading: Image.network(
                            country.urlImage,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(country.title),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CountryPage(country: country),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(166, 34, 29, 29),
                  ),
                  child: const Text('Draw random'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RandomPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchCountry(String query) {
    final suggestions = allCountries.where((country) {
      final countryTitle = country.title.toLowerCase();
      final input = query.toLowerCase();

      return countryTitle.contains(input);
    }).toList();

    setState(() => countries = suggestions);
  }
}
