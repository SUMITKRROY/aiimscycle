import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/device_info.dart';
import 'package:aiimscycle/utils/image.dart';
import '../components/appbar.dart';

class VersionScreen extends StatefulWidget {
  const VersionScreen({super.key});

  @override
  State<VersionScreen> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  // TextEditingController versionController =
  // TextEditingController(text: DeviceInfo.version);

  String? version;

  @override
  void initState() {
    start();
    super.initState();
  }

  void start()  {
     version = DeviceInfo.version;
    if (version != null) {
      print('App version: $version');
    } else {
      print('Failed to get app version.');
    }
  }


  // // Define the predefined version
  // String predefinedVersion = "1.0.0";
  //
  bool isFABEnabled = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Check if the current version is older than the predefined version
  //   if (compareVersions(versionController.text, predefinedVersion) < 0) {
  //     setState(() {
  //       isFABEnabled = true;
  //     });
  //   }
  // }
  //
  // // Function to compare two version strings
  // int compareVersions(String version1, String version2) {
  //   List<String> version1Parts = version1.split('.');
  //   List<String> version2Parts = version2.split('.');
  //
  //   for (int i = 0; i < 3; i++) {
  //     int v1 = int.parse(version1Parts[i]);
  //     int v2 = int.parse(version2Parts[i]);
  //     if (v1 < v2) {
  //       return -1;
  //     } else if (v1 > v2) {
  //       return 1;
  //     }
  //   }
  //   return 0;
  // }

  @override
  Widget build(BuildContext context) {
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
            Text(
              version ?? '',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              ImagePath.logo,
              height: 150,
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
      floatingActionButton: isFABEnabled
          ? FloatingActionButton(
        onPressed: () {
          // Add your update functionality here
        },
        child: const Text("Update"),
      )
          : null, // Disable FAB if the version is not older
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
