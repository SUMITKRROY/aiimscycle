part of 'withdraw_issue_req_cubit.dart';

@immutable
sealed class WithdrawIssueReqState {}

final class WithdrawIssueReqInitial extends WithdrawIssueReqState {}

final class WithdrawIssueReqLoading extends WithdrawIssueReqState {}

final class WithdrawIssueReqLoaded extends WithdrawIssueReqState {}

final class WithdrawIssueReqError extends WithdrawIssueReqState {
  final String error;

  WithdrawIssueReqError({required this.error});
}
