import 'package:aiimscycle/configuration.dart';
import 'package:aiimscycle/provider/app_settings_cubit/app_settings_cubit.dart';
import 'package:aiimscycle/provider/config_cubit/config_cubit.dart';
import 'package:aiimscycle/provider/device_safety_cubit/device_safety_cubit.dart';
import 'package:aiimscycle/provider/logger_db_cubit/logger_db_cubit.dart';
import 'package:aiimscycle/provider/login/login_bloc.dart';
import 'package:aiimscycle/provider/register/register_bloc.dart';
import 'package:aiimscycle/route/pageroute.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/view/about_info/privacy_policy.dart';
import 'package:aiimscycle/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          initialRoute: RoutePath.splashScreenPage,
          onGenerateRoute: MyRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          title: '${CommonText.cycle}',
          // themeMode: ThemeMode.system,
          // darkTheme: darkMode,
          theme: lightMode,
          //  home: HomeScreen(),
        ),
      ),
    );
  }
}
