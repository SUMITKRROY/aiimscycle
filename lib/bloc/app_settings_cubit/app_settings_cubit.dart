import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeOption { system, light, dark }

enum LanguageOption { system, english, hindi }

enum LogOption { one, three, week, month }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  void toggleDebug(bool value) {
    // If debug is turned off, keep the logger state unchanged
    bool loggerState = value ? state.logger : false;
    emit(state.copyWith(debug: value, logger: loggerState));
  }

  void toggleLogger(bool value) {
    emit(state.copyWith(logger: value));
  }

  void setTheme(ThemeOption theme) {
    emit(state.copyWith(theme: theme));
  }

  void setLogOption(LogOption logOption) {
    emit(state.copyWith(logOption: logOption));
  }

  void setLanguage(LanguageOption language) {
    emit(state.copyWith(language: language));
  }
}

class SettingsState {
  final bool debug;
  final bool logger;
  final ThemeOption theme;
  final LanguageOption language;
  final LogOption logOption;

  SettingsState({
    this.debug = false,
    this.logger = false,
    this.theme = ThemeOption.system,
    this.language = LanguageOption.system,
    this.logOption = LogOption.one, // Default to English
  });

  SettingsState copyWith({
    bool? debug,
    bool? logger,
    ThemeOption? theme,
    LanguageOption? language,
    LogOption? logOption,
  }) {
    return SettingsState(
      debug: debug ?? this.debug,
      logger: logger ?? this.logger,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      logOption: logOption ?? this.logOption,
    );
  }
}
