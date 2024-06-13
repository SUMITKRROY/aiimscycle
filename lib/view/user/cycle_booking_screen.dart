import 'package:aiimscycle/bloc/get_issue_req/get_issue_req_cubit.dart';

import 'package:aiimscycle/bloc/withdraw-issue-request/withdraw_issue_req_cubit.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:aiimscycle/view/user/cycle_detail_screen.dart';
import 'package:aiimscycle/view/user/drawer_screen.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appbar.dart';
import '../../components/cache_networkImage.dart';

class CycleBookingScreen extends StatefulWidget {
  final String cycleId;

  const CycleBookingScreen({
    Key? key,
    required this.cycleId,
  }) : super(key: key);

  @override
  State<CycleBookingScreen> createState() => _CycleBookingScreenState();
}

class _CycleBookingScreenState extends State<CycleBookingScreen> {
  bool onTap = true;
  bool status = false;
  int indexOfImage = 0;

  final List<String>? imageUrlList = [
    ImagePath.cycle,
    ImagePath.logo,
    ImagePath.cycle,
    ImagePath.logo,
  ];

  @override
  void initState() {
    BlocProvider.of<GetIssueReqCubit>(context).getCycleDetail(widget.cycleId);
    super.initState();
  }

  Future<void> _refresh() async {
    await BlocProvider.of<GetIssueReqCubit>(context).getCycleDetail(widget.cycleId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetIssueReqCubit, GetIssueReqState>(
      builder: (context, state) {
        if (state is GetIssueReqLoaded) {
          var cycleModal = state.getIssueReqModal;
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: const CustomAppBar(),
            ),
            drawer: DrawerWidget(),
            body: RefreshIndicator(
              onRefresh: () async {
                await _refresh();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                child: ListView(
                  children: [
                    Image.network(
                      GetImageFromUrl.getImage(state.getIssueReqModal.requestedFor?.image1 ?? ''),
                      height: 300.h,
                      width: 400.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Text(
                            'Cycle Id :- ${cycleModal.requestedFor?.id ?? ''}',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Product Title
                          Text(
                            '${cycleModal.requestedFor?.name ?? ''}',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Product Description
                          Text(
                            '${cycleModal.requestedFor?.category ?? ''}',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              cycleModal.requestedFor?.status ?? '',
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
                              '${cycleModal.requestedFor?.available.toString().toUpperCase()}',
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
                                '${state.getIssueReqModal.id}',
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
                              trailing: Text(
                                  state.getIssueReqModal.requestedOn.toString().substring(0, 10),
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
                              trailing: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          state.getIssueReqModal.status?.toUpperCase() == 'PENDING'
                                              ? Colors.amber
                                              : Colors.green,
                                      width: 2.sp),
                                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                                ),
                                child: Text(
                                  state.getIssueReqModal.status?.toUpperCase() ?? '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color:
                                          state.getIssueReqModal.status?.toUpperCase() == 'PENDING'
                                              ? Colors.amber
                                              : Colors.green),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    BlocListener<WithdrawIssueReqCubit, WithdrawIssueReqState>(
                      listener: (context, state) {
                        if (state is WithdrawIssueReqLoading) {
                          Utils.showLoadingProgress(context);
                        }
                        if (state is WithdrawIssueReqLoaded) {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                              (route) => false);
                        }
                        if (state is WithdrawIssueReqError) {
                          Navigator.pop(context);
                          Utils.snackbarToast(state.error);
                        }
                      },
                      child: getActionButton(
                          context: context,
                          status: cycleModal.status ?? '',
                          reqId: cycleModal.id.toString() ?? '',
                          cycleId: cycleModal.requestedFor?.id.toString() ?? ''),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is GetIssueReqLoading) {
          return Loader();
        }
        return ExceptionScreen();
      },
    );
  }

  ElevatedButton getActionButton({
    required BuildContext context,
    required String status,
    required String reqId,
    required String cycleId,
  }) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return ElevatedButton(
          onPressed: () {
            Utils.showDialogBox(
                context: context,
                label: "Withdraw Request",
                content: "Are you sure You want to Withdraw the request",
                onPressedClose: () {
                  Navigator.pop(context);
                },
                onPressedOk: () {
                  BlocProvider.of<WithdrawIssueReqCubit>(context).withdrawCycle(reqId);
                });
          },
          child: const Text('Withdraw'),
        );
      case 'ISSUED':
        return ElevatedButton(
          onPressed: () {
            // Utils.showDialogBox(
            //     context: context,
            //     label: "Are you sure ?",
            //     content: "You want to surrender your cycle",
            //     onPressedClose: () {
            //       Navigator.pop(context);
            //     },
            //     onPressedOk: () {
            //       BlocProvider.of<MakeSurrenderReqCubit>(context).makeSurrenderReq(cycleId);
            //     });
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => CycleDetailPage(cycleId: cycleId, Status: true)),
                (route) => false);
          },
          child: const Text('ok'),
        );
      // Add more cases if needed
      default:
        return ElevatedButton(
          onPressed: () {
            // Default action for other statuses
          },
          child: const Text('Unknown Status'),
        );
    }
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
              },
            ),
          ],
        );
      },
    );
  }
}
