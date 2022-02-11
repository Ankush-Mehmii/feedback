import 'package:feedback/constants/textstyle.dart' as style;
import 'package:feedback/custom/button/custombutton.dart';
import 'package:feedback/custom/customAppBar.dart';
import 'package:feedback/custom/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';

class FeedbackDesign1 extends StatefulWidget {
  const FeedbackDesign1({Key? key}) : super(key: key);

  @override
  _FeedbackDesign1State createState() => _FeedbackDesign1State();
}

class _FeedbackDesign1State extends State<FeedbackDesign1> {
  List<bool> isTypeSelected = <bool>[false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () => Navigator.pop(context),
        title: "Feedback",
        isCenterTile: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Please select the type of the feedback",
                    style: style.black38Med,
                  ),
                  const SizedBox(height: 20.0),
                  InkWell(
                    child: buildCheckItem(
                        title: "Suggestions", isSelected: !isTypeSelected[4]),
                    onTap: () {
                      setState(() {
                        isTypeSelected[4] = !isTypeSelected[4];
                      });
                    },
                  ),
                  InkWell(
                    child: buildCheckItem(
                        title: "Login trouble", isSelected: isTypeSelected[0]),
                    onTap: () {
                      setState(() {
                        isTypeSelected[0] = !isTypeSelected[0];
                      });
                    },
                  ),
                  InkWell(
                    child: buildCheckItem(
                        title: "Phone number related",
                        isSelected: isTypeSelected[1]),
                    onTap: () {
                      setState(() {
                        isTypeSelected[1] = !isTypeSelected[1];
                      });
                    },
                  ),
                  InkWell(
                    child: buildCheckItem(
                        title: "Personal profile",
                        isSelected: isTypeSelected[2]),
                    onTap: () {
                      setState(() {
                        isTypeSelected[2] = !isTypeSelected[2];
                      });
                    },
                  ),
                  InkWell(
                    child: buildCheckItem(
                        title: "Other issues", isSelected: isTypeSelected[3]),
                    onTap: () {
                      setState(() {
                        isTypeSelected[3] = !isTypeSelected[3];
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildFeedbackForm(),
                  const SizedBox(height: 20.0),
                  buildNumberField(),
                ],
              )),
            ),
            CustomRaisedButton(
              onPressed: () {},
              text: "Send Feedback",
            )
          ],
        ),
      ),
    );
  }

  Widget buildNumberField() {
    return const CustomTextField(
      hintText: "Email(optional)",
    );
  }

  Widget buildFeedbackForm() {
    return const SizedBox(
        height: 200,
        child: CustomTextField(
          hintText: "Please briefly describe the issue",
          maxLines: 10,
        ));
  }

  Widget buildCheckItem({String? title, bool? isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: <Widget>[
          Icon(
            isSelected! ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 10.0),
          Text(title!,
              style: style
                  .checkItemTextStyle(isSelected ? Colors.blue : Colors.grey)),
        ],
      ),
    );
  }
}
