import 'package:aiimscycle/bloc/admin/admin_cycle_req/admin_cycle_req_cubit.dart';
import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inventory_cubit.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/view/Admin/admin_surrender_screen.dart';
import 'package:aiimscycle/view/Admin/cycle_inventory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/admin/update_issue_req/update_issue_req_cubit.dart';
import '../user/drawer_screen.dart';
import 'admin_issue_screen.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CycleInventoryCubit(),
        ),
        BlocProvider(
          create: (context) => AdminCycleReqCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateIssueReqCubit(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 35.w),
              // labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              // indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              tabs: const [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.hail)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: CustomAppBar(),
            titleSpacing: 0,
          ),
          body: TabBarView(
            children: [
              CycleInventoryScreen(),
              // Container(),
              // Container(),
              AdminIssueScreen(),
              // Container()
              AdminSurrenderScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
