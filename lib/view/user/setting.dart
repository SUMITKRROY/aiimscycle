import 'package:aiimscycle/bloc/filter_log_cubit/filter_log_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/app_settings_cubit/app_settings_cubit.dart';
import '../../bloc/config_cubit/config_cubit.dart';
import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../bloc/theme_cubit/theme.dart';
import '../../components/appbar.dart';
import '../../route/route_generater.dart';
import '../../utils/helper_text.dart';
import 'exception_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String screenName = 'SettingsScreen';
  int logFilterValue = 1;

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
                    BlocBuilder<ThemeCubit, ThemeModeOption>(
                      builder: (context, themeMode) {
                        return ListTile(
                            title: const Text('Theme'),
                            trailing: DropdownButton<ThemeModeOption>(
                              value: themeMode,
                              onChanged: (newThemeMode) {
                                BlocProvider.of<ThemeCubit>(context).setTheme(newThemeMode!);
                              },
                              items: [
                                DropdownMenuItem(
                                  value: ThemeModeOption.System,
                                  child: Text('Default'),
                                ),
                                DropdownMenuItem(
                                  value: ThemeModeOption.Light,
                                  child: Text('Light'),
                                ),
                                DropdownMenuItem(
                                  value: ThemeModeOption.Dark,
                                  child: Text('Dark'),
                                ),
                              ],
                            ));
                      },
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
                        title: const Text('Auto Log Filter'),
                        trailing: DropdownButton<int>(
                          value: logFilterValue,
                          onChanged: (days) {
                            logFilterValue = days!;
                            setState(() {});
                            BlocProvider.of<FilterLogCubit>(context).getFilterDates(days);
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1 Days'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3 Days'),
                            ),
                            DropdownMenuItem(
                              value: 7,
                              child: Text('7 Days'),
                            ),
                            DropdownMenuItem(
                              value: 15,
                              child: Text('15 Days'),
                            ),
                            DropdownMenuItem(
                              value: 30,
                              child: Text('30 days'),
                            ),
                            DropdownMenuItem(
                              value: 60,
                              child: Text('60 days'),
                            ),
                            DropdownMenuItem(
                              value: 0,
                              child: Text('Never'),
                            ),
                          ],
                        )),
                    Container(
                      width: double.maxFinite,
                      height: 60.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(side: BorderSide(color: Colors.lightBlue))),
                              onPressed: () {},
                              child: Text('Send Logs'),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(side: BorderSide(color: Colors.lightBlue))),
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
