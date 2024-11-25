import 'dart:async';

import 'package:aiimscycle/bloc/splash_cubit/splash_cubit.dart';
import 'package:aiimscycle/database/table/app_table.dart';
import 'package:aiimscycle/view/Admin/admin_home_page.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../components/logo_image.dart';
import '../database/table/cycle_table.dart';
import '../route/pageroute.dart';
import 'Admin/admin_home_page.dart';
import 'extra_screen/exception_screen.dart';
import 'auth_screen/login.dart';
import 'user/cycle_detail_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String screenName = 'SplashScreen';
 Map<String, dynamic> appDetailSet = {};

  @override
  void initState() {
    appTableSet();
    super.initState();
  }

  void appTableSet() async{
    try{
      appDetailSet[AppTable.clientId] = 1;
      appDetailSet[AppTable.theme] = "System";
      appDetailSet[AppTable.language] = "System";
      appDetailSet[AppTable.debugFlag] = "true";
      appDetailSet[AppTable.logFlag] = "true";

      await AppTable().insert(appDetailSet);
    }catch(e){
      print("error $e");
    }

  }

  @override
  Widget build(BuildContext context) {
    try {
      return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) async {
          Timer(Duration(seconds: 3), () {
          if (state is SplashLoadedState) {
            // print(state.checkRole);
            if (state.checkRole == 'ROLE_SuperAdmin' || state.checkRole == 'ROLE_Admin') {
              Navigator.pushReplacementNamed(context, RoutePath.adminHomePage);
            } else if (state.checkRole == 'ROLE_User') {
              Navigator.pushReplacementNamed(context, RoutePath.homeScreen);
            }
          } else {
            Navigator.pushReplacementNamed(context, RoutePath.login);
          }
          if (state is SplashErrorState) {
            // Utils.snackbarToast('Please Define Your Role');
          }
          });

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
