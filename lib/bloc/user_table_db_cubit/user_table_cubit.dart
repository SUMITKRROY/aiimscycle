import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../database/table/user_table.dart';

part 'user_table_state.dart';

class UserTableCubit extends Cubit<UserTableState> {
  UserTableCubit() : super(UserTableInitial());

  var uuid = Uuid();

  // DateTime now = DateTime.now();

  void setAppData({
    required String userName,
    required String employeeId,
    required String userId,
    required String password,
    required String mobileNo,
    required String idFront,
    required String idBack,
    required String profilePicture,
    required String sessionId,
  }) {
    emit(UserTableLoading());
    try {
      // LogDataClass logDataClass = LogDataClass(
      //   id: uuid.v4(),
      //   description: description,
      //   screenName: screenName,
      //   date: formattedDate.toString(),
      //   time: formattedTime.toString(),
      // );
      Map<String, dynamic> data = {
        'userName': userName,
        'employeeId': employeeId,
        'userId': userId,
        'password': password,
        'mobileNo': mobileNo,
        'idFront': idFront,
        'idBack': idBack,
        'profilePicture': profilePicture,
        'sessionId': sessionId,
      };
      // Call insert function to insert data into the table
      UserTable().insert(data);
      print("data ${data}");
      // emit(LoggerDbInsert());
    } catch (e) {
      emit(UserTableError());
      print('error');

      print(e);
    }
  }

  Future<void> getAppData() async {
    emit(UserTableLoading());

    try {
      // List<LogDataClass> logDataClass = [];
      List<Map<String, dynamic>> loadedPlayList = await UserTable().getUserData();

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

      // emit(LoggerDbLoaded(loadedPlayList: loadedPlayList));
    } catch (e) {
      emit(UserTableError());

      print(e);
    }
  }

  Future<void> deleteAppData({required int id}) async {
    emit(UserTableLoading());

    try {
      await UserTable().deleteUserData();
    } catch (e) {
      emit(UserTableError());

      print("Error deleting note: $e");
    }
  }
}
