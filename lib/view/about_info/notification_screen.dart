import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../exception_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final String screenName = 'Notification Screen';

  @override
  Widget build(BuildContext context) {
    try {
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
    } catch (e) {
      BlocProvider.of<LoggerDbCubit>(context).setLogData(
        description: CommonText.widgetExceptionText,
        screenName: screenName,
      );
      return ExceptionScreen();
    }
  }
}
