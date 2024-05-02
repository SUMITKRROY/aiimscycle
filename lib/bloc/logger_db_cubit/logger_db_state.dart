part of 'logger_db_cubit.dart';

@immutable
sealed class LoggerDbState {}

final class LoggerDbInitial extends LoggerDbState {}
final class LoggerDbLoading extends LoggerDbState {}
final class LoggerDbInsert extends LoggerDbState {}
final class LoggerDbLoaded extends LoggerDbState {
  List<Map<String, dynamic>> loadedPlayList;
  // List <LogDataClass> logDataClass;
  LoggerDbLoaded ({required this.loadedPlayList});
}
final class LoggerDbDeleted extends LoggerDbState {}
final class LoggerDbError extends LoggerDbState {}
