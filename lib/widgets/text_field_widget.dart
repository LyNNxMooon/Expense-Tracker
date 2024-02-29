import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/constants/dimensions.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      required this.type});

  final TextEditingController controller;
  final String hint;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kSP10x),
      padding: const EdgeInsets.symmetric(horizontal: kSP20x),
      decoration: BoxDecoration(
          border: Border.all(color: kTextColor, width: 1),
          borderRadius: BorderRadius.circular(kSP20x)),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextColor),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none)),
        style: TextStyle(color: kTextColor),
        keyboardType: type,
      ),
    );
  }
}
