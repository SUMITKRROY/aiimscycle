import 'package:aiimscycle/config/api_route.dart';
import 'package:dio/dio.dart';
import '../../database/table/login_table.dart';
import '../../utils/dio_helper.dart';

class ProfileRepo {
  final ApiRoute route = ApiRoute();

  Future<Response> getProfileData() async {
    try {
      List<Map<String, dynamic>> data = await LoginTable().getUserData();
      String? token = data.first[LoginTable.sessionId];
      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.get(route.getUser);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
