import 'package:aiimscycle/database/table/cycle_table.dart';
import 'package:aiimscycle/database/table/user_profile.dart';
import 'package:aiimscycle/database/table/user_table.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../database/database_helper.dart';
import '../../database/table/login_table.dart';

part 'login_db_state.dart';

class LoginDbCubit extends Cubit<LoginDbState> {
  LoginDbCubit() : super(LoginDbInitial());

  void setAppData({
    required String userId,
    required String password,
    required String sessionId,
    required String userRole,
  }) {
    print('$userId');
    print('$password');
    print('$sessionId');
    emit(LoginDbLoading());
    try {
      // Map<String, dynamic> data = {
      //   'userId': userId,
      //   'password': password,
      //   'sessionId': sessionId,
      // };
      Map<String, dynamic> data = {};
      data[LoginTable.password] = password;
      data[LoginTable.userId] = userId;
      data[LoginTable.sessionId] = sessionId;
      data[LoginTable.userRole] = userRole;
      // Call insert function to insert data into the table
      LoginTable().insert(data);
      // emit(LoggerDbInsert());
    } catch (e) {
      emit(LoginDbError());
      print('error');

      print(e);
    }
  }

  Future<void> getUserData() async {
    emit(LoginDbLoading());

    try {
      // List<LogDataClass> logDataClass = [];
      List<Map<String, dynamic>> loadedPlayList = await LoginTable().getUserData();

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
      emit(LoginDbError());

      print(e);
    }
  }

  Future<void> deleteUserData() async {
    emit(LoginDbLoading());

    try {
      await LoginTable().deleteUserData();
      await UserTable().deleteUserData();
      await ProfileTable().deleteProfile();
      await CycleTable().deleteAllCycles();

      emit(LoginDbDeleted());
    } catch (e) {
      emit(LoginDbError());

      print("Error deleting note: $e");
    }
  }
}
