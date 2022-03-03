import 'package:flutter/material.dart';
import 'package:flutter_app_locale/constants/constants.dart';

import '../../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Colors.black,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/login.png'),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.home,
            press: () {},
          ),
          DrawerListTile(
            title: "Transaction",
            icon: Icons.home,
            press: () {},
          ),
          DrawerListTile(
            title: "Task",
            icon: Icons.home,
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            icon: Icons.home,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: buttonColor,
        size: 16,
      ),
      title: Text(
        title,
        style:  TextStyle(
          color: Colors.blue [200],
        ),
      ),
    );
  }
}
