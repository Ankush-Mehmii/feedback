import 'package:flutter/material.dart';

class AuthRepository {
  Future<dynamic> feedbackSubmit(
       { @required String? feedbackissue,
     List<String>? feedbackreasons,}
  ) async {
    print('Feedback Submit');
    await Future<dynamic>.delayed(const Duration(seconds: 5));
    print('feedbackSubmit');
    throw Exception('failed feedbackSubmission');
  }
}