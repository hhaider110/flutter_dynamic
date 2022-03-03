import 'package:flutter/material.dart';
import 'package:flutter_app_locale/constants/constants.dart';
import 'package:flutter_app_locale/ui/widgets/responsive_ui.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  // final String? Function(String?)? validator;

  // final  onPressed;
  final bool obscureText;
  final IconData icon;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;

  CustomTextField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
    // this.validator,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        // validator: onPressed,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          prefixIcon: Icon(icon, color: Colors.blue[200], size: 20),
          hintText: hint,
          hintStyle:  TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}


class PasswordField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  // final  onPressed;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget suffix;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;

  PasswordField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.prefixIcon,
    required this.obscureText, required  this.suffix,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        obscureText: obscureText,
        // validator: onPressed,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          prefixIcon: Icon(prefixIcon, color: Colors.blue[200], size: 20),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle:  TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

