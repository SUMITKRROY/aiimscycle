import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/admin/admin_cycle_req/admin_cycle_req_cubit.dart';
import '../../bloc/admin/update_issue_req/update_issue_req_cubit.dart';
import '../../components/cache_networkImage.dart';
import '../../config/theamdata.dart';
import '../../utils/utils.dart';

class AdminCycleDetailCard extends StatelessWidget {
  final String imageOne;
  final String imageTwo;
  final String cycleId;
  final String? id;
  final String cycleName;
  final String category;
  final bool? showButtonTab;

  // final void Function()? approveOnPressed;
  // final void Function()? rejectOnPressed;

  const AdminCycleDetailCard({
    super.key,
    required this.imageOne,
    required this.imageTwo,
    required this.cycleId,
    this.id,
    required this.cycleName,
    required this.category,
    this.showButtonTab = false,
    // this.approveOnPressed,
    // this.rejectOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateIssueReqCubit, UpdateIssueReqState>(
      listener: (context, state) {
        if (state is UpdateIssueReqLoading) {
          Utils.showLoadingProgress(context);
        }
        if (state is UpdateIssueReqLoaded) {
          Navigator.pop(context);
          BlocProvider.of<AdminCycleReqCubit>(context).getAdminCycleReq();
        }
        if (state is UpdateIssueReqError) {
          Navigator.pop(context);
          Utils.snackbarToast(state.error);
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        clipBehavior: Clip.antiAlias,
        color: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    GetImageFromUrl.getImage(imageOne),
                  ),
                ),
                title: Text(
                  cycleName,
                  style: const TextStyle(color: ColorsData.primaryPurpleColor),
                ),
                subtitle: Text(
                  cycleId,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                child: Image.network(
                  GetImageFromUrl.getImage(imageTwo),
                  height: 300.h,
                  width: 400.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "${category} The cycle is delivered in Semi-Assembled condition (90% assembled).",
                // style: TextStyle(color: ColorsData.primaryPurpleColor, fontSize: 24.sp),
              ),
              showButtonTab == true
                  ? ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {},
                          // onPressed: () => BlocProvider.of<UpdateIssueReqCubit>(context)
                          //     .updateIssueReq(id: id ?? '', status: true),
                          child: const Text('APPROVE'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {},
                          // onPressed: () => BlocProvider.of<UpdateIssueReqCubit>(context)
                          //     .updateIssueReq(id: id ?? '', status: false),
                          child: const Text('REJECT'),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
// approveOnPressed: () {
//   BlocProvider.of<UpdateIssueReqCubit>(context)
//       .updateIssueReq(id: cycleModal.id.toString() ?? '', status: true);
// },
// rejectOnPressed: () {
//   BlocProvider.of<UpdateIssueReqCubit>(context).updateIssueReq(
//       id: cycleModal.id.toString() ?? '', status: false);
// },
