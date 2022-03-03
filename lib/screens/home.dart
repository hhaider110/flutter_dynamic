import 'package:flutter/material.dart';
// import 'package:flutter_app_locale/constants/constants.dart';
import 'package:flutter_app_locale/ui/widgets/side_menu.dart';
import 'package:flutter_app_locale/utils/menu_controller.dart';
import 'package:flutter_app_locale/utils/responsive.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../main.dart';
import 'dashboard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashBoardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
