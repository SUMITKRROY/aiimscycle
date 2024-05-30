import 'package:aiimscycle/bloc/filter_log_cubit/filter_log_cubit.dart';
import 'package:aiimscycle/bloc/profile_cubit/profile_cubit.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/view/user/cycle_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../bloc/cycle_detail/cycle_detail_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/utils.dart';
import 'drawer_screen.dart';
import 'exception_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';

  Future<void> scanQrCode() async {
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(
            scanType: ScanType.qr,
            isShowFlashIcon: true,
          ),
        ));
    setState(() {
      if (res is String) {
        result = res;

        const String baseUrl = 'https://cfapplication.aiims.edu/aiims-cycle/raise-issue-request';

        // Parse the URL to get the id parameter
        Uri uri = Uri.parse(result);
        String? id = uri.queryParameters['id'];

        if ((uri.toString().startsWith(baseUrl) && id != null)) {
          print("uri --------- $result");
          print("id------ $id");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CycleDetailPage(
                      cycleId: id,
                    )
                //WebviewScreen(url: result),
                ),
          );
        } else {
          Utils.snackbarToast('Please scan the correct QR code');
        }
      } else {
        print('No data');
        Utils.snackbarToast('Improper Scan');
      }
    });
  }

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const CustomAppBar(),
          ),
          drawer: DrawerWidget(),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Book A Cycle Ride',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30.sp,
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CycleDetailPage(cycleId: '12313')));
                        // await scanQrCode();
                        // BlocProvider.of<FilterLogCubit>(context).getFilterDates(1);
                      },
                      child: Transform.scale(
                        scale: 1.4,
                        child: Lottie.asset(
                          ImagePath.qrLottie,
                          width: double.maxFinite,
                          height: 400.h,
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ElevatedButton(
                      onPressed: () async {
                        await scanQrCode();
                      },
                      child: const Text('Press to Scan Cycle QR Code'),
                    ),
                  ),
                ],
              ),
            ),
          ));
    } catch (e) {
      return ExceptionScreen();
    }
  }
}
