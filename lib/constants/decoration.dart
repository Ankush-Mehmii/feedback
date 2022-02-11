library ui_decoration;

import 'package:flutter/material.dart';
import 'package:feedback/constants/textstyle.dart' as style;

ButtonStyle simpleBlueButton = ElevatedButton.styleFrom(
  primary: Colors.blue[800],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);

InputDecoration inputDecoration(String hintText) => InputDecoration(
    hintText: hintText == 'null' ? null : hintText,
    hintStyle: style.hint,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ));

InputBorder borderDecoration(Color color, double radius) => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: BorderSide(
        color: color,
      ),
    );
InputBorder noborderDecoration(Color color, double radius) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide.none);
Decoration itemSelectionDecoration(double radius, Color color) => BoxDecoration(
      color: color,
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
Decoration radioButtonDecoration(Color color) =>
    BoxDecoration(shape: BoxShape.circle, color: color);

Decoration dropdownDecoration = BoxDecoration(
  border: Border.all(color: Colors.black38, width: 2.0),
  borderRadius: const BorderRadius.all(
    Radius.circular(5),
  ),
);

ButtonStyle buttonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  side: const BorderSide(color: Colors.blue),
  backgroundColor: Colors.white,
  elevation: 1.0,
);
