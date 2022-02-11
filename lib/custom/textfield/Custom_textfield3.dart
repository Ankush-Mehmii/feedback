import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as Properties;
import 'package:feedback/constants/textstyle.dart' as Style;

class CustomFloatingTextField extends StatelessWidget {
  final String? hint;
  final Widget? prefix;
  final int? maxLines;

  const CustomFloatingTextField({
    Key? key,
    @required this.hint,
    this.prefix,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Style.black16MedTextField,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Style.hint2,
        filled: true,
        border: Properties.noborderDecoration(Colors.grey.shade300, 8),
        fillColor: Colors.grey.shade300,
        icon: prefix,
      ),
    );
  }
}
