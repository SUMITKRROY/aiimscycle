import 'dart:async';
import 'package:aiimscycle/view/login.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Permission _permission = Permission.location;
  bool _checkingPermission = false;
  var latitude;
  var longitude;
  String _output = '';


  @override
  void initState() {
    super.initState();
    // _checkPermission(_permission);
    checkAndRequestPermissions();
    _navigate();
  }

  Future<void> checkAndRequestPermissions() async {
    // Define the permissions you want to request
    List<Permission> permissions = [
      Permission.camera,
      Permission.phone,
      Permission.notification,
      Permission.location,
    ];

    // Request permissions
    Map<Permission, PermissionStatus> permissionStatuses = await permissions.request();
    bool allPermissionsGranted = true;
    // Loop through the results and handle them accordingly
    permissionStatuses.forEach((permission, permissionStatus) {
      if (permissionStatus == PermissionStatus.denied) {
        // Show a dialog to request permission
        allPermissionsGranted = false;
      }
    });
    if (allPermissionsGranted) {
      //getLocation();
      // _navigate();
    }
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    // User is logged in, navigate to NewsRoom
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.logo, height: Utils.getScreenHeight(context) / 3,),
            Utils.getSizedBoxHeight(8.0),
            const Align(
              alignment: Alignment.center,
              child: Text("AIIMS Delhi", style: TextStyle(fontSize: AppSizes.mediumTextSize * 2),),
            ),
            Utils.getSizedBoxHeight(24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("${CommonText.cycle}",
                style: const TextStyle(fontSize: AppSizes.largeTextSize * 2),),
            ),
          ],
        ),
      ),
    );
  }
}
