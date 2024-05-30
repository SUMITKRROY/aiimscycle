part of 'cycle_detail_cubit.dart';

@immutable
sealed class CycleDetailState {}

final class CycleDetailInitial extends CycleDetailState {}

final class CycleDetailLoading extends CycleDetailState {}

final class CycleDetailLoaded extends CycleDetailState {
  final CycleDetailModal cycleModal;

  CycleDetailLoaded({required this.cycleModal});
}

final class CycleDetailError extends CycleDetailState {
  final String error;

  CycleDetailError({required this.error});
}
