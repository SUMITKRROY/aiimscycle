import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/app_settings_cubit/app_settings_cubit.dart';
import '../bloc/config_cubit/config_cubit.dart';
import '../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../components/appbar.dart';
import '../route/route_generater.dart';
import '../utils/helper_text.dart';
import 'exception_screen.dart';

class SettingsScreen extends StatelessWidget {
  final String screenName = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) => SettingsCubit(),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const CustomAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: const Text('Theme'),
                      trailing: DropdownButton<ThemeOption>(
                        value: state.theme,
                        onChanged: (ThemeOption? newValue) {
                          if (newValue != null) {
                            context.read<SettingsCubit>().setTheme(newValue);
                          }
                        },
                        items: ThemeOption.values.map((ThemeOption option) {
                          return DropdownMenuItem<ThemeOption>(
                            value: option,
                            child: Text(option.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    ),
                    ListTile(
                      title: const Text('Language'),
                      trailing: DropdownButton<LanguageOption>(
                        value: state.language,
                        onChanged: (LanguageOption? newValue) {
                          if (newValue != null) {
                            context.read<SettingsCubit>().setLanguage(newValue);
                          }
                        },
                        items: LanguageOption.values.map((LanguageOption option) {
                          return DropdownMenuItem<LanguageOption>(
                            value: option,
                            child: Text(option.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    SwitchListTile(
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.white,
                      inactiveThumbColor: Colors.black,
                      title: const Text('Debug'),
                      value: state.debug,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleDebug(value);
                      },
                    ),
                    SwitchListTile(
                      activeColor: Colors.green,
                      inactiveTrackColor: state.debug ? Colors.white : Colors.grey,
                      inactiveThumbColor: Colors.black,
                      title: const Text('Logger'),
                      value: state.logger,
                      onChanged: (value) {
                        if (state.debug) {
                          context.read<SettingsCubit>().toggleLogger(value);
                        }
                      },
                    ),
                    ListTile(
                      title: const Text('Auto Clear Log'),
                      trailing: DropdownButton<LogOption>(
                        value: state.logOption,
                        onChanged: (LogOption? newValue) {
                          if (newValue != null) {
                            context.read<SettingsCubit>().setLogOption(newValue);
                          }
                        },
                        items: LogOption.values.map((LogOption option) {
                          return DropdownMenuItem<LogOption>(
                            value: option,
                            child: Text(option.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 60.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(side: BorderSide())),
                              onPressed: () {},
                              child: Text('Send Logs'),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(side: BorderSide())),
                              onPressed: () {},
                              child: Text('Clear Logs'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    GestureDetector(
                      onTap: () {
                        MyRoutes.navigateToVersionScreen(context);
                      },
                      child: ListTile(
                        title: Text('Version'),
                        trailing: BlocBuilder<ConfigCubit, ConfigState>(
                          builder: (context, state) {
                            if (state is ConfigLoadedState) {
                              return Text(
                                state.version ?? '',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                              );
                            } else {
                              return Text(
                                ' No Version Specified',
                                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
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
