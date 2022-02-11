import 'package:feedback/custom/button/simplebutton.dart';
import 'package:feedback/feedback/feedbackdesign1.dart';
import 'package:feedback/feedback/feedbackdesign2.dart';
import 'package:feedback/feedback/feedbackdesign3.dart';
import 'package:feedback/feedback/feedbackdesign4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const FeedbackDesign1())),
                text: 'Feedback Design 1',
              ),
              CustomButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const FeedbackDesign2())),
                text: 'Feedback Design 2',
              ),
              CustomButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const FeedbackDesign3())),
                text: 'Feedback Design 3',
              ),
              CustomButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const FeedbackDesign4())),
                text: 'Feedback Design 4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
