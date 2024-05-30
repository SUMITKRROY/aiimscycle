import 'package:dio/dio.dart';

import '../../config/api_route.dart';
import '../../utils/dio_helper.dart';

class WithdrawIssueReqRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> withdrawIssueReq(String reqId) async {
    try {
      String? token = await getToken.getToken();

      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.post("${route.withdrawIssueReq}/$reqId");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
