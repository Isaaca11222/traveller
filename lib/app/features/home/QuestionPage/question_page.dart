import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    Key? key,
  }) : super(key: key);

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
        backgroundColor: Colors.transparent ,
      ),
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
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Text(
                        "Traveller is an application designed to search for unusual travel destinations. This can be done through analog search or random search by using the 'draw random' button.You can save the searched places to your list of trips to be taken in the form of tiles. \nIn the future, users will also be able to save places on the map and rate their trips. Other users who wish to travel to their favorite beautiful places in the world will also be able to view ratings and trips. ",
                        style: TextStyle(
                          fontSize: 19,
                          wordSpacing: 8,
                          fontStyle: FontStyle.italic,
                        ),
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
