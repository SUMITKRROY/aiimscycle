import 'package:aiimscycle/bloc/splash_cubit.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../components/logo_image.dart';
import 'exception_screen.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String screenName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    try {
      return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoImageWidget(
                  height: 200.h,
                  width: 200.w,
                ),
                Utils.getSizedBoxHeight(8.0),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "AIIMS Delhi",
                    style: TextStyle(fontSize: AppSizes.mediumTextSize * 2),
                  ),
                ),
                Utils.getSizedBoxHeight(24.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${CommonText.cycle}",
                    style: const TextStyle(fontSize: AppSizes.largeTextSize * 2),
                  ),
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
