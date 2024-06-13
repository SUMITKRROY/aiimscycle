import 'package:dio/dio.dart';

import '../../../config/api_route.dart';
import '../../../utils/dio_helper.dart';

class CycleIssueUpdateRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> updateIssueReq({required String id, required bool status}) async {
    try {
      String? token = await getToken.getToken();

      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.post("${route.updateIssueReq}/$id/$status");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
