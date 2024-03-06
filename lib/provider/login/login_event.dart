part of 'login_bloc.dart';


abstract class LoginEvent {}
class GetPhoneNo extends LoginEvent{
  String phone;


  GetPhoneNo({ required this.phone});
}
class SentOtp extends LoginEvent{
  String phone;

  SentOtp(this.phone);
}