import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.validator,
    this.onChanged
  }) : super(key: key);
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final FormFieldValidator? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText == 'null' ? null : hintText,
          hintStyle: style.hint,
          border: properties.borderDecoration(Colors.grey, 10.0)),
    );
  }
}
