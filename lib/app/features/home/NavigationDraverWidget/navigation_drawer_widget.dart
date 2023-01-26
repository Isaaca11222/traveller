import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(64, 231, 229, 222),
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'Destinations',
              icon: Icons.map_sharp,
            ),
            buildMenuItem(
              text: 'Account',
              icon: Icons.person,
            ),
            buildMenuItem(
              text: 'Credits',
              icon: Icons.create,
            ),
            const SizedBox(
              height: 400,
            ),
            buildMenuItem(
              text: 'Help',
              icon: Icons.help_center_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }) {
    const color = Color.fromARGB(255, 10, 9, 9);

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text, style: const TextStyle(color: color)),
      onTap: () {},
    );
  }
}
