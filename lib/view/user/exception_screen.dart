import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExceptionScreen extends StatelessWidget {
  final String? errorDetails;

  ExceptionScreen({this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      errorMessage: errorDetails,
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String? errorMessage;

  CustomErrorWidget({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100.sp,
            ),
            SizedBox(height: 10.0),
            Text(
              'Error Occurred!',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              errorMessage ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
