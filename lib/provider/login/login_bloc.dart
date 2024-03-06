// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:aiimscycle/configuration.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Configuration config;
  LoginBloc({required this.config}) : super(LoginInitial()) {
    on<GetPhoneNo>((event, emit) async {
      // fetch all the event data from event object
var mobileNo = event.phone;
var password = event.phone;
      // convert password to md5


      emit(LoginLoading());

      // calling api

      var response = await config.api.login(mobileNo, password);


      if(response is bool){
        // response is bool
        // emit success

      }else{
        // response is string
        // typecast response in string
        var resmsg = response as String;
        // emit failure

      }

    });

  }
}
