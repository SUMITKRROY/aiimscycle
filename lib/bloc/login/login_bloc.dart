// ignore_for_file: prefer_const_constructors

import 'package:aiimscycle/configuration.dart';
import 'package:bloc/bloc.dart';

import '../../utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Configuration config;
  LoginBloc({required this.config}) : super(LoginInitial()) {
    on<GetPhoneNo>((event, emit) async {
      // fetch all the event data from event object
      var mobileNo = event.phone;
      var password = event.password;
      var md5pass = Utils.convertToMD5(password);
      // convert password to md5
      emit(LoginLoading());

      // calling api

      var response = await config.api.login(mobileNo, md5pass);

      if (response is bool) {
        // response is bool
        // emit success
        emit(LoginSuccess());
      } else {
        // response is string
        // typecast response in string
        var resmsg = response as String;
        // emit failure
        emit(LoginError(resmsg));
      }
    });
    on<GetUserDetails>((event, emit) async {
      emit(LoginLoading());

      // calling api

      var response = await config.api.getDetail();

      if (response is bool) {
        // response is bool
        // emit success
        emit(LoginSuccess());
      } else {
        // response is string
        // typecast response in string
        var resmsg = response as String;
        // emit failure
        emit(LoginError(resmsg));
      }
    });
  }
}
