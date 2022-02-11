import 'package:feedback/constants/decoration.dart' as Properties;
import 'package:feedback/constants/textstyle.dart' as Style;
import 'package:feedback/custom/button/custombutton.dart';
import 'package:feedback/custom/customAppBar.dart';
import 'package:feedback/custom/textfield/custom_textfield2.dart';
import 'package:flutter/material.dart';

class FeedbackDesign3 extends StatefulWidget {
  const FeedbackDesign3({Key? key}) : super(key: key);

  @override
  _FeedbackDesign3State createState() => _FeedbackDesign3State();
}

class _FeedbackDesign3State extends State<FeedbackDesign3> {
  List<String> topics = [
    "Suggestions",
    "Login Trouble",
    "Phone Number Related",
    "Personal Profile",
    "Other Issues"
  ];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () => Navigator.pop(context),
        title: "Feedback",
        isCenterTile: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We'd Love To Know Your Experience",
                    style: Style.greenMed20,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Email(optional)",
                    style: Style.black14Med,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomFocusedTextField(
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "What was the reason for your visit?",
                    style: Style.black14Med,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: Properties.dropdownDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: value,
                          hint: const Text("Please give your reason"),
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          items: topics.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              this.value = value;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Describe your experience",
                    style: Style.black14Med,
                  ),
                  const SizedBox(height: 10.0),
                   const CustomFocusedTextField(
          hintText: "Tell us your experience...",
          maxLines: 10,
        ),
                ],
              )),
            ),
            CustomRaisedButton(
              onPressed: () {},
              text: "Share Experience",
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: Style.black14Med,
      ));
}
