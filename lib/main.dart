import 'package:aiimscycle/bloc/login_cubit/login_cubit.dart';
import 'package:aiimscycle/bloc/login_db_cubit/login_db_cubit.dart';
import 'package:aiimscycle/bloc/splash_cubit/splash_cubit.dart';
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
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/filter_log_cubit/filter_log_cubit.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Configuration config = Configuration();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
        BlocProvider<RegisterBloc>(create: (_) => RegisterBloc(config: config)),
        BlocProvider<LoggerDbCubit>(create: (_) => LoggerDbCubit()),
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
        BlocProvider<ConfigCubit>(create: (_) => ConfigCubit(configuration: config)),
        BlocProvider<DeviceSafetyCubit>(create: (_) => DeviceSafetyCubit()),
        BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LoginDbCubit>(create: (_) => LoginDbCubit()),
        BlocProvider<FilterLogCubit>(create: (_) => FilterLogCubit()),
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
              // home: HomeScreen(),
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
