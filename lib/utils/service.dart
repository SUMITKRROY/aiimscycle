import 'dart:convert' as convert ;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Service{
  static int timeout = 20;

  static var dio = Dio();
  static get(url,headers) async {
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
        receiveTimeout: Duration(seconds: timeout)
      ),
    );
    return response;

  }

  static post(url,headers,body) async {

    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
        extra: body
      ),
    ).timeout(Duration(seconds: timeout));
    return response;
  }

 static Future<dynamic> postWithBody({required dynamic url, required dynamic headers, required dynamic body}) async {
    var headerBody = headers ?? {
      'Content-Type': 'application/json',
    };
    //var data = json.encode(body);
    if (kDebugMode) {
      print("headers: $headerBody");
      print("body: ${convert.jsonEncode(body)}");
    }


    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        followRedirects: false,
        // will not throw errors
        //validateStatus: (status) => true,
        headers: headers,
      ),
      data: body,
    ).timeout(Duration(seconds: timeout));
    return response;

  }

}