import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;

class CustomFloatingTextField extends StatelessWidget {
  const CustomFloatingTextField({
    Key? key,
    @required this.hint,
    this.prefix,
    this.maxLines = 1,
  }) : super(key: key);
  final String? hint;
  final Widget? prefix;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: style.black16MedTextField,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: style.hint2,
        filled: true,
        border: properties.noborderDecoration(Colors.grey.shade300, 8),
        fillColor: Colors.grey.shade300,
        icon: prefix,
      ),
    );
  }
}
