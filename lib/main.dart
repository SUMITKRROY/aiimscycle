import 'package:aiimscycle/configuration.dart';
import 'package:aiimscycle/provider/login/login_bloc.dart';
import 'package:aiimscycle/provider/register/register_bloc.dart';
import 'package:aiimscycle/utils/device_info.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/view/licence.dart';
import 'package:aiimscycle/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theamdata.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
   DeviceInfo.getAppInfo();
  Configuration config = Configuration ();
  runApp(MyApp(config:config));
}

class MyApp extends StatelessWidget {
  Configuration config;
  MyApp({super.key,required this.config});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(config:config)),
        BlocProvider<RegisterBloc>(create: (_) => RegisterBloc(config:config)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '${CommonText.cycle}',
        // themeMode: ThemeMode.system,
        // darkTheme: darkMode,
        theme: lightMode,
        home: const SplashScreen(),
      ),
    );
  }
}

