import 'package:aiimscycle/database/table/login_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/login_cubit/login_cubit.dart';
import '../../utils/utils.dart';

class ErrorScreen extends StatefulWidget {
  final String? errorMessage;
  final void Function()? onPressed;

  ErrorScreen({this.errorMessage, this.onPressed});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  String? userId;

  @override
  void initState() {
    automaticLogin();
    super.initState();
  }

  automaticLogin() async {
    List<Map<String, dynamic>> loginDetail = await LoginTable().getUserData();
    userId = loginDetail.first[LoginTable.userId];
    BlocProvider.of<LoginCubit>(context).getLogin(
      userId: loginDetail.first[LoginTable.userId],
      password: loginDetail.first[LoginTable.password],
      isNotConvert: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          LoginTable().updateSessionId(userId ?? '', state.jSessionId);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    automaticLogin();
                  },
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 100.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Something Went Wrong',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      child: Text('Retry'),
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
      ),
    );
  }
}
