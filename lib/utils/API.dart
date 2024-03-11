import 'dart:convert';
import 'dart:developer';
import 'package:aiimscycle/utils/service.dart' as myService;
import 'dart:async';

import 'package:aiimscycle/config/route.dart' ;
import 'package:dio/dio.dart';

class API {
  final Route route = Route();

  API();

  Future<dynamic> login(String userId, String password) async {
    try{
      var url = '${route.login}?username=$userId&password=$password';

    var headers = {
      };
      var response = await myService.Service.post(url: url, headers: headers);
      print("url ${response.statusCode}");
      if (response.statusCode == 200) {
        log(json.encode(response.data));
        return true;
      }
      else {
        log("response.statusMessage");
        return response.statusMessage;
      }
    } on DioException catch(e){
      log("$e");
      final response = e.response;
      if(response!=null){
        if(response.statusCode == 302){
          // call api for getting user details
          log("${response.headers["set-cookie"]}");

          return true;
        }
        final data = response.data;
        //final msg = data["message"];
        log("$data");
        return "$data";
      }
      else{
        log("something terrible happened");
        log("${e.message}");
        return e.message;
      }
    }catch(e){
      log("something terrible happened");
      log("$e");
      return "$e";
    }
  }

  Future<dynamic> register(String fName, String employee, String contact, String idFront, String idBack, String profile, String password) async {
   try{
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
     }
     else {
       log("${response.statusMessage}");
       return response.statusMessage;
     }
   }on DioException catch(e){
     log("$e");
     final response = e.response;
     if(response!=null){
       final data = response.data;
       final msg = data["message"];
       log("$msg");
       return msg;
     }
     else{
       log("something terrible happened");
       log("${e.message}");
       return e.message;
     }
   }catch(e){
     log("something terrible happened");
     log("$e");
     return "$e";
   }


    // You can return some response indicating the success or failure of the registration process
    // For now, let's return a success message

  }

}
