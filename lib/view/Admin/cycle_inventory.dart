import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inventory_cubit.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/view/Admin/empty_cycle_container.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/admin/cycle_inventory_cubit/cycle_inventory_modal.dart';
import '../../components/cache_networkImage.dart';
import '../../config/theamdata.dart';
import 'admin_cycle_detail_card.dart';

class CycleInventoryScreen extends StatefulWidget {
  const CycleInventoryScreen({super.key});

  @override
  State<CycleInventoryScreen> createState() => _CycleInventoryScreenState();
}

class _CycleInventoryScreenState extends State<CycleInventoryScreen> {
  int itemsPerPage = 2;
  int currentPage = 0;

  List<CycleInventoryModal> getCurrentPageItems(List<CycleInventoryModal> cycleInventoryModal) {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (currentPage + 1) * itemsPerPage;
    return cycleInventoryModal.sublist(
        startIndex, endIndex > cycleInventoryModal.length ? cycleInventoryModal.length : endIndex);
  }

  // bool get hasMoreItems => (currentPage + 1) * itemsPerPage < cycleInventoryModal.length;

  bool hasMoreItems(List<CycleInventoryModal> cycleInventoryModal) {
    return (currentPage + 1) * itemsPerPage < cycleInventoryModal.length;
  }

  void loadMoreItems() {
    setState(() {
      itemsPerPage += 2; // Increase items per page by 10
    });
  }

  @override
  void initState() {
    BlocProvider.of<CycleInventoryCubit>(context).getCycleInv();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CycleInventoryCubit, CycleInventoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CycleInventoryLoading) {
          return Loader();
        }
        if (state is CycleInventoryLoaded) {
          return state.cycleInventoryModal.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          // reverse: true,
                          itemCount: getCurrentPageItems(state.cycleInventoryModal).length,
                          itemBuilder: (context, index) {
                            var cycleModal = state.cycleInventoryModal[index];
                            return AdminCycleDetailCard(
                                imageOne: cycleModal.image1 ?? '',
                                imageTwo: cycleModal.image2 ?? '',
                                cycleId: cycleModal.id.toString() ?? '',
                                cycleName: cycleModal.name ?? '',
                                category: cycleModal.category ?? '');
                          }),
                      if (hasMoreItems(state.cycleInventoryModal))
                        ElevatedButton(
                          onPressed: loadMoreItems,
                          child: Text('See More'),
                        ),
                    ],
                  ),
                )
              : EmptyCycleContainer();
        }
        return ExceptionScreen();
      },
    );
  }
}
