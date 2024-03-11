import 'dart:async';
import 'dart:io';

import 'package:aiimscycle/view/login.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:aiimscycle/view/register.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PermissionService();
    _navigater();
  }


    PermissionService() async {
 // static Future<bool> checkPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
  Permission.notification,
  Permission.location,
  Permission.mediaLibrary,
  Permission.microphone,
  ].request();

  bool allGranted = true;

  statuses.forEach((permission, status) {
  if (!status.isGranted) {
  allGranted = false;
  // You can show a message to request permission here
  // For example:
  // _showPermissionMessage(permission);
  }
  });

  return allGranted;
  }

  // Example method to show a message for permission request
  // void _showPermissionMessage(Permission permission) {
  //   // Implement your message display logic here
  // }



  Future<void> initPlatformState() async {
try{

}catch(e){}

  }

  Future<void> _navigater() async {
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
           Image.asset(ImagePath.logo,height: Utils.getScreenHeight(context)/3,),
       Utils.getSizedBoxHeight(8.0),
           const Align(
             alignment: Alignment.center,
             child: Text("AIIMS Delhi",style: TextStyle(fontSize: AppSizes.mediumTextSize*2),),
           ),
           Utils.getSizedBoxHeight(24.0),
           Align(
             alignment: Alignment.bottomCenter,
             child: Text("${CommonText.cycle}",style: const TextStyle(fontSize: AppSizes.largeTextSize*2),),
           ),
         ],
       ),
     ),
    );
  }
}
