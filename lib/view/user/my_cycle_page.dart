import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cycle_page_two.dart';

class CycleDetailPage extends StatefulWidget {
  final String cycleId;

  CycleDetailPage({super.key, required this.cycleId});

  @override
  State<CycleDetailPage> createState() => _CycleDetailPageState();
}

class _CycleDetailPageState extends State<CycleDetailPage> {
  bool onTap = true;
  int indexOfImage = 0;

  final List<String>? imageUrlList = [
    ImagePath.cycle,
    ImagePath.logo,
    ImagePath.cycle,
    ImagePath.logo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
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
                    fit: BoxFit.fitHeight,
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
                    'Cycle Id :- ${widget.cycleId}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Product Title
                  Text(
                    'Cycle Name',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Product Description
                  Text(
                    'Categories',
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
                      'Available',
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
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 38.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Text(
                      'True',
                      style: TextStyle(fontSize: 16.sp, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20.h),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CycleDetailPageTwo(
                              cycleId: widget.cycleId,
                            )));
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
