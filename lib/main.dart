import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_cubit.dart';
import 'package:aiimscycle/bloc/get_issue_req/get_issue_req_cubit.dart';
import 'package:aiimscycle/bloc/log_out_cubit/logout_cubit.dart';
import 'package:aiimscycle/bloc/login_cubit/login_cubit.dart';
import 'package:aiimscycle/bloc/login_db_cubit/login_db_cubit.dart';
import 'package:aiimscycle/bloc/make_issue_req_cubit/make_issue_req_cubit.dart';
import 'package:aiimscycle/bloc/make_surrender_req/make_surrender_req_cubit.dart';
import 'package:aiimscycle/bloc/profile_cubit/profile_cubit.dart';
import 'package:aiimscycle/bloc/splash_cubit/splash_cubit.dart';
import 'package:aiimscycle/bloc/withdraw-issue-request/withdraw_issue_req_cubit.dart';
import 'package:aiimscycle/configuration.dart';
import 'package:aiimscycle/bloc/app_settings_cubit/app_settings_cubit.dart';
import 'package:aiimscycle/bloc/config_cubit/config_cubit.dart';
import 'package:aiimscycle/bloc/device_safety_cubit/device_safety_cubit.dart';
import 'package:aiimscycle/bloc/logger_db_cubit/logger_db_cubit.dart';
import 'package:aiimscycle/bloc/register/register_bloc.dart';
import 'package:aiimscycle/route/pageroute.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bloc/filter_log_cubit/filter_log_cubit.dart';
import 'bloc/location_cubit/location_cubit.dart';
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
  // location req
  // await Permission.location.request();
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
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
        BlocProvider<LogoutCubit>(create: (_) => LogoutCubit()),
        BlocProvider<CycleDetailCubit>(create: (_) => CycleDetailCubit()),
        BlocProvider<MakeIssueReqCubit>(create: (_) => MakeIssueReqCubit()),
        BlocProvider<LocationCubit>(create: (_) => LocationCubit()),
        BlocProvider<GetIssueReqCubit>(create: (_) => GetIssueReqCubit()),
        BlocProvider<WithdrawIssueReqCubit>(create: (_) => WithdrawIssueReqCubit()),
        BlocProvider<MakeSurrenderReqCubit>(create: (_) => MakeSurrenderReqCubit()),
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
              // home: PaginationDemo(),
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
