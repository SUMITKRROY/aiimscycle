import 'package:aiimscycle/database/table/login_table.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApi {
  DioApi({
    this.isHeader = false,
    this.token,
  });

  final bool isHeader;

  final String? token;

  static Map<String, dynamic>? header = {};

  final Dio _dio = Dio(BaseOptions(
      contentType: 'application/json',
      validateStatus: ((status) => true),
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120));

  Dio get sendRequest {
    if (isHeader) {
      header = {
        'Content-Type': 'application/json',
        'Cookie': 'JSESSIONID=${token}',
        // 'Cookie': 'JSESSIONID=A3BC773F3D78C7BD5CA66E7FD48CC3F7',
      };
    } else {
      header = null;
    }
    _dio.options.headers = header;
    return _dio;
  }
}

class GetToken {
  Future<String> getToken() async {
    List<Map<String, dynamic>> token = await LoginTable().getUserData();
    return token.first[LoginTable.sessionId];
  }
}
