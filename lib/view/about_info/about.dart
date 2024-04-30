import 'package:aiimscycle/view/about_info/privacy_policy.dart';
import 'package:flutter/material.dart';

import '../../components/custom_listtile.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomListTile(
            leadingIcon: Icon(Icons.info_outlined),
            label: 'Privacy policy',
            screen: PrivacyPolicy(),
          ),
        ],
      ),
    );
  }
}
