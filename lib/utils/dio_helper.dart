import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApi {
  DioApi({this.isHeader = false});

  final bool isHeader;

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
      header = {"cookies": 'local data', "Content-Type": "application/x-www-form-urlencoded"};
    } else {
      header = null;
    }
    _dio.options.headers = header;
    return _dio;
  }
}
