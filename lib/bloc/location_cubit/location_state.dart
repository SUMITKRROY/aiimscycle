part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final Position? position;
  final double? distance;

  LocationLoaded({this.position, required this.distance});
}

final class LocationError extends LocationState {
  final String error;

  LocationError({required this.error});
}
