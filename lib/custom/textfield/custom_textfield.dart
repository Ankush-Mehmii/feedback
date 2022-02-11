import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as Properties;
import 'package:feedback/constants/textstyle.dart' as Style;
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  const CustomTextField({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
    hintText: hintText == 'null' ? null : hintText,
    hintStyle: Style.hint,
    border: Properties.borderDecoration(Colors.grey, 10.0)),
    );
  }
}
