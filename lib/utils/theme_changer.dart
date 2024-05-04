import 'package:flutter/material.dart';

import '../bloc/theme_cubit/theme.dart';

class ThemeChanger {
  static ThemeMode getThemeMode(
      {required ThemeModeOption themeModeOption, required BuildContext context}) {
    if (themeModeOption == ThemeModeOption.System) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    } else if (themeModeOption == ThemeModeOption.Light) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
