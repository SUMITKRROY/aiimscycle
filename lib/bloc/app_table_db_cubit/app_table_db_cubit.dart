import 'package:aiimscycle/database/table/app_table.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'app_table_db_state.dart';

class AppTableDbCubit extends Cubit<AppTableDbState> {
  AppTableDbCubit() : super(AppTableDbInitial());

  var uuid = Uuid();

  // DateTime now = DateTime.now();

  void setAppData({
    required String theme,
    required String language,
    required String debugFlag,
    required String logFlag,
  }) {
    emit(AppTableDbLoading());
    try {
      // LogDataClass logDataClass = LogDataClass(
      //   id: uuid.v4(),
      //   description: description,
      //   screenName: screenName,
      //   date: formattedDate.toString(),
      //   time: formattedTime.toString(),
      // );
      Map<String, dynamic> data = {
        'clientId': uuid.v4(),
        'theme': theme,
        'language': language,
        'debugFlag': debugFlag,
        'logFlag': logFlag,
      };
      // Call insert function to insert data into the table
      AppTable().insert(data);
      print("data ${data}");
      // emit(LoggerDbInsert());
    } catch (e) {
      emit(AppTableDbError());
      print('error');

      print(e);
    }
  }

  Future<void> getAppData() async {
    emit(AppTableDbLoading());

    try {
      // List<LogDataClass> logDataClass = [];
      List<Map<String, dynamic>> loadedPlayList = await AppTable().getAppTable();

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

      //emit(LoggerDbLoaded(loadedPlayList: loadedPlayList));
    } catch (e) {
      emit(AppTableDbError());

      print(e);
    }
  }

  Future<void> deleteAppData() async {
    emit(AppTableDbLoading());

    try {
      await AppTable().deleteAppTable();
    } catch (e) {
      emit(AppTableDbError());

      print("Error deleting note: $e");
    }
  }
}
