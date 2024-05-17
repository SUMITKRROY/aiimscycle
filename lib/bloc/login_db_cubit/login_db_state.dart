part of 'login_db_cubit.dart';

@immutable
sealed class LoginDbState {}

final class LoginDbInitial extends LoginDbState {}

final class LoginDbLoading extends LoginDbState {}

final class LoginDbLoaded extends LoginDbState {}

final class LoginDbDeleted extends LoginDbState {}

final class LoginDbError extends LoginDbState {}
