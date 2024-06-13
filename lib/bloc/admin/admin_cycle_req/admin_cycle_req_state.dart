part of 'admin_cycle_req_cubit.dart';

@immutable
sealed class AdminCycleReqState {}

final class AdminCycleReqInitial extends AdminCycleReqState {}

final class AdminCycleReqLoading extends AdminCycleReqState {}

final class AdminCycleReqLoaded extends AdminCycleReqState {
  final List<AdminIssueReqModal> adminIssueReqModal;
  final List<AdminIssueReqModal> adminSurrenderReqModal;

  AdminCycleReqLoaded({
    required this.adminIssueReqModal,
    required this.adminSurrenderReqModal,
  });
}

final class AdminCycleReqError extends AdminCycleReqState {
  final String error;

  AdminCycleReqError({required this.error});
}
