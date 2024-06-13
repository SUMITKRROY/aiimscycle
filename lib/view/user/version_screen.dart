import 'package:aiimscycle/bloc/config_cubit/config_cubit.dart';
import 'package:aiimscycle/components/logo_image.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/appbar.dart';
import '../../bloc/logger_db_cubit/logger_db_cubit.dart';

class VersionScreen extends StatefulWidget {
  const VersionScreen({super.key});

  @override
  State<VersionScreen> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  final String screenName = 'Version Screen';

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const CustomAppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Version",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                ),
              ),
              BlocBuilder<ConfigCubit, ConfigState>(
                builder: (context, state) {
                  if (state is ConfigLoadedState) {
                    return Text(
                      state.version ?? '',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                    );
                  } else {
                    return const Text(
                      ' No Version Specified',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              LogoImageWidget(
                height: 250.h,
                width: 250.h,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("AIIMS CYCLE",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Simplify staff transportation with our user-friendly cycle rental service. Staff can quickly browse and book cycles through the app, promoting eco-friendly commuting within the AIIMS campus.",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      BlocProvider.of<LoggerDbCubit>(context).setLogData(
        description: CommonText.widgetExceptionText,
        screenName: screenName,
      );
      return ExceptionScreen();
    }
  }
}
