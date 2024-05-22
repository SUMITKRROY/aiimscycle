import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:aiimscycle/view/user/my_cycle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appbar.dart';

class CycleDetailPageTwo extends StatefulWidget {
  final CycleModal cycle;

  final String cycleId;

  CycleDetailPageTwo({Key? key, required this.cycleId, required this.cycle}) : super(key: key);

  @override
  State<CycleDetailPageTwo> createState() => _CycleDetailPageTwoState();
}

class _CycleDetailPageTwoState extends State<CycleDetailPageTwo> {
  bool onTap = true;
  bool status = false;
  int indexOfImage = 0;

  // final List<String>? imageUrlList = [
  //   'assets/cycle/4.jpg',
  // ];
  final List<String>? imageUrlList = [
    ImagePath.cycle,
    ImagePath.logo,
    ImagePath.cycle,
    ImagePath.logo,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                height: 280.h,
                child: Stack(
                  children: [
                    Image.asset(
                      imageUrlList![indexOfImage],
                      height: 265.h,
                      width: 400.w,
                      fit: BoxFit.fitHeight,
                    ),
                    // imageUrlList!.length > 1
                    //     ? Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 10),
                    //         child: Align(
                    //           alignment: Alignment.bottomCenter,
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               color: Colors.black.withOpacity(0.3),
                    //             ),
                    //             height: MediaQuery.of(context).size.height * 0.1,
                    //             width: 400.w,
                    //             alignment: Alignment.center,
                    //             child: ListView.builder(
                    //                 shrinkWrap: true,
                    //                 primary: false,
                    //                 scrollDirection: Axis.horizontal,
                    //                 itemCount: imageUrlList?.length,
                    //                 itemBuilder: (context, index) {
                    //                   return Padding(
                    //                     padding: const EdgeInsets.symmetric(horizontal: 5),
                    //                     child: GestureDetector(
                    //                       onTap: () {
                    //                         setState(() {
                    //                           indexOfImage = index;
                    //                         });
                    //                       },
                    //                       child: Container(
                    //                         padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    //                         width: MediaQuery.of(context).size.height * 0.08,
                    //                         child: Image.asset(
                    //                           imageUrlList![index],
                    //                           fit: BoxFit.cover,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   );
                    //                 }),
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                  ],
                ),
              ),
              // Product Image and Details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      'Cycle Id :- ${widget.cycleId}',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Product Title
                    Text(
                      '${widget.cycle.name}',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Product Description
                    Text(
                      '${widget.cycle.category}',
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
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30.r))),
                      child: Text(
                        '${widget.cycle.status}',
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
                        '${widget.cycle.available}',
                        style: TextStyle(fontSize: 16.sp, color: Colors.green),
                      ),
                    ),
                  ),
                  Divider(),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Req Id',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        trailing: Text(
                          // "",
                          '${widget.cycle.reqId}',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Request Date',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        trailing: Text("${widget.cycle.requestDate}",
                            //Text(DateTime.now().toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 16.sp,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          'Status',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              status = !status; // Toggle status on tap
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber, width: 2.sp),
                              borderRadius: BorderRadius.all(Radius.circular(30.r)),
                            ),
                            child: Text(
                              status ? 'Approve' : 'Pending',
                              style: TextStyle(fontSize: 16.sp, color: Colors.amber),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              status == true
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CycleDetailPage(
                                      cycleId: widget.cycleId,
                                      bookingStatus: true,
                                    )),
                            (route) => false);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CycleDetailPage(
                        //               cycleId: widget.cycleId,
                        //               bookingStatus: true,
                        //             )));
                      },
                      child: const Text('Ok'),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        _showSurrenderDialog(context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CycleDetailPage(cycleId: widget.cycleId)));
                      },
                      child: const Text('Cancel'),
                    ),
              // SizedBox(height: 20.h),
            ],
          ),
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
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
            ),
          ],
        );
      },
    );
  }
}
