// ignore_for_file: always_specify_types

import 'package:feedback/Authentication/authrepo.dart';
import 'package:feedback/Authentication/formsubmit.dart';
import 'package:feedback/feedback/feedback1/feedback1event.dart';
import 'package:feedback/feedback/feedback1/feedback1state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc({this.authRepo})
      : super(FeedbackState()) {
    on<FeedbackIssueChanged>((event, emit) {
      emit(state.copyWith(feebackIssue: event.feebackIssue));
      print(event.feebackIssue);
    });
    on<FeedbackEmailChanged>((event, emit) {
      emit(state.copyWith(feedbackEmail: event.feedbackEmail));
    });
    on<FeedbackReasonChanged>((event, emit) {
      emit(state.copyWith(reasons: event.reason));
      print(event.reason);
    });
    on<FeedbackSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo!.feedbackSubmit(feedbackissue: state.feebackIssue,feedbackreasons: state.reasons);
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
  final AuthRepository? authRepo;
}
