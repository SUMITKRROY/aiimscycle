import 'package:aiimscycle/database/table/login_table.dart';
import 'package:bloc/bloc.dart';
import '../../database/table/app_table.dart';

enum ThemeModeOption { System, Light, Dark }

class ThemeCubit extends Cubit<ThemeModeOption> {
  ThemeCubit() : super(ThemeModeOption.System);

  void setTheme(ThemeModeOption newThemeMode) async{
    //
    // String? userId = await localData();
    // ThemeModeOption? themeModeOption;
    // if(userId != null) {
    //   AppTable().updateThemeColor(userId, newThemeMode.toString());
    // } else {
    //   AppTable().updateThemeColor('1', newThemeMode.toString());
    // }
    // try {
    //   List<Map<String, dynamic>?> themeDetailSet = await AppTable().getAppTable();
    //   String myThemeMode =  themeDetailSet.first?[AppTable.theme] != null ? themeDetailSet.first![AppTable.theme] :  newThemeMode.toString();
    //   switch (myThemeMode) {
    //     case 'ThemeModeOption.Dark':
    //       themeModeOption = ThemeModeOption.Dark;
    //       break;
    //     case 'ThemeModeOption.Light':
    //       themeModeOption = ThemeModeOption.Light;
    //       break;
    //     default:
    //       themeModeOption = ThemeModeOption.System;
    //   }
    //   print(myThemeMode);
    //   print("theme ${themeModeOption.toString()}");
    //   emit(themeModeOption);

    // } catch (e) {
    //   emit(newThemeMode);
    // }

    emit(newThemeMode);

  }

  Future<ThemeModeOption> _initializeTheme() async {
    try {
      List<Map<String, dynamic>?> themeDetailSet = await AppTable().getAppTable();
      String myThemeMode =  themeDetailSet.first?[AppTable.theme] != null ? themeDetailSet.first![AppTable.theme] :  ThemeModeOption.System.toString();
      switch (myThemeMode) {
        case 'ThemeModeOption.Dark':
          return ThemeModeOption.Dark;
        case 'ThemeModeOption.Light':
      return ThemeModeOption.Light;

        default:
      return ThemeModeOption.System;
      }

    } catch (e) {
       return ThemeModeOption.System;
    }

  }


 Future<String?> localData () async {
    try {
      List<Map<String, dynamic>?> localData = await LoginTable().getUserData();
      String? userId = localData.first?[LoginTable.userId] ?? '1';
      return userId;
    } catch (e) {
      return null;
    }
  }

  // void toggleTheme() {
  //   switch (state) {
  //     case ThemeModeOption.System:
  //       emit(ThemeModeOption.Light);
  //       break;
  //     case ThemeModeOption.Light:
  //       emit(ThemeModeOption.Dark);
  //       break;
  //     case ThemeModeOption.Dark:
  //       emit(ThemeModeOption.System);
  //       break;
  //   }
  // }
}

