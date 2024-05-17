import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import 'exception_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late PermissionStatus _permissionStatus;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    PermissionStatus status = await Permission.camera.status;

    setState(() {
      _permissionStatus = status;
    });
    if (_permissionStatus == PermissionStatus.denied) {
      await _requestPermission();
    }
  }

  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.camera.request();
    setState(() {
      _permissionStatus = status;
    });
  }

  final String screenName = 'ScannerScreen';

  String result = '';

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const CustomAppBar(),
        ),
        // drawer: DrawerWidget(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_permissionStatus == PermissionStatus.granted)
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SimpleBarcodeScannerPage(),
                            ));
                        setState(() {
                          if (res is String) {
                            result = res;
                          }
                        });
                      },
                      child: const Text('Open Scanner'),
                    ),
                    Text(result),
                  ],
                ),
              if (_permissionStatus == PermissionStatus.restricted)
                Text('Please allow camera permission'),
              if (_permissionStatus == PermissionStatus.denied)
                ElevatedButton(
                  onPressed: () {
                    _requestPermission();
                  },
                  child: Text('Allow Camera Permission'),
                ),
            ],
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

  @override
  void dispose() {
    super.dispose();
  }
}
// Column(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//     Container(
//       height: 100,
//       child: SingleChildScrollView(
//         child: Text(
//           _barcodeResults,
//           style: const TextStyle(fontSize: 14, color: Colors.white),
//         ),
//       ),
//     ),
//     // SizedBox(
//     //   height: 100,
//     //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
//     //     ElevatedButton(
//     //       onPressed: () async {
//     //         controller!.startScanning();
//     //       },
//     //       child: const Text("Start Scan"),
//     //     ),
//     //     ElevatedButton(
//     //       onPressed: () async {
//     //         controller!.stopScanning();
//     //         Navigator.pop(context);
//     //       },
//     //       child: const Text("Stop Scan"),
//     //     ),
//     //   ]),
//     // ),
//   ],
// )
