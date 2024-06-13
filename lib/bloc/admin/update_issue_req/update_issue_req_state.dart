part of 'update_issue_req_cubit.dart';

@immutable
sealed class UpdateIssueReqState {}

final class UpdateIssueReqInitial extends UpdateIssueReqState {}

final class UpdateIssueReqLoading extends UpdateIssueReqState {}

final class UpdateIssueReqLoaded extends UpdateIssueReqState {}

final class UpdateIssueReqError extends UpdateIssueReqState {
  final String error;

  UpdateIssueReqError({required this.error});
}
