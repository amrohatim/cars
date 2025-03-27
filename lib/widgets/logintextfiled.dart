import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';

class Mylogintextfiled extends StatelessWidget {
  const Mylogintextfiled({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obscureText,
    required this.iconData,
    this.validator,
  });
  final String hinttext;
  final bool obscureText;
  final IconData iconData;
  final controller;
  final validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        cursorColor: MyColors.primaryColor,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: Icon(iconData, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color.fromARGB(255, 206, 205, 205)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
