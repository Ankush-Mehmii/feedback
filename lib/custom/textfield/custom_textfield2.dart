import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;

class CustomFocusedTextField extends StatelessWidget {
  const CustomFocusedTextField({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
  }) : super(key: key);
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText == 'null' ? null : hintText,
          hintStyle: style.hint2,
          focusedBorder: properties.borderDecoration(Colors.green, 10.0),
          enabledBorder: properties.borderDecoration(Colors.grey, 10.0)),
    );
  }
}
