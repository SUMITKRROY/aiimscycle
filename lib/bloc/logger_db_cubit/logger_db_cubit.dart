import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../database/table/loger_table.dart';

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
        'description': description,
        'screenName': screenName,
        'date': formattedDate.toString(),
        'time': formattedTime.toString(),
      };
      // Call insert function to insert data into the table
      LoggerListTable().insert(data);
      print("data ${data}");
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
      // List<LogDataClass> logDataClass = [];
      List<Map<String, dynamic>> loadedPlayList = await LoggerListTable().getLogger();

      // for (var i in loadedPlayList) {
      //   logDataClass.add(LogDataClass(
      //       id:,
      //
      //       date: loadedPlayList[i].,
      //       description:,
      //
      //       screenName:,
      //       time:))
      // }

      emit(LoggerDbLoaded(loadedPlayList: loadedPlayList));
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
