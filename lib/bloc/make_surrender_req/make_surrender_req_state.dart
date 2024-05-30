part of 'make_surrender_req_cubit.dart';

@immutable
sealed class MakeSurrenderReqState {}

final class MakeSurrenderReqInitial extends MakeSurrenderReqState {}

final class MakeSurrenderReqLoading extends MakeSurrenderReqState {}

final class MakeSurrenderReqLoaded extends MakeSurrenderReqState {}

final class MakeSurrenderReqError extends MakeSurrenderReqState {
  final String error;

  MakeSurrenderReqError({required this.error});
}
