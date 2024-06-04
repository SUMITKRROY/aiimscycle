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

  Future<void> fetchLocationAndCalculateDistance(
      double targetLatitude, double targetLongitude) async {
    emit(LocationState(isLoading: true));
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );
      emit(LocationState(isLoading: false, position: position, distance: distance));
    } catch (e) {
      emit(LocationState(isLoading: false, error: e.toString()));
    }
  }
}
