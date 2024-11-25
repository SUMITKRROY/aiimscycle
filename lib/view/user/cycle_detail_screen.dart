import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_cubit.dart';
import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_modal.dart';
import 'package:aiimscycle/bloc/make_issue_req_cubit/make_issue_req_cubit.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cache_networkImage.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/database/table/cycle_table.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:aiimscycle/view/extra_screen/error_screen.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/location_cubit/location_cubit.dart';
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

  final String? distance = dotenv.env["distance"];

  @override
  void initState() {
    BlocProvider.of<CycleDetailCubit>(context).getCycleDetail(widget.cycleId.toString());
    super.initState();
  }

  Future<void> _refresh() async {
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
                          ClipRRect(borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              GetImageFromUrl.getImage(state.cycleModal.image2 ?? ''),
                              height: 300.h,
                              width: 400.w,
                              fit: BoxFit.cover,
                            ),
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
                                trailing: Text(
                                  textAlign: TextAlign.center,
                                  cycle.status.toString().toUpperCase(),
                                  style: TextStyle(fontSize: 16.sp, color: Colors.green),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Available',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                ),
                                trailing: Text(
                                  textAlign: TextAlign.center,
                                  cycle.available.toString().toUpperCase(),
                                  style: TextStyle(fontSize: 16.sp, color: Colors.green),
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
                                                cycleDetailModal: state.cycleModal,
                                                onTap: () {
                                                  context
                                                      .read<LocationCubit>()
                                                      .fetchLocationAndCalculateDistance(
                                                          targetLatitude: double.parse(state
                                                              .cycleModal.atPoint!.latitude
                                                              .toString()),
                                                          targetLongitude: double.parse(state
                                                              .cycleModal.atPoint!.longitude
                                                              .toString()))
                                                      .then((value) => Navigator.pop(context));
                                                  BlocProvider.of<MakeIssueReqCubit>(context)
                                                      .makeIssueReq(
                                                          cycleDetailModal: state.cycleModal);
                                                });
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
                return ErrorScreen(onPressed: (){
                  BlocProvider.of<CycleDetailCubit>(context).getCycleDetail(widget.cycleId.toString());

                },);
              }
              return ExceptionScreen();
            },
          );
        },
      ),
    );
  }

  void _showBookingDialog(
      {required BuildContext context,
      required Function()? onTap,
      required CycleDetailModal cycleDetailModal}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocListener<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationLoaded) {
              if (state.distance != null) {
                if (int.parse(state.distance!.toString().split('.').first) <= 50) {
                  Navigator.pop(context);
                  BlocProvider.of<MakeIssueReqCubit>(context)
                      .makeIssueReq(cycleDetailModal: cycleDetailModal);
                } else {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: Text("You are spoofing the GPS location"),
                      content: Text("So you cannot book the cycle"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                }
              }
            }
            if (state is LocationLoading) {
              Utils.showLoadingProgress(context);
            }
            if (state is LocationError) {
              Navigator.pop(context);
              Utils.snackbarToast(state.error);
            }
          },
          child: AlertDialog(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
