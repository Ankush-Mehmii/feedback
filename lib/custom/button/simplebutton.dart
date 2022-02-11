import 'package:flutter/material.dart';
import 'package:feedback/constants/textstyle.dart' as Style;

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const CustomButton({
    Key? key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: Style.whiteBoldTextStyle,
      ),
    );
  }
}
