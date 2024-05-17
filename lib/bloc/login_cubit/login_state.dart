part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final LoginModal loginModal;
  LoginLoaded({required this.loginModal});
}

final class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
