import 'package:aiimscycle/utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyCycleContainer extends StatelessWidget {
  const EmptyCycleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            ImagePath.emptyCycle,
          ),
          Text(
            "There is no pending cycle Req",
            style: TextStyle(color: Colors.blue, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
