import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoute {
  //Base Url
  static String? myUrl = dotenv.env["apiBaseUrl"];

  static String? baseurl = myUrl;
  String login = "$baseurl/loginProcess";
  String register = "$baseurl/new_registration";
  String getUser = "$baseurl/get-my-details";
  String admin = "$baseurl/";
}
