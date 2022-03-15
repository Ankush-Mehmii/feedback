import 'package:feedback/Authentication/authrepo.dart';
import 'package:feedback/Authentication/formsubmit.dart';
import 'package:feedback/constants/textstyle.dart' as style;
import 'package:feedback/custom/button/custombutton.dart';
import 'package:feedback/custom/customAppBar.dart';
import 'package:feedback/custom/textfield/custom_textfield.dart';
import 'package:feedback/feedback/feedback1/feedback1event.dart';
import 'package:feedback/feedback/feedback1/feedback1state.dart';
import 'package:feedback/feedback/feedback1/feeddback1bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackDesign1 extends StatefulWidget {
  const FeedbackDesign1({Key? key}) : super(key: key);

  @override
  _FeedbackDesign1State createState() => _FeedbackDesign1State();
}

class _FeedbackDesign1State extends State<FeedbackDesign1> {
  List<bool> isTypeSelected = <bool>[false, false, false, false, false];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  List<String> reasons = <String>["Suggestions"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () => Navigator.pop(context),
        title: "Feedback",
        isCenterTile: true,
      ),
      body: BlocProvider<FeedbackBloc>(
        create: (context) => FeedbackBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: Padding(
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
                    BlocBuilder<FeedbackBloc, FeedbackState>(
                        builder: (context, state) {
                      return InkWell(
                        child: buildCheckItem(
                            title: "Suggestions",
                            isSelected: !isTypeSelected[4]),
                        onTap: () {
                          context.read<FeedbackBloc>().add(
                              FeedbackReasonChanged(
                                  reason: selectOption("Suggestions")));
                          setState(() {
                            isTypeSelected[4] = !isTypeSelected[4];
                          });
                        },
                      );
                    }),
                    BlocBuilder<FeedbackBloc, FeedbackState>(
                        builder: (context, state) {
                      return InkWell(
                        child: buildCheckItem(
                            title: "Login trouble",
                            isSelected: isTypeSelected[0]),
                        onTap: () {
                          context.read<FeedbackBloc>().add(
                              FeedbackReasonChanged(
                                  reason: selectOption("Login trouble")));
                          setState(
                            () {
                              isTypeSelected[0] = !isTypeSelected[0];
                            },
                          );
                        },
                      );
                    }),
                    BlocBuilder<FeedbackBloc, FeedbackState>(
                        builder: (context, state) {
                      return InkWell(
                        child: buildCheckItem(
                            title: "Phone number related",
                            isSelected: isTypeSelected[1]),
                        onTap: () {
                          context.read<FeedbackBloc>().add(
                              FeedbackReasonChanged(
                                  reason:
                                      selectOption("Phone number related")));
                          setState(() {
                            isTypeSelected[1] = !isTypeSelected[1];
                          });
                        },
                      );
                    }),
                    BlocBuilder<FeedbackBloc, FeedbackState>(
                        builder: (context, state) {
                      return InkWell(
                        child: buildCheckItem(
                            title: "Personal profile",
                            isSelected: isTypeSelected[2]),
                        onTap: () {
                          context.read<FeedbackBloc>().add(
                              FeedbackReasonChanged(
                                  reason: selectOption("Personal profile")));
                          setState(() {
                            isTypeSelected[2] = !isTypeSelected[2];
                          });
                        },
                      );
                    }),
                    BlocBuilder<FeedbackBloc, FeedbackState>(
                        builder: (context, state) {
                      return InkWell(
                        child: buildCheckItem(
                            title: "Other issues",
                            isSelected: isTypeSelected[3]),
                        onTap: () {
                          context.read<FeedbackBloc>().add(
                              FeedbackReasonChanged(
                                  reason: selectOption("Other issues")));
                          setState(() {
                            isTypeSelected[3] = !isTypeSelected[3];
                          });
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            buildFeedbackForm(),
                            const SizedBox(height: 20.0),
                            buildEmailField(),
                            const SizedBox(height: 20.0),
                          ],
                        ))
                  ],
                )),
              ),
              BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                return state.formStatus is FormSubmitting
                    ? Center(child: const CircularProgressIndicator())
                    : CustomRaisedButton(
                        text: "Send Feedback",
                        onPressed: () {
                          if (_formkey.currentState!.validate() &&
                              state.isreasonsempty) {
                            context
                                .read<FeedbackBloc>()
                                .add(FeedbackSubmitted());
                          }
                        },
                      );
              }),
              /*  CustomRaisedButton(
                onPressed: () {},
                text: "Send Feedback",
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return BlocBuilder<FeedbackBloc, FeedbackState>(builder: (context, state) {
      return CustomTextField(
          // keyboardType: TextInputType.emailAddress,
          // style: const TextStyle(color: Colors.black),
          hintText: "Email(optional)",
          // maxLines: 10,
          onChanged: (value) => context
              .read<FeedbackBloc>()
              .add(FeedbackEmailChanged(feedbackEmail: value)));
    });
    /*return const CustomTextField(
      hintText: "Email(optional)",
    );*/
  }

  Widget buildFeedbackForm() {
    return BlocBuilder<FeedbackBloc, FeedbackState>(builder: (context, state) {
      return CustomTextField(
          // keyboardType: TextInputType.emailAddress,
          // style: const TextStyle(color: Colors.black),
          hintText: "Please briefly describe the issue",
          maxLines: 10,
          validator: (value) =>
              state.isValidfeebackIssue ? null : "Minimum 10 characters",
          onChanged: (value) => context
              .read<FeedbackBloc>()
              .add(FeedbackIssueChanged(feebackIssue: value)));
    });
    /* return const SizedBox(
        height: 200,
        child: CustomTextField(
          hintText: "Please briefly describe the issue",
          maxLines: 10,
        ));*/
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

  List<String> selectOption(String optionName) {
    if (reasons.contains(optionName)) {
      reasons.remove(optionName);
    } else {
      reasons.add(optionName);
    }
    return reasons;
  }
}
