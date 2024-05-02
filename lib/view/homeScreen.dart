import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/view/scanner_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_camera_qrcode_scanner/dynamsoft_barcode.dart';
import 'package:flutter_camera_qrcode_scanner/flutter_camera_qrcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/appbar.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const CustomAppBar(),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ScannerScreen()));
                  },
                  child: Image.asset(
                    width: 600.h,
                    height: 600.h,
                    ImagePath.qrScan,
                  )),
              Transform.translate(
                offset: Offset(0, -100.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ScannerScreen()));
                  },
                  child: Text("Scan Your Cycle"),
                ),
              ),
            ],
          ),
        ));
  }
}
