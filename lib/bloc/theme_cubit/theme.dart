import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeModeOption { System, Light, Dark }

class ThemeCubit extends Cubit<ThemeModeOption> {
  ThemeCubit() : super(ThemeModeOption.System);

  void setTheme(ThemeModeOption newThemeMode) {
    emit(newThemeMode);
  }

  void toggleTheme() {
    switch (state) {
      case ThemeModeOption.System:
        emit(ThemeModeOption.Light);
        break;
      case ThemeModeOption.Light:
        emit(ThemeModeOption.Dark);
        break;
      case ThemeModeOption.Dark:
        emit(ThemeModeOption.System);
        break;
    }
  }
}

