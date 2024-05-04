import 'package:aiimscycle/bloc/splash_cubit.dart';
import 'package:aiimscycle/configuration.dart';
import 'package:aiimscycle/bloc/app_settings_cubit/app_settings_cubit.dart';
import 'package:aiimscycle/bloc/config_cubit/config_cubit.dart';
import 'package:aiimscycle/bloc/device_safety_cubit/device_safety_cubit.dart';
import 'package:aiimscycle/bloc/logger_db_cubit/logger_db_cubit.dart';
import 'package:aiimscycle/bloc/login/login_bloc.dart';
import 'package:aiimscycle/bloc/register/register_bloc.dart';
import 'package:aiimscycle/route/pageroute.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/view/about_info/privacy_policy.dart';
import 'package:aiimscycle/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/theme_cubit/theme.dart';
import 'config/theamdata.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load(fileName: 'assets/.env');
  Configuration config = Configuration();
  runApp(MyApp(config: config));
}

class MyApp extends StatelessWidget {
  Configuration config;

  MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(config: config)),
        BlocProvider<RegisterBloc>(create: (_) => RegisterBloc(config: config)),
        BlocProvider<LoggerDbCubit>(create: (_) => LoggerDbCubit()),
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
        BlocProvider<ConfigCubit>(create: (_) => ConfigCubit(configuration: config)),
        BlocProvider<DeviceSafetyCubit>(create: (_) => DeviceSafetyCubit()),
        BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeCubit, ThemeModeOption>(
          builder: (context, themeMode) {
            return MaterialApp(
              initialRoute: RoutePath.splashScreenPage,
              onGenerateRoute: MyRoutes.generateRoute,
              debugShowCheckedModeBanner: false,
              title: CommonText.cycle,
              themeMode: _getThemeMode(themeModeOption: themeMode, context: context),
              darkTheme: darkMode,
              theme: lightMode,
              //  home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }

  ThemeMode _getThemeMode(
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
