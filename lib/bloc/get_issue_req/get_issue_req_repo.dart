import 'package:dio/dio.dart';

import '../../config/api_route.dart';
import '../../utils/dio_helper.dart';

class GetIssueReqRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> getIssueReq(String reqId) async {
    try {
      String? token = await getToken.getToken();

      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.post("${route.getIssueReq}/$reqId");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
