import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState()) {
    splashRunTime(const Duration(seconds: 3));
  }

  splashRunTime(Duration duration) async {
    await Future.delayed(duration);
    emit(SplashLoadedState());
  }
}
