import 'dart:convert';
import 'dart:developer';
import 'package:aiimscycle/utils/service.dart' as myService;
import 'dart:async';

import 'package:aiimscycle/config/api_route.dart';
import 'package:dio/dio.dart';

class API {
  final ApiRoute route = ApiRoute();

  API();

  Future<dynamic> login(String userId, String password) async {
    try {
      var url = '${route.login}?username=$userId&password=$password';

      var headers = {"cookies": 'local data', "Content-Type": "application/x-www-form-urlencoded"};
      var response = await myService.Service.post(url: url, headers: headers);
      print("url ${response.statusCode}");
      if (response.statusCode == 200) {
        log("${response.headers["set-cookie"]}");

        // Get cookies from response headers
        List<String> cookies = response.headers.map['set-cookie'];

        // Extract values from cookies
        for (String cookie in cookies) {
          // Split cookie string to extract key-value pairs
          List<String> parts = cookie.split(';');
          Map<String, String> cookieMap = {};

          for (String part in parts) {
            List<String> keyValue = part.split('=');
            if (keyValue.length == 2) {
              String key = keyValue[0].trim();
              String value = keyValue[1].trim();
              cookieMap[key] = value;
            }
          }

          // Extract value based on cookie name
          String sessionId = cookieMap['JSESSIONID'] ?? "N.A.";
          print('JSESSION ID: $sessionId');
        }

        return true;
      } else {
        log("response.statusMessage");
        return response.statusMessage;
      }
    } on DioException catch (e) {
      log("$e");
      final response = e.response;
      if (response != null) {
        if (response.statusCode == 302) {
          // call api for getting user details
          log("${response.headers["set-cookie"]}");

          return true;
        }
        final data = response.data;
        //final msg = data["message"];
        log("$data");
        return "$data";
      } else {
        log("something terrible happened");
        log("${e.message}");
        return e.message;
      }
    } catch (e) {
      log("something terrible happened");
      log("$e");
      return "$e";
    }
  }

  Future<dynamic> register(String fName, String employee, String contact, String idFront,
      String idBack, String profile, String password) async {
    try {
      var url = route.register;
      var headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
      };
      var body = {
        "fullname": fName,
        "contactNo": contact,
        "employeeCode": employee,
        "password": password
      };
      log("$body");
      var response = await myService.Service.postWithBody(url: url, headers: headers, body: body);

      log("Status code : ${response.statusCode}");

      if (response.statusCode == 201) {
        log(json.encode(response.data));
        log("response.data${json.encode(response.data)}");
        return true;
      } else {
        log("${response.statusMessage}");
        return response.statusMessage;
      }
    } on DioException catch (e) {
      log("$e");
      final response = e.response;
      if (response != null) {
        final data = response.data;
        final msg = data["message"];
        log("$msg");
        return msg;
      } else {
        log("something terrible happened");
        log("${e.message}");
        return e.message;
      }
    } catch (e) {
      log("something terrible happened");
      log("$e");
      return "$e";
    }

    // You can return some response indicating the success or failure of the registration process
    // For now, let's return a success message
  }

  Future<dynamic> getDetail() async {
    try {
      var url = route.getUser;

      var headers = {'Cookie': 'JSESSIONID=E3BED20A6FA74E3AC38F4F6787383C60'};
      var response = await myService.Service.post(url: url, headers: headers);
      print("url ${response.statusCode}");
      if (response.statusCode == 200) {
        log(json.encode(response.data));
        return true;
      } else {
        log("response.statusMessage");
        return response.statusMessage;
      }
    } on DioException catch (e) {
      log("$e");
      final response = e.response;
      final data = response?.data;
      //final msg = data["message"];
      log("$data");
      return "$data";
    } catch (e) {
      log("something terrible happened");
      log("$e");
      return "$e";
    }
  }

  Future<dynamic> admin() async {
    try {
      var url = route.admin;
      var headers = {};
      var response = await myService.Service.post(url: url, headers: headers);
      print("url ${response.statusCode}");
      if (response.statusCode == 200) {
        log(json.encode(response.data));
        return true;
      } else {
        log("response.statusMessage");
        return response.statusMessage;
      }
    } catch (e) {}
  }
}
