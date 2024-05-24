import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoute {
  //Base Url
  static String? baseurl = dotenv.env["apiBaseUrl"];
  String login = "$baseurl/loginProcess";
  String logout = "$baseurl/logout";
  String register = "$baseurl/new_registration";
  String getUser = "$baseurl/user/get-my-details";
  String admin = "$baseurl/";
}
