import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/app_settings_cubit/app_settings_cubit.dart';
import '../provider/config_cubit/config_cubit.dart';
import '../route/route_generater.dart';

class SettingsScreen extends StatelessWidget {
  final String? version = dotenv.env["version"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          child: Text(option == LanguageOption.english ? 'English' : 'Hindi'),
                        );
                      }).toList(),
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  SwitchListTile(
                    title: const Text('Debug'),
                    value: state.debug,
                    onChanged: (value) {
                      context.read<SettingsCubit>().toggleDebug(value);
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Logger'),
                    value: state.logger,
                    onChanged: (value) {
                      if (state.debug) {
                        context.read<SettingsCubit>().toggleLogger(value);
                      }
                    },
                  ),
                  ListTile(
                    title: const Text('Log Filter'),
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
  }
}
