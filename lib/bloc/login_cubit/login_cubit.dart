import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../dio_error_helper.dart';
import 'modal.dart';
import '../../utils/utils.dart';
import 'login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void getLogin(String userId, String password) async {
    emit(LoginLoading());
    try {
      final response = await LoginRepo().getLogin(userId, Utils.convertToMD5(password));
      if (response.statusCode == 200) {
        print("${response.headers["set-cookie"]}");

        // Get cookies from response headers
        List<String>? cookies = response.headers.map['set-cookie'];
        String sessionId = "";
        // Extract values from cookies
        for (String cookie in cookies!) {
          // Split cookie string to extract key-value pairs
          List<String> parts = cookie.split(';');
          Map<String, String> cookieMap = {};

          for (String part in parts) {
            List<String> keyValue = part.split('=');
            if (keyValue.length == 2) {
              String key = keyValue[0].trim();
              String value = keyValue[1].trim();
              cookieMap[key] = value;
            }
          }

          // Extract value based on cookie name
          sessionId = cookieMap['JSESSIONID'] ?? "N.A.";
          print('JSESSION ID: $sessionId');
          // respkons cookiies
          LoginModal loginModal = LoginModal.fromJson(response.data);

          emit(LoginLoaded(loginModal: loginModal, jSessionId: sessionId));
        }
      } else {
        emit(LoginError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(LoginError(error: handleDioError(e)));
    } catch (e) {
      emit(LoginError(error: 'Something Went Wrong'));
    }
  }
}
