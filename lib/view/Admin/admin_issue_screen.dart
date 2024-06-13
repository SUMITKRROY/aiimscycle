import 'package:aiimscycle/bloc/admin/admin_cycle_req/admin_cycle_req_cubit.dart';
import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inventory_cubit.dart';
import 'package:aiimscycle/bloc/admin/update_issue_req/update_issue_req_cubit.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/view/Admin/admin_cycle_detail_card.dart';
import 'package:aiimscycle/view/Admin/empty_cycle_container.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/cache_networkImage.dart';
import '../../config/theamdata.dart';
import '../../utils/utils.dart';

class AdminIssueScreen extends StatefulWidget {
  const AdminIssueScreen({super.key});

  @override
  State<AdminIssueScreen> createState() => _AdminIssueScreenState();
}

class _AdminIssueScreenState extends State<AdminIssueScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminCycleReqCubit>(context).getAdminCycleReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCycleReqCubit, AdminCycleReqState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AdminCycleReqLoading) {
          return Loader();
        }
        if (state is AdminCycleReqLoaded) {
          return state.adminIssueReqModal.isNotEmpty
              ? ListView.builder(
                  itemCount: state.adminIssueReqModal.length,
                  itemBuilder: (context, index) {
                    var cycleModal = state.adminIssueReqModal[index];
                    return AdminCycleDetailCard(
                        showButtonTab: true,
                        id: cycleModal.id.toString(),
                        imageOne: cycleModal.requestedFor?.image1 ?? '',
                        imageTwo: cycleModal.requestedFor?.image2 ?? '',
                        cycleId: cycleModal.requestedFor?.id.toString() ?? '',
                        cycleName: cycleModal.requestedFor?.name ?? '',
                        category: cycleModal.requestedFor?.category ?? '');
                  })
              : EmptyCycleContainer();
        }
        return ExceptionScreen();
      },
    );
  }
}
