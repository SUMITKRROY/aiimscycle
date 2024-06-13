part of 'cycle_inventory_cubit.dart';

@immutable
sealed class CycleInventoryState {}

final class CycleInventoryInitial extends CycleInventoryState {}

final class CycleInventoryLoading extends CycleInventoryState {}

final class CycleInventoryLoaded extends CycleInventoryState {
  final List<CycleInventoryModal> cycleInventoryModal;

  CycleInventoryLoaded({required this.cycleInventoryModal});
}

final class CycleInventoryError extends CycleInventoryState {
  final String error;

  CycleInventoryError({required this.error});
}
