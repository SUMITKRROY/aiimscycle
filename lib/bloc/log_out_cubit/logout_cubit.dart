import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../config/api_route.dart';
import '../../database/table/login_table.dart';
import '../../dio_error_helper.dart';
import '../../utils/dio_helper.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  GetToken getToken = GetToken();
  final ApiRoute route = ApiRoute();

  void userLogOut() async {
    emit(LogoutLoading());
    try {
      String? token = await getToken.getToken();
      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.get(route.logout);

      if (response.statusCode == 200) {
        // User profileModal = User.fromJson(response.data['user']);
        // emit(LogoutLoaded(profileModal: profileModal));
        emit(LogoutLoaded());
      } else {
        emit(LogoutError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(LogoutError(error: handleDioError(e)));
    } catch (e) {
      emit(LogoutError(error: 'Something Went Wrong'));
    }
  }
}
