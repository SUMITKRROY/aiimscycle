import 'package:flutter/cupertino.dart';
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
      // drawer: DrawerWidget(),
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
            SizedBox(
              height: 100,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    controller!.startScanning();
                  },
                  child: const Text("Start Scan"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    controller!.stopScanning();
                  },
                  child: const Text("Stop Scan"),
                ),
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
