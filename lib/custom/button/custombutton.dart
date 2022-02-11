import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: ElevatedButton(
        style: properties.simpleBlueButton,
        onPressed: onPressed,
        child: Text(
          text!,
          style: style.whiteBoldTextStyle,
        ),
      ),
    );
  }
}
