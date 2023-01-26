import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:traveller/app/features/home/NavigationBar/FirstPageSearch/first_page_search.dart';
import 'package:traveller/app/features/home/NavigationBar/FourthPageMyAccount/fourth_page.dart';
import 'package:traveller/app/features/home/NavigationBar/SecondPageList/second_page.dart';
import 'package:traveller/app/features/home/NavigationBar/ThirdPageMap/third_page.dart';
import 'package:traveller/app/features/home/NavigationDraverWidget/navigation_drawer_widget.dart';
import 'package:traveller/app/features/home/QuestionPage/question_page.dart';


class HomePagee extends StatefulWidget {
  const HomePagee({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuestionPage()),
              );
            },
            icon: const Icon(Icons.question_mark),
          ),
        ],
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

        return FourthPage(user: widget.user);
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
            const Color.fromARGB(228, 223, 215, 215).withOpacity(0.7),
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
