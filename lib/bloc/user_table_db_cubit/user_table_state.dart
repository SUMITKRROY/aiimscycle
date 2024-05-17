part of 'user_table_cubit.dart';

@immutable
sealed class UserTableState {}

final class UserTableInitial extends UserTableState {}

final class UserTableLoading extends UserTableState {}

final class UserTableLoaded extends UserTableState {}

final class UserTableError extends UserTableState {}
