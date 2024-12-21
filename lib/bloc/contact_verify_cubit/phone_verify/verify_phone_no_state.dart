part of 'verify_phone_no_bloc.dart';

@immutable
abstract class VerifyPhoneNoState {}

class VerifyPhoneNoInitial extends VerifyPhoneNoState {}

class VerifyPhoneNoLoading extends VerifyPhoneNoState {}

class VerifyPhoneNoSuccess extends VerifyPhoneNoState {
  final String message;

  VerifyPhoneNoSuccess({required this.message});
}
class VerifyOtpSuccess extends VerifyPhoneNoState {
}


class VerifyPhoneNoError extends VerifyPhoneNoState {
  final String error;

  VerifyPhoneNoError({required this.error});
}
class VerifyOtpError extends VerifyPhoneNoState {
  final String error;

  VerifyOtpError({required this.error});
}
