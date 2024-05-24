import 'package:aiimscycle/bloc/profile_cubit/profile_cubit.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/database/table/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appbar.dart';
import '../../route/route_generater.dart';
import '../../utils/image.dart';
import '../user/exception_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> ProfileData = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Loader();
        }
        if (state is ProfileLoaded) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: const CustomAppBar(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 85.r,
                    backgroundImage: AssetImage(ImagePath.profile),
                  ),
                  itemProfile('Name', state.profileModal.fullname ?? '', CupertinoIcons.person),
                  itemProfile('Phone', state.profileModal.contactNo ?? '', CupertinoIcons.phone),
                  itemProfile(
                      'Employee', state.profileModal.employeeCode ?? '', CupertinoIcons.location),
                  itemProfile('Email', state.profileModal.email ?? 'N.A.', CupertinoIcons.mail),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          MyRoutes.navigateToProfileEditScreen(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text('Edit Profile')),
                  )
                ],
              ),
            ),
          );
        } else {
          return ExceptionScreen();
        }
      },
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //       offset: Offset(0, 5),
        //       // color: Colors.grey.withOpacity(.2),
        //       spreadRadius: 2,
        //       blurRadius: 10)
        // ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        // tileColor: Colors.white,
      ),
    );
  }
}
