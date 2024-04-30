import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/button.dart';
import 'package:aiimscycle/view/about_info/about.dart';
import 'package:aiimscycle/view/profile.dart';
import 'package:aiimscycle/view/resetpassword.dart';
import 'package:aiimscycle/view/version.dart';
import 'package:flutter/material.dart';

import '../components/custom_listtile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      body: Column(
        children: [
          const Text(
            "Setting",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
          ),
          const SizedBox(
            height: 08,
          ),
            CustomListTile(
              leadingIcon: const Icon(Icons.security),
              label: 'Change Password',
              screen: ResetPasswordScreen(),
            ),
          const CustomListTile(
            leadingIcon: Icon(Icons.info_outlined),
            label: 'Version',
            screen: VersionScreen(),
          ),
          CustomListTile(
            leadingIcon: const Icon(Icons.account_box_outlined),
            label: 'About',
            screen: About(),
          ),
        ],
      ),
    );
  }
}
