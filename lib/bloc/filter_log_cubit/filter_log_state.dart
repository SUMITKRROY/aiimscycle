part of 'filter_log_cubit.dart';

@immutable
sealed class FilterLogState {}

final class FilterLogInitial extends FilterLogState {}

final class FilterLogLoading extends FilterLogState {}

final class FilterLogLoaded extends FilterLogState {
  final List<LogDataClass> logDataClass;

  FilterLogLoaded({required this.logDataClass});
}

final class FilterLogError extends FilterLogState {}
