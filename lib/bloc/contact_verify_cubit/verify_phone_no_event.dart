part of 'verify_phone_no_bloc.dart';

@immutable
abstract class VerifyPhoneNoEvent {}

class VerifyPhoneNumberEvent extends VerifyPhoneNoEvent {
  final String phoneNumber;
  final String userId;

  VerifyPhoneNumberEvent({required this.phoneNumber, required this.userId});
}
