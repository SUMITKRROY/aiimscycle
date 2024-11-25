import 'dart:convert';
import 'package:dio/dio.dart';

import '../../config/api_route.dart';
import '../../utils/dio_helper.dart';

class VerifyPhoneNoReqRepo {
  final ApiRoute route = ApiRoute();
  GetToken getToken = GetToken();

  Future<Response> verifyPhoneNoReqRepo({
    required String contact,
    required String employeeCode,
  }) async {
    try {
      // Prepare the data for the request
      var data = json.encode({
        "contactNo": contact,
        "employeeCode": employeeCode,
      });

      // Initialize Dio with headers enabled
      Dio dio = DioApi(isHeader: true).sendRequest;

      // Send POST request to the endpoint
      final response = await dio.post(route.sendOtp, data: data);

      // Return the response from the server
      return response;
    } catch (e) {
      // Log the error and rethrow it for higher-level handling
      print('Error in verifyPhoneNoReqRepo: $e');
      rethrow;
    }
  }
}
