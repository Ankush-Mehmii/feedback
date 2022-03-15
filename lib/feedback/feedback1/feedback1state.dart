import 'package:feedback/Authentication/formsubmit.dart';

class FeedbackState {
  FeedbackState({
    this.feebackIssue = '',
    this.reasons = const <String>['Suggestions'],
    this.feedbackEmail = '',
    this.formStatus = const InitialFormStatus(),
  });
  final String feebackIssue;
  bool get isValidfeebackIssue => feebackIssue.length > 9;
  final String feedbackEmail;
  final List<String> reasons;
  bool get isreasonsempty => reasons.isNotEmpty;

  final FormSubmissionStatus formStatus;

  FeedbackState copyWith({
    String? feebackIssue,
    List<String>? reasons,
    String? feedbackEmail,
    FormSubmissionStatus? formStatus,
  }) {
    return FeedbackState(
      feebackIssue: feebackIssue ?? this.feebackIssue,
      feedbackEmail: feedbackEmail?? this.feebackIssue,
      reasons: reasons ?? this.reasons,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

