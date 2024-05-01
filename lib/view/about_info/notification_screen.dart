import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'Notification\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                ),
              ),
              TextSpan(
                text: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
