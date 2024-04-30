import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo{
  static String appName = '';
  static String packageName = '';
  static String version = '';
  static String buildNumber = '';

  static Future<void> getAppInfo() async {
    // Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
 try {
   PackageInfo packageInfo = await PackageInfo.fromPlatform();

   appName = packageInfo.appName;
   packageName = packageInfo.packageName;
   version = packageInfo.version;
   buildNumber = packageInfo.buildNumber;
 }on PlatformException {
   log('platform Exception');
 } catch (e) {
   log('exception');
 }

  }
}
