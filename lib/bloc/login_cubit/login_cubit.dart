import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../dio_error_helper.dart';
import '../../modal/modal.dart';
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
        LoginModal loginModal = LoginModal.fromJson(response.data);

        emit(LoginLoaded(loginModal: loginModal));
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
