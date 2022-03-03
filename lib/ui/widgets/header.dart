// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "package:provider/provider.dart";
import 'package:flutter_app_locale/constants/constants.dart';
import 'package:flutter_app_locale/utils/menu_controller.dart';
import 'package:flutter_app_locale/utils/responsive.dart';
import 'package:flutter_app_locale/flutter_svg/flutter_svg.dart';
import 'package:flutter_app_locale/constants.dart';

import '../../main.dart';


class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu, size: 30.0,),
            onPressed: context.read<MenuController>().controlMenu,
          ),

        // if (!Responsive.isMobile(context))
        const Expanded(child: SearchField()),
        // if (Responsive.isDesktop(context)) 
          // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const CustomIcon(icon: Icons.mail_outline),
        const ProfileCard(),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  get secondaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Column(
            children: const [
              Icon(Icons.keyboard_arrow_down),
            ],
          ),

          if (!Responsive.isMobile(context))
            const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("dp"),
            ),
        ],
      ),
    );
  }
}



class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  get secondaryColor => null;

  get primaryColor => null;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}