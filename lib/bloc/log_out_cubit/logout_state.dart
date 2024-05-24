part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutLoaded extends LogoutState {}

final class LogoutError extends LogoutState {
  final String error;

  LogoutError({required this.error});
}
