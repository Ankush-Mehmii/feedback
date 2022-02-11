import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;
import 'package:feedback/custom/button/custombutton.dart';
import 'package:feedback/custom/customAppBar.dart';
import 'package:feedback/custom/textfield/custom_textfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class FeedbackDesign2 extends StatefulWidget {
  const FeedbackDesign2({Key? key}) : super(key: key);

  @override
  _FeedbackDesign2State createState() => _FeedbackDesign2State();
}

class _FeedbackDesign2State extends State<FeedbackDesign2> {
  List<bool> isTypeSelected = <bool>[false, false, false, false, false];

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
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Rate Your Experience",
                    style: style.blackMed26,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Are you Satisfied with the service?",
                    style: style.black38Med,
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      unratedColor: Colors.grey.shade400,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, i) =>
                          buildRatingItem(title: (i+1).toString()),
                      onRatingUpdate: (double rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Tell us what can be improved?",
                    style: style.blackBold,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Wrap(spacing: 10.0, runSpacing: 16.0, children: <Widget>[
                    InkWell(
                      child: buildTopicItem(
                          title: "Suggestions", isSelected: isTypeSelected[4]),
                      onTap: () {
                        setState(() {
                          isTypeSelected[4] = !isTypeSelected[4];
                        });
                      },
                    ),
                    InkWell(
                      child: buildTopicItem(
                          title: "Login trouble",
                          isSelected: isTypeSelected[0]),
                      onTap: () {
                        setState(() {
                          isTypeSelected[0] = !isTypeSelected[0];
                        });
                      },
                    ),
                    InkWell(
                      child: buildTopicItem(
                          title: "Phone number related",
                          isSelected: isTypeSelected[1]),
                      onTap: () {
                        setState(() {
                          isTypeSelected[1] = !isTypeSelected[1];
                        });
                      },
                    ),
                    InkWell(
                      child: buildTopicItem(
                          title: "Personal profile",
                          isSelected: isTypeSelected[2]),
                      onTap: () {
                        setState(() {
                          isTypeSelected[2] = !isTypeSelected[2];
                        });
                      },
                    ),
                    InkWell(
                      child: buildTopicItem(
                          title: "Other issues", isSelected: isTypeSelected[3]),
                      onTap: () {
                        setState(() {
                          isTypeSelected[3] = !isTypeSelected[3];
                        });
                      },
                    ),
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildFeedbackForm(),
                  const SizedBox(height: 20.0),
                ],
              )),
            ),
            CustomRaisedButton(
              onPressed: () {},
              text: "Submit",
            )
          ],
        ),
      ),
    );
  }

  Widget buildFeedbackForm() {
    return const SizedBox(
        height: 200,
        child: CustomTextField(
          hintText: "Tell us on how can we improve...",
          maxLines: 10,
        ));
  }

  Widget buildRatingItem({
    String? title,
  }) {
    return Container(
      height: 60,
      width: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.only(right: 10.0),
      child: Text(title!, style: style.checkItemTextStyle(Colors.white)),
      decoration:
          properties.itemSelectionDecoration(10.0, Colors.red),
    );
  }

  Widget buildItem({String? title, bool? isSelected}) {
    return Container(
      height: 60,
      width: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.only(right: 10.0),
      child: Text(title!,
          style: style.checkItemTextStyle(
              isSelected! ? Colors.white : Colors.grey.shade100)),
      decoration: properties.itemSelectionDecoration(
          10.0, isSelected ? Colors.red : Colors.grey.shade400),
    );
  }

  Widget buildTopicItem({String? title, bool? isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Text(title!,
          style: style.checkItemTextStyle(
              isSelected! ? Colors.white : Colors.grey.shade100)),
      decoration: properties.itemSelectionDecoration(
          10.0, isSelected ? Colors.red : Colors.grey.shade400),
    );
  }
}
