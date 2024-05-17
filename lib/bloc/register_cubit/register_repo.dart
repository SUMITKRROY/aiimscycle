import 'package:dio/dio.dart';

import '../../utils/dio_helper.dart';

class RegisterRepo {
  Dio dio = DioApi().sendRequest;

  Future<Response> getRegister(var data) async {
    try {
      final response = await dio
          .post('https://cfapplication.aiims.edu/aiims-cycle/new_registration', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
