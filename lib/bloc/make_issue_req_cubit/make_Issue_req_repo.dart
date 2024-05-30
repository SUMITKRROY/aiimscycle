import 'dart:convert';

import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_modal.dart';
import 'package:dio/dio.dart';

import '../../config/api_route.dart';
import '../../utils/dio_helper.dart';
import 'make_Issue_req_modal.dart';

class MakeIssueReqRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> makeIssueReq({required CycleDetailModal cycleDetailModal}) async {
    try {
      String? token = await getToken.getToken();
      Dio dio = DioApi(isHeader: true, token: token).sendRequest;

      var data = cycleDetailModal.toJson();

      final response = await dio.post(route.makeIssueReq, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
