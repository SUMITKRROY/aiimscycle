import 'package:aiimscycle/config/api_route.dart';
import 'package:dio/dio.dart';
import '../../utils/dio_helper.dart';

class LoginRepo {
  Dio dio = DioApi().sendRequest;
  final ApiRoute route = ApiRoute();

  Future<Response> getLogin(String userId, String password) async {
    try {
      final response = await dio.post('${route.login}?username=$userId&password=$password');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
