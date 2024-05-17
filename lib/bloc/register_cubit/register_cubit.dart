import 'package:aiimscycle/bloc/register_cubit/register_modal.dart';
import 'package:aiimscycle/bloc/register_cubit/register_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void getRegister() async {
    emit(RegisterLoading());
    try {
      var data = {
        "fullname": "testq2",
        "contactNo": "9899374103",
        "employeeCode": "E231426",
        "password": "Sumit@1234"
      };

      final response = await RegisterRepo().getRegister(data);
      if (response.statusCode == 200) {
        RegisterModal registerModal = RegisterModal.fromJson(response.data);
        emit(RegisterLoaded(registerModal: registerModal));
      } else {
        emit(RegisterError(error: 'No data'));
      }
    } on DioException catch (e) {
      emit(RegisterError(error: handleDioError(e)));
    } catch (e) {
      emit(RegisterError(error: 'Something Went Wrong'));
    }
  }
}
