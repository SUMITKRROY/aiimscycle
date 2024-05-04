import 'package:aiimscycle/utils/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/theme_cubit/theme.dart';
import '../utils/image.dart';

class LogoImageWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const LogoImageWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeOption>(
      builder: (context, themeMode) {
        return Image.asset(
          ImagePath.logo,
          height: height ?? 70.h,
          width: width ?? 70.h,
          color: ThemeChanger.getThemeMode(themeModeOption: themeMode, context: context) ==
                  ThemeMode.dark
              ? Colors.white
              : Colors.black,
        );
      },
    );
  }
}
