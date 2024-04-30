import 'dart:typed_data';

import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/view/login.dart';
import 'package:aiimscycle/view/my_cycle_page.dart';
import 'package:aiimscycle/view/profile.dart';
import 'package:aiimscycle/view/resetpassword.dart';
import 'package:aiimscycle/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_qrcode_scanner/dynamsoft_barcode.dart';
import 'package:flutter_camera_qrcode_scanner/flutter_camera_qrcode_scanner.dart';

import '../components/appbar.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  ScannerViewController? controller;
  String _barcodeResults = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      ImagePath.profile,
                    ),
                  ),
                  const SizedBox(height: 08),
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

            // Divider(),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Add your onTap functionality here
              },
            ),

            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
            ),

            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primaryContainer)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: <Widget>[
        ScannerView(onScannerViewCreated: onScannerViewCreated),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100,
              child: SingleChildScrollView(
                child: Text(
                  _barcodeResults,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        child: const Text('Start Scan'),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          controller!.startScanning();
                        }),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Stop Scan"),
                    ),
                    MaterialButton(
                        child: const Text("Stop Scan"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          controller!.stopScanning();
                        })
                  ]),
            ),
          ],
        )
      ]),
    );
  }

  void onScannerViewCreated(ScannerViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    await controller.setLicense(
        'DLS2eyJoYW5kc2hha2VDb2RlIjoiMjAwMDAxLTE2NDk4Mjk3OTI2MzUiLCJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSIsInNlc3Npb25QYXNzd29yZCI6IndTcGR6Vm05WDJrcEQ5YUoifQ==');
    await controller.init();
    await controller.startScanning(); // auto start scanning
    controller.scannedDataStream.listen((results) {
      setState(() {
        _barcodeResults = getBarcodeResults(results);
      });
    });
  }

  String getBarcodeResults(List<BarcodeResult> results) {
    StringBuffer sb = new StringBuffer();
    for (BarcodeResult result in results) {
      sb.write(result.format);
      sb.write("\n");
      sb.write(result.text);
      sb.write("\n\n");
    }
    if (results.isEmpty) sb.write("No QR Code Detected");
    return sb.toString();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
