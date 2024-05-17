part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final RegisterModal registerModal;
  RegisterLoaded({required this.registerModal});
}

final class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
