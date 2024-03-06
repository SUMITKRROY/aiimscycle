import 'dart:convert';
import 'dart:developer';
import 'package:aiimscycle/utils/service.dart' as myService;
import 'dart:async';

import 'package:aiimscycle/config/route.dart' ;

class API {
  final Route route = Route();

  API();

  Future<dynamic> login(String mobileNo, String password) async {
    try{
      var url = '${route.login}?j_username=$mobileNo&j_password=$password&loginBy=password';
    var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      var response = await myService.Service.post(url,headers,{});

      if (response.statusCode == 200) {
        log(json.encode(response.data));
        return true;
      }
      else {
        log("response.statusMessage");
        return response.statusMessage;
      }
    } catch(e) {
      log("e $e");
      return "$e";
    }
  }

  Future<dynamic> register(String fName, String employee, String contact, String idFront, String idBack, String profile, String password) async {
   try{
     var url = route.register;
     var headers = {
       'Content-Type': 'application/json',
     };
     var body = {
       "fullname": fName,
       "contactNo": contact,
       "employeeCode": employee,
       "profile": profile,
       "idCard": idFront,
       "idCardBack": idBack,
       "password": password
     };
     log("something");
     var response = await myService.Service.postWithBody(url: url, headers: headers, body: body);

     if (response.statusCode == 200) {
       log(json.encode(response.data));
       log("response.data${json.encode(response.data)}");
       return true;
     }
     else {
       log("${response.statusMessage}");
       return response.statusMessage;
     }
   }catch(e,stack){
     log("$e\n$stack");
     return "$e";
   }


    // You can return some response indicating the success or failure of the registration process
    // For now, let's return a success message

  }

}
