part of 'app_table_db_cubit.dart';

@immutable
sealed class AppTableDbState {}

final class AppTableDbInitial extends AppTableDbState {}

final class AppTableDbLoading extends AppTableDbState {}

final class AppTableDbLoaded extends AppTableDbState {}

final class AppTableDbError extends AppTableDbState {}
