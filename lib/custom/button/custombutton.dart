import 'package:flutter/material.dart';
import 'package:feedback/constants/decoration.dart' as Properties;
import 'package:feedback/constants/textstyle.dart' as Style;

class CustomRaisedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const CustomRaisedButton({
    Key? key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: ElevatedButton(
        style: Properties.simpleBlueButton,
        onPressed: onPressed,
        child: Text(
          text!,
          style: Style.whiteBoldTextStyle,
        ),
      ),
    );
  }
}
