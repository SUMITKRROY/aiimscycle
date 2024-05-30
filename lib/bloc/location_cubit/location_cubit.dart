import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationState {
  final bool isLoading;
  final Position? position;
  final double? distance;
  final String? error;

  LocationState({required this.isLoading, this.position, this.distance, this.error});
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(isLoading: false));

  Future<void> getCurrentLocation() async {
    emit(LocationState(isLoading: true));
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      emit(LocationState(isLoading: false, position: position));
    } catch (e) {
      emit(LocationState(isLoading: false, error: e.toString()));
    }
  }

  Future<void> calculateDistance(double targetLatitude, double targetLongitude) async {
    emit(LocationState(isLoading: true, position: state.position));
    try {
      if (state.position != null) {
        double distance = Geolocator.distanceBetween(
          state.position!.latitude,
          state.position!.longitude,
          targetLatitude,
          targetLongitude,
        );
        emit(LocationState(isLoading: false, position: state.position, distance: distance));
      } else {
        emit(LocationState(isLoading: false, error: 'Current position is not available.'));
      }
    } catch (e) {
      emit(LocationState(isLoading: false, error: e.toString()));
    }
  }
}
