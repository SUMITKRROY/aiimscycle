import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoute {
  //Base Url
  static String? baseurl = dotenv.env["apiBaseUrl"];
  String login = "$baseurl/loginProcess";
  String logout = "$baseurl/logout";
  String register = "$baseurl/new_registration";
  String getUser = "$baseurl/user/get-my-details";
  String getCycle = "$baseurl/user/get-cycle-details";
  String getIssueReq = "$baseurl/user/get-issue-request";
  String makeIssueReq = "$baseurl/user/make-issue-request";
  String withdrawIssueReq = "$baseurl/user/withdrawl-issue-request";
  String makeSurenderReq = "$baseurl/user/make-surrender-request";
  String admin = "$baseurl/";
}
