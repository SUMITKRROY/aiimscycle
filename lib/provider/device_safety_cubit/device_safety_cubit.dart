import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_device/safe_device.dart';

enum DeviceSafetyStatus { safe, rooted, developerOptionsEnabled }

class DeviceSafetyCubit extends Cubit<DeviceSafetyStatus> {
  DeviceSafetyCubit() : super(DeviceSafetyStatus.safe);

  void checkDeviceSafety() async {
    // Check if the device is rooted
    bool isRooted = await SafeDevice.isSafeDevice;

    // Check if developer options are enabled
    bool areDeveloperOptionsEnabled = await SafeDevice.isDevelopmentModeEnable;

    if (isRooted) {
      emit(DeviceSafetyStatus.rooted);
    } else if (areDeveloperOptionsEnabled) {
      emit(DeviceSafetyStatus.developerOptionsEnabled);
    } else {
      emit(DeviceSafetyStatus.safe);
    }
  }
}
