part of 'login_bloc.dart';


abstract class LoginEvent {}
class GetPhoneNo extends LoginEvent{
  String phone;
  String password;


  GetPhoneNo({ required this.phone, required this.password,});
}
class SentOtp extends LoginEvent{
  String phone;

  SentOtp(this.phone);
}