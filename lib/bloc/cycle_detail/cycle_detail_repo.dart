import 'package:aiimscycle/config/api_route.dart';
import 'package:dio/dio.dart';
import '../../database/table/login_table.dart';
import '../../utils/dio_helper.dart';

class CycleRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> getCycleDetail(String cycleId) async {
    try {
      String? token = await getToken.getToken();

      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.post("${route.getCycle}/$cycleId");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
