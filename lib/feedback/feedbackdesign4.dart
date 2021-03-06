import 'dart:io';

import 'package:feedback/constants/decoration.dart' as properties;
import 'package:feedback/constants/textstyle.dart' as style;
import 'package:feedback/custom/button/custombutton.dart';
import 'package:feedback/custom/customAppBar.dart';
import 'package:feedback/custom/textfield/Custom_textfield3.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackDesign4 extends StatefulWidget {
  const FeedbackDesign4({Key? key}) : super(key: key);

  @override
  _FeedbackDesign4State createState() => _FeedbackDesign4State();
}

class _FeedbackDesign4State extends State<FeedbackDesign4> {
  String? value;
  final List<XFile> _imageList = <XFile>[];
  int val = 1;
  List<String> lst = <String>['Suggestion', 'Bug', 'Other'];
  int selectedIndex = 0;

  final ImagePicker _picker = ImagePicker();
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
                    "Email",
                    style: style.black14Med,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomFloatingTextField(
                    hint: "Email",
                    prefix: Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Name",
                    style: style.black14Med,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomFloatingTextField(
                    hint: "Name",
                    prefix: Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "How can we improve?",
                    style: style.black14Med,
                  ),
                  const SizedBox(height: 10.0),
                  const CustomFloatingTextField(
                    maxLines: 5,
                    hint: "What would you like us to improve?",
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      customRadio(lst[0], 0),
                      customRadio(lst[1], 1),
                      customRadio(lst[2], 2)
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  OutlinedButton(
                      style: properties.buttonStyle,
                      onPressed: () {
                        imageSelect();
                      },
                      child: const Text("Include Screenshot")),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 200.0,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, mainAxisSpacing: 8.0),
                        itemCount: _imageList.length,
                        itemBuilder: (context, i) {
                          return Image.file(File(_imageList[i].path));
                        }),
                  )
                ],
              )),
            ),
            CustomRaisedButton(
              onPressed: () {},
              text: "Submit Feedback",
            )
          ],
        ),
      ),
    );
  }

  Widget customRadio(String txt, int index) {
    return InkWell(
      onTap: () => changeIndex(index),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            height: 14.0,
            width: 14.0,
            decoration: properties.radioButtonDecoration(
                selectedIndex == index ? Colors.green : Colors.grey),
          ),
          Text(
            txt,
            style: style.checkItemTextStyle(
                selectedIndex == index ? Colors.green : Colors.grey),
          ),
        ],
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      setState(() {
        _imageList.add(selectedImage);
      });
    }
  }
}
