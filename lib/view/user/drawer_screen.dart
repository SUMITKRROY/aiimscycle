import 'package:aiimscycle/bloc/log_out_cubit/logout_cubit.dart';
import 'package:aiimscycle/bloc/login_cubit/login_cubit.dart';
import 'package:aiimscycle/bloc/login_db_cubit/login_db_cubit.dart';
import 'package:aiimscycle/bloc/profile_cubit/profile_cubit.dart';
import 'package:aiimscycle/database/table/login_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_listtile.dart';
import '../../route/route_generater.dart';
import '../../config/theamdata.dart';
import '../../components/appbar.dart';
import '../../utils/image.dart';
import '../../utils/utils.dart';
import '../auth_screen/login.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        // shrinkWrap: true,
        children: <Widget>[
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Container(
                  width: double.maxFinite,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorsData.tealColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 90.w,
                          height: 90,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage: AssetImage(
                                    ImagePath.profile,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  MyRoutes.navigateToProfileEditScreen(context);
                                },
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: ColorsData.topbarBackgroundColor,
                                    radius: 15,
                                    child: Transform.translate(
                                      offset: Offset(-2, -2),
                                      child: IconButton(
                                        onPressed: () {
                                          MyRoutes.navigateToProfileEditScreen(context);
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Add some space between avatar and text
                        Text(
                          state.profileModal.fullname ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container(
                width: double.maxFinite,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorsData.tealColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  ImagePath.profile,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                MyRoutes.navigateToProfileEditScreen(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: ColorsData.topbarBackgroundColor,
                                  radius: 15,
                                  child: Transform.translate(
                                    offset: Offset(-2, -2),
                                    child: IconButton(
                                      onPressed: () {
                                        MyRoutes.navigateToProfileEditScreen(context);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Add some space between avatar and text
                      const Text(
                        'UserName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          CustomListTile(
              leadingIcon: const Icon(Icons.person),
              label: 'Profile',
              onTap: () {
                Navigator.pop(context);
                MyRoutes.navigateToProfileScreen(context);
              }),
          // ListTile(
          //   title: const Text('Profile'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          //   },
          // ),
          CustomListTile(
              leadingIcon: const Icon(Icons.home),
              label: 'Home',
              onTap: () => Navigator.pop(context)),
          CustomListTile(
            leadingIcon: const Icon(Icons.notification_important),
            label: 'Notification',
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToNotificationScreen(context);
            },
          ),
          // ListTile(
          //   title: const Text('Home'),
          //   onTap: () {
          //     // Add your onTap functionality here
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: const Text('Notification'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     MyRoutes.navigateToNotificationScreen(context);
          //   },
          // ),
          CustomListTile(
            leadingIcon: const Icon(Icons.settings),
            label: 'Setting',
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToSettingsScreen(context);
            },
          ),
          // ListTile(
          //   title: const Text('Setting'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     MyRoutes.navigateToSettingsScreen(context);
          //     // Add your onTap functionality here
          //   },
          // ),
          CustomListTile(
            leadingIcon: const Icon(Icons.info),
            label: 'About Us',
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToAboutScreen(context);
            },
          ),
          // ListTile(
          //   title: const Text('About Us'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     MyRoutes.navigateToAboutScreen(context);
          //     // Add your onTap functionality here
          //   },
          // ),
          Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 150.w,
              margin: EdgeInsets.only(bottom: 10.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(side: const BorderSide(width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                    ),
                    MultiBlocListener(
                      listeners: [
                        BlocListener<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is LogoutLoaded) {
                              Navigator.pop(context);
                              BlocProvider.of<LoginDbCubit>(context).deleteUserData();
                            }
                            if (state is LogoutLoading) {
                              Utils.showLoadingProgress(context);
                            }
                            if (state is LogoutError) {
                              Navigator.pop(context);
                              Utils.snackbarToast(state.error);
                            }
                          },
                        ),
                        BlocListener<LoginDbCubit, LoginDbState>(
                          listener: (context, state) {
                            if (state is LoginDbDeleted) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                  (route) => false);
                            }
                          },
                        ),
                      ],
                      child: const Text(
                        'Logout',
                        // style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  BlocProvider.of<LogoutCubit>(context).userLogOut();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
