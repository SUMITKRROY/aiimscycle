part of 'make_issue_req_cubit.dart';

@immutable
sealed class MakeIssueReqState {}

final class MakeIssueReqInitial extends MakeIssueReqState {}

final class MakeIssueReqLoading extends MakeIssueReqState {}

final class MakeIssueReqLoaded extends MakeIssueReqState {
  final MakeIssueReqModal makeIssueReqModal;

  MakeIssueReqLoaded({required this.makeIssueReqModal});
}

final class MakeIssueReqError extends MakeIssueReqState {
  final String error;

  MakeIssueReqError({required this.error});
}
