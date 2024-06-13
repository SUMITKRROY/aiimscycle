import 'package:dio/dio.dart';

import '../../../config/api_route.dart';
import '../../../utils/dio_helper.dart';

class AdminCycleReqRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> getAdminIssueReq() async {
    try {
      String? token = await getToken.getToken();

      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      final response = await dio.get(route.adminCycleReqUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
