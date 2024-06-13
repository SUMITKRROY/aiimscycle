import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> fetchLocationAndCalculateDistance(
      {required double targetLatitude, required double targetLongitude}) async {
    emit(LocationLoading());
    try {
      // Request location permission
      PermissionStatus permission = await Permission.location.request();
      if (permission.isGranted) {
        // Location permission granted, fetch the user's location
        Position position =
            await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        double distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          targetLatitude,
          targetLongitude,
        );
        emit(LocationLoaded(position: position, distance: distance));
      } else {
        // Location permission denied
        emit(LocationError(error: 'Location permission denied. Please grant the permission.'));
      }
    } catch (e) {
      emit(LocationError(error: e.toString()));
    }
  }
}
