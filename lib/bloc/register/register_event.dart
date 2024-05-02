part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class RegisterSuccessEvent extends RegisterEvent{
  String fName;
  String employee;
  String contact;
  String idFront;
  String idBack;
  String profile;
  String password;

  RegisterSuccessEvent(this.fName, this.employee, this.contact, this.idFront,
      this.idBack, this.profile, this.password);
}