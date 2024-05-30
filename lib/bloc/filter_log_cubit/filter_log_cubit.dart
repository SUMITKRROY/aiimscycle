import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../database/table/loger_table.dart';
import '../login_db_cubit/log_data_modal.dart';

part 'filter_log_state.dart';

class FilterLogCubit extends Cubit<FilterLogState> {
  FilterLogCubit() : super(FilterLogInitial());

  Future<void> getFilterDates(int days) async {
    emit(FilterLogLoading());

    try {
      List<LogDataClass> logDataClass = [];
      List<Map<String, dynamic>> localData = await LoggerListTable().getLogger();
      logDataClass.clear();
      for (int i = 0; i < localData.length; i++) {
        logDataClass.add(LogDataClass(
          id: localData[i]['Id'],
          clientId: localData[i]['ClientId'],
          description: localData[i]['Description'],
          screenName: localData[i]['ScreenName'],
          date: localData[i]['Date'],
          time: localData[i]['Time'],
        ));
      }

      emit(FilterLogLoaded(logDataClass: getLogsWithinRange(logDataClass, days)));
    } catch (e) {
      emit(FilterLogError());
    }
  }

  List<LogDataClass> getLogsWithinRange(List<LogDataClass> logsList, int daysAgo) {
    List<LogDataClass> result = [];
    DateTime today = DateTime.now();
    DateTime days = today.subtract(Duration(days: daysAgo));

    for (LogDataClass log in logsList) {
      List<int> dateParts = log.date?.split('-').map(int.parse).toList() ?? [0];
      DateTime date = DateTime(dateParts[2], dateParts[1], dateParts[0]);

      if (date.isAfter(days) && date.isBefore(today)) {
        print("----------${log.date}-------");
        result.add(log);
      }
    }

    return result;
  }
}
