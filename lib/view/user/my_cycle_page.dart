import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/database/table/cycle_table.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cycle_page_two.dart';
import 'drawer_screen.dart';
import 'homeScreen.dart';

class CycleDetailPage extends StatefulWidget {
  final String cycleId;
  final bool bookingStatus;

  CycleDetailPage({super.key, required this.cycleId, required this.bookingStatus});

  @override
  State<CycleDetailPage> createState() => _CycleDetailPageState();
}

class _CycleDetailPageState extends State<CycleDetailPage> {
  bool onTap = true;
  int indexOfImage = 0;

  late CycleModal cycle;

  // final List<String>? imageUrlList = [
  //   'assets/cycle/4.jpg',
  //   'assets/cycle/1.jpg',
  //   'assets/cycle/2.jpg',
  //   'assets/cycle/3.jpg',
  // ];
  final List<String>? imageUrlList = [
    ImagePath.cycle,
    ImagePath.logo,
    ImagePath.cycle,
    ImagePath.logo,
  ];
  Map<String, dynamic> cycleInfo = {};

  @override
  void initState() {
    cycle = CycleModal(
      id: widget.cycleId,
      name: "Cycle Name",
      category: "Cycle Category",
      status: "Available",
      available: true,
      reqId: 10113223,
      requestDate: DateTime.now().toString().substring(0, 10),
      requestStatus: 'Pending',
    );
    // cycle =
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              // color: Colors.green,
              width: double.maxFinite,
              height: 410.h,
              child: Stack(
                children: [
                  Image.asset(
                    imageUrlList![indexOfImage],
                    height: 300.h,
                    width: 400.w,
                    fit: BoxFit.cover,
                  ),
                  imageUrlList!.length > 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: 400.w,
                              alignment: Alignment.center,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imageUrlList?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            indexOfImage = index;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context).size.height * 0.01),
                                          width: MediaQuery.of(context).size.height * 0.08,
                                          child: Image.asset(
                                            imageUrlList![index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            // Product Image and Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    'Cycle Id :- ${cycle.id}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Product Title
                  Text(
                    '${cycle.name}',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Product Description
                  Text(
                    '${cycle.category}',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 16.h),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Text(
                      '${cycle.status}',
                      style: TextStyle(fontSize: 16.sp, color: Colors.green),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Available',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Text(
                      '${cycle.available}',
                      style: TextStyle(fontSize: 16.sp, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20.h),
            widget.bookingStatus
                ? ElevatedButton(
                    onPressed: () {
                      _showSurrenderDialog(context);
                      CycleTable().deleteAllCycles();
                    },
                    child: const Text('Surrender'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      _showBookingDialog(context);
                      cycleInfo[CycleTable.cycleId] = cycle.id;
                      cycleInfo[CycleTable.name] = cycle.name;
                      cycleInfo[CycleTable.category] = cycle.category;
                      cycleInfo[CycleTable.status] = cycle.status;
                      cycleInfo[CycleTable.requestDate] = cycle.requestDate;
                      cycleInfo[CycleTable.reqId] = cycle.reqId;
                      cycleInfo[CycleTable.requestStatus] = cycle.requestStatus;
                    },
                    child: const Text('Book Now'),
                  ),
          ],
        ),
      ),
    );
  }

  void _showSurrenderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Surrender'),
          content: Text('Are you sure you want to surrender?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book'),
          content: Text('Are you sure you want to Book a cycle?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                CycleTable().insert(cycleInfo);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CycleDetailPageTwo(
                              cycle: cycle,
                              cycleId: widget.cycleId,
                            )));
              },
            ),
          ],
        );
      },
    );
  }
}

class CycleModal {
  final String id;
  final String name;
  final String category;
  final String status;
  final bool available;
  final int reqId;
  final String requestDate;
  final String requestStatus;

  CycleModal({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.available,
    required this.reqId,
    required this.requestDate,
    required this.requestStatus,
  });
}
