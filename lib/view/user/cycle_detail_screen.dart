import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_cubit.dart';
import 'package:aiimscycle/bloc/make_issue_req_cubit/make_issue_req_cubit.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cache_networkImage.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/database/table/cycle_table.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:aiimscycle/view/user/exception_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/make_surrender_req/make_surrender_req_cubit.dart';
import '../../bloc/profile_cubit/profile_cubit.dart';
import 'cycle_booking_screen.dart';
import 'drawer_screen.dart';
import 'homeScreen.dart';

class CycleDetailPage extends StatefulWidget {
  final String cycleId;
  final bool Status;

  CycleDetailPage({
    super.key,
    required this.cycleId,
    required this.Status,
  });

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
    BlocProvider.of<CycleDetailCubit>(context).getCycleDetail(widget.cycleId.toString());
    super.initState();
  }

  Future<void> _refresh() async {
    // BlocProvider.of<CycleDetailCubit>(context).getCycleDetail('1715932804');
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      drawer: DrawerWidget(),
      body: BlocConsumer<CycleDetailCubit, CycleDetailState>(
        listener: (context, state) {
          // if (state is CycleDetailLoaded) {
          //   if (state.cycleModal.available.toString().toLowerCase() == 'false') {
          //     Utils.NotAvailableDialogBox(
          //         context, "Cycle is Not Available book", "Please scan another QR  ");
          //   }
          // }
        },
        builder: (context, state) {
          return BlocBuilder<CycleDetailCubit, CycleDetailState>(
            builder: (context, state) {
              if (state is CycleDetailLoaded) {
                var cycle = state.cycleModal;
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await _refresh();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                      ),
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(
                            GetImageFromUrl.getImage(state.cycleModal.image1 ?? ''),
                            height: 300.h,
                            width: 400.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 25.h),
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
                                SizedBox(height: 20.h),
                                // Product Title
                                Text(
                                  cycle.name ?? '',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                // Product Description
                                Text(
                                  cycle.category ?? '',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
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
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.all(Radius.circular(30.r))),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    cycle.status.toString().toUpperCase(),
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
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.all(Radius.circular(30.r))),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    cycle.available.toString().toUpperCase(),
                                    style: TextStyle(fontSize: 16.sp, color: Colors.green),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50.h),
                          state.cycleModal.available == true
                              ? SizedBox.shrink()
                              : BlocListener<MakeIssueReqCubit, MakeIssueReqState>(
                                  listener: (context, state) {
                                    if (state is MakeIssueReqLoading) {
                                      Utils.showLoadingProgress(context);
                                    }
                                    if (state is MakeIssueReqLoaded) {
                                      Navigator.pop(context);

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CycleBookingScreen(
                                                    cycleId: state.makeIssueReqModal.id.toString(),
                                                  )),
                                          (route) => false);
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => CycleBookingScreen(
                                      //               cycleId: state.makeIssueReqModal.id.toString(),
                                      //             )));
                                    }
                                    if (state is MakeIssueReqError) {
                                      Navigator.pop(context);
                                      Utils.snackbarToast(state.error);
                                    }
                                  },
                                  child: widget.Status != true
                                      ? ElevatedButton(
                                          onPressed: () {
                                            _showBookingDialog(
                                                context: context,
                                                onTap: () {
                                                  BlocProvider.of<MakeIssueReqCubit>(context)
                                                      .makeIssueReq(
                                                          cycleDetailModal: state.cycleModal);
                                                });
                                            // cycleInfo[CycleTable.cycleId] = cycle.id;
                                            // cycleInfo[CycleTable.name] = cycle.name;
                                            // cycleInfo[CycleTable.category] = cycle.category;
                                            // cycleInfo[CycleTable.status] = cycle.status;
                                            // cycleInfo[CycleTable.requestDate] = cycle.requestDate;
                                            // cycleInfo[CycleTable.reqId] = cycle.reqId;
                                            // cycleInfo[CycleTable.requestStatus] = cycle.requestStatus;
                                          },
                                          child: const Text('Book Now'),
                                        )
                                      : BlocListener<MakeSurrenderReqCubit, MakeSurrenderReqState>(
                                          listener: (context, state) {
                                            if (state is MakeSurrenderReqLoaded) {
                                              Navigator.pop(context);
                                              // home screen
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (contex) => HomeScreen()),
                                                  (route) => false);
                                            }
                                            if (state is MakeSurrenderReqLoading) {
                                              Utils.showLoadingProgress(context);
                                            }
                                            if (state is MakeSurrenderReqError) {
                                              Navigator.pop(context);
                                              Utils.snackbarToast(state.error);
                                            }
                                          },
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Utils.showDialogBox(
                                                  context: context,
                                                  label: "Surrender Cycle",
                                                  content:
                                                      "Are you sure You want to surrender the cycle",
                                                  onPressedClose: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onPressedOk: () {
                                                    BlocProvider.of<MakeSurrenderReqCubit>(context)
                                                        .makeSurrenderReq(widget.cycleId);
                                                  });
                                            },
                                            child: const Text('Surrender'),
                                          ),
                                        )),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is CycleDetailLoading) {
                return Loader();
              } else if (state is CycleDetailError) {
                return ExceptionScreen();
              }
              return ExceptionScreen();
            },
          );
        },
      ),
    );
  }

  void _showBookingDialog({required BuildContext context, required Function()? onTap}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book Cycle'),
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
              onPressed: onTap,
              // onPressed: () {
              //   Navigator.pop(context);
              //   CycleTable().insert(cycleInfo);
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => CycleDetailPageTwo(
              //                 cycle: cycle,
              //                 cycleId: widget.cycleId,
              //               )));
              // },
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
