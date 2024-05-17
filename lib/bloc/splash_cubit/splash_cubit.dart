import 'dart:async';
import 'package:aiimscycle/database/table/login_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState()) {
    splashRunTime(const Duration(seconds: 3));
  }

  splashRunTime(Duration duration) async {
    String? checkRole = await getLoginData();
    await Future.delayed(duration);
    emit(SplashLoadedState(checkRole: checkRole));
  }

  Future<String?> getLoginData() async {
    try {
      List<Map<String, dynamic>> localData = await LoginTable().getUserData();

      String? userId = localData.first[LoginTable.userId];
      String? password = localData.first[LoginTable.password];
      String? sessionId = localData.first[LoginTable.sessionId];
      String? userRole = localData.first[LoginTable.userRole];
      
      if (userId != null || password != null || sessionId != null || userRole != null) {
        return userRole;
      } else {
        return '';
      }
    } catch (e) {
      emit(SplashErrorState(error: 'No Specified Role'));
      return '';
    }
  }
}
