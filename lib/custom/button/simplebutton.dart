import 'package:flutter/material.dart';
import 'package:feedback/constants/textstyle.dart' as style;

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: style.whiteBoldTextStyle,
      ),
    );
  }
}
