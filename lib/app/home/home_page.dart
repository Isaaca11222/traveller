import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:traveller/app/home/FirstPageSearch/first_page_search.dart';
import 'package:traveller/app/home/FourthPageMyAccount/fourth_page.dart';
import 'package:traveller/app/home/SecondPageList/second_page.dart';
import 'package:traveller/app/home/ThirdPageMap/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Traveller',
              style: GoogleFonts.lora(fontSize: 40),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const FirstPageSearch();
        }
        if (currentIndex == 1) {
          return const SecondPageList();
        }
        if (currentIndex == 2) {
          return const ThirdPageMap();
        }
        return const FourthPageMyAccount();
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My account',
          ),
        ],
      ),
    );
  }
}
