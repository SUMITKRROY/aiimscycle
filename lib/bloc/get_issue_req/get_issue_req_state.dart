part of 'get_issue_req_cubit.dart';

@immutable
sealed class GetIssueReqState {}

final class GetIssueReqInitial extends GetIssueReqState {}

final class GetIssueReqLoading extends GetIssueReqState {}

final class GetIssueReqLoaded extends GetIssueReqState {
  final GetIssueReqModal getIssueReqModal;

  GetIssueReqLoaded({required this.getIssueReqModal});
}

final class GetIssueReqError extends GetIssueReqState {
  final String error;

  GetIssueReqError({required this.error});
}
