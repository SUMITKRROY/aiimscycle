import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../database/table/loger_table.dart';
import '../login_db_cubit/log_data_modal.dart';

part 'logger_db_state.dart';

class LoggerDbCubit extends Cubit<LoggerDbState> {
  LoggerDbCubit() : super(LoggerDbInitial());

  var uuid = Uuid();
  DateTime now = DateTime.now();

  void setLogData({required String description, required String screenName}) {
    emit(LoggerDbLoading());

    var formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var formattedTime = DateFormat('HH:mm:ss').format(now);
    print('start fun');
    try {
      // LogDataClass logDataClass = LogDataClass(
      //   id: uuid.v4(),
      //   description: description,
      //   screenName: screenName,
      //   date: formattedDate.toString(),
      //   time: formattedTime.toString(),
      // );
      Map<String, dynamic> data = {
        'id': uuid.v4(),
        'clientId': "",
        'description': description,
        'screenName': screenName,
        'date': formattedDate.toString(),
        'time': formattedTime.toString(),
      };
      // Call insert function to insert data into the table
      LoggerListTable().insert(data);
      // emit(LoggerDbInsert());
    } catch (e) {
      emit(LoggerDbError());
      print('error');

      print(e);
    }
  }

  Future<void> getLogData() async {
    emit(LoggerDbLoading());

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

      print(localData.first['Id']);

      emit(LoggerDbLoaded(loadedData: localData, logDataClass: logDataClass));
    } catch (e) {
      emit(LoggerDbError());

      print(e);
    }
  }

  Future<void> deleteLogData() async {
    emit(LoggerDbLoading());

    try {
      await LoggerListTable().deleteLogger();
    } catch (e) {
      emit(LoggerDbError());

      print("Error deleting note: $e");
    }
  }
}
