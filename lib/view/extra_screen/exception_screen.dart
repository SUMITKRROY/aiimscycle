import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 100.sp,
              ),
              SizedBox(height: 10.0),
              Text(
                'Something Went Wrong',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Please click the button for send logs',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      Utils.snackbarToast('Log has been send');
                    },
                    child: Text('Send Logs'),
                  ))
              // Text(
              //   errorMessage ?? '',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 16.0),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
