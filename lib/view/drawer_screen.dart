import 'package:aiimscycle/view/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../route/route_generater.dart';
import '../config/theamdata.dart';
import '../components/appbar.dart';
import '../utils/image.dart';
import 'login.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        // shrinkWrap: true,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
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
                              backgroundColor: Colors.green,
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
                    'Sumit Roy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Add your onTap functionality here
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Notification'),
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToNotificationScreen(context);
            },
          ),
          ListTile(
            title: const Text('Setting'),
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToSettingsScreen(context);
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              MyRoutes.navigateToAboutScreen(context);
              // Add your onTap functionality here
            },
          ),
          Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: TextButton(
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
