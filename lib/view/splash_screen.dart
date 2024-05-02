import 'package:aiimscycle/bloc/splash_cubit.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoadedState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.logo,
                height: Utils.getScreenHeight(context) / 3,
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
  }
}
