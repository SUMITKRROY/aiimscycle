import 'package:aiimscycle/bloc/admin/admin_cycle_req/admin_cycle_req_cubit.dart';
import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inventory_cubit.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/view/Admin/admin_cycle_detail_card.dart';
import 'package:aiimscycle/view/Admin/empty_cycle_container.dart';
import 'package:aiimscycle/view/extra_screen/error_screen.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/cache_networkImage.dart';
import '../../config/theamdata.dart';

class AdminSurrenderScreen extends StatefulWidget {
  const AdminSurrenderScreen({super.key});

  @override
  State<AdminSurrenderScreen> createState() => _AdminSurrenderScreenState();
}

class _AdminSurrenderScreenState extends State<AdminSurrenderScreen> {
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
          return state.adminSurrenderReqModal.isNotEmpty
              ? ListView.builder(
                  itemCount: state.adminSurrenderReqModal.length,
                  itemBuilder: (context, index) {
                    var cycleModal = state.adminSurrenderReqModal[index];
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
        if (state is AdminCycleReqError) {
          return ErrorScreen(onPressed: (){
            BlocProvider.of<AdminCycleReqCubit>(context).getAdminCycleReq();

          },);
        }
        return ExceptionScreen();
      },
    );
  }
}
